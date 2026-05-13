CREATE schema if not exists gestao_epis;

CREATE TABLE gestao_epis.setor (
    id_setor INT generated always as identity PRIMARY KEY,
    nome_setor VARCHAR(80) NOT NULL,
    responsavel VARCHAR(100),
    turno VARCHAR(100)
);

CREATE TABLE gestao_epis.inspecao_epi (
    id_inspecao INT generated always as identity PRIMARY KEY,
    data_inspecao date,
    resultado varchar(20)
);

CREATE TABLE gestao_epis.fornecedor (
    id_fornecedor INT generated always as identity PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL,
    valor REAL NOT NULL
);

CREATE TABLE gestao_epis.funcionario (
    id_funcionario INT generated always as identity PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11),
    cargo VARCHAR(80),
    id_setor INT,
    id_inspecao INT,
    turno VARCHAR(20) DEFAULT 'Primeiro',
    status boolean DEFAULT true,
    FOREIGN KEY (id_setor)
        REFERENCES gestao_epis.setor (id_setor),
    FOREIGN KEY (id_inspecao)
        REFERENCES gestao_epis.inspecao_epi (id_inspecao) ON DELETE RESTRICT
);

CREATE TABLE gestao_epis.epi (
    id_epi INT generated always as identity PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(60),
    numero_ca VARCHAR(20),
    fabricante VARCHAR(80),
    dt_validade DATE,
    id_inspecao INT,
    FOREIGN KEY (id_inspecao)
        REFERENCES gestao_epis.inspecao_epi (id_inspecao) ON DELETE RESTRICT
);

CREATE TABLE gestao_epis.estoque (
    id_estoque INT generated always as identity PRIMARY KEY,
    id_epi INT NOT NULL,
    id_fornecedor INT,
    qtd_disponivel INT NOT NULL DEFAULT 0,
    lote VARCHAR(40),
    FOREIGN KEY (id_epi)
        REFERENCES gestao_epis.epi (id_epi) ON DELETE RESTRICT,
    FOREIGN KEY (id_fornecedor)
        REFERENCES gestao_epis.fornecedor (id_fornecedor) ON DELETE RESTRICT
);

CREATE TABLE gestao_epis.entrega (
    id_entrega INT generated always as identity PRIMARY KEY,
    id_funcionario INT NOT NULL,
    id_epi INT NOT NULL,
    id_estoque INT,
    dt_entrega DATE NOT NULL,
    quantidade INT DEFAULT 1 NOT NULL,
    dt_devolucao DATE,
    observacao TEXT,
    assinatura BOOLEAN DEFAULT FALSE NOT NULL,
    FOREIGN KEY (id_funcionario)
        REFERENCES gestao_epis.funcionario (id_funcionario),
    FOREIGN KEY (id_epi)
        REFERENCES gestao_epis.epi (id_epi),
    FOREIGN KEY (id_estoque)
        REFERENCES gestao_epis.estoque (id_estoque) ON DELETE RESTRICT
);

CREATE TABLE gestao_epis.fabricante (
    id INT generated always as identity PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18)
);

CREATE TABLE gestao_epis.profile (
    id_profile INT generated always as identity PRIMARY KEY,
    email varchar(100) NOT NULL,
    name varchar(128),
    created_at TIMESTAMP DEFAULT NOW()
);

-- Inserir alguns setores de exemplo
INSERT INTO gestao_epis.setor (nome_setor, responsavel, turno) VALUES
  ('Administrativo', 'João Silva', 'Primeiro'),
  ('Produção', 'Maria Santos', 'Primeiro'),
  ('Manutenção', 'Pedro Costa', 'Segundo'),
  ('Qualidade', 'Ana oliveira', 'Primeiro'),
  ('Logística', 'Carlos Pereira', 'Terceiro');

-- Criar índices para melhor performance
CREATE INDEX idx_funcionario_setor_id ON gestao_epis.funcionario(id_setor);
CREATE INDEX idx_funcionario_status ON gestao_epis.funcionario(status);
CREATE INDEX idx_funcionario_nome ON gestao_epis.funcionario(nome);
CREATE INDEX idx_epi_entrega ON gestao_epis.entrega(dt_entrega);

-- Habilitar RLS
ALTER TABLE gestao_epis.setor ENABLE ROW LEVEL SECURITY;
ALTER TABLE gestao_epis.funcionario ENABLE ROW LEVEL SECURITY;
ALTER TABLE gestao_epis.epi ENABLE ROW LEVEL SECURITY;
ALTER TABLE gestao_epis.estoque ENABLE ROW LEVEL SECURITY;
ALTER TABLE gestao_epis.fornecedor ENABLE ROW LEVEL SECURITY;
ALTER TABLE gestao_epis.entrega ENABLE ROW LEVEL SECURITY;
ALTER TABLE gestao_epis.inspecao_epi ENABLE ROW LEVEL SECURITY;
ALTER TABLE gestao_epis.fabricante ENABLE ROW LEVEL SECURITY;
ALTER TABLE gestao_epis.profile ENABLE ROW LEVEL SECURITY;

-- Políticas RLS para tabelas públicas
CREATE POLICY "Permitir leitura pública" ON gestao_epis.setor FOR SELECT USING (true);
CREATE POLICY "Permitir leitura pública" ON gestao_epis.epi FOR SELECT USING (true);
CREATE POLICY "Permitir leitura pública" ON gestao_epis.fornecedor FOR SELECT USING (true);
CREATE POLICY "Permitir leitura pública" ON gestao_epis.funcionario FOR SELECT USING (true);
CREATE POLICY "Permitir leitura pública" ON gestao_epis.fabricante FOR SELECT USING (true);

-- Políticas RLS para usuários autenticados
CREATE POLICY "Permitir inserção para autenticados" ON gestao_epis.funcionario FOR INSERT WITH CHECK (auth.role() = 'authenticated');
CREATE POLICY "Permitir atualização para autenticados" ON gestao_epis.funcionario FOR UPDATE USING (auth.role() = 'authenticated');
CREATE POLICY "Permitir exclusão para autenticados" ON gestao_epis.funcionario FOR DELETE USING (auth.role() = 'authenticated');

CREATE POLICY "Permitir inserção para autenticados" ON gestao_epis.epi FOR INSERT WITH CHECK (auth.role() = 'authenticated');
CREATE POLICY "Permitir atualização para autenticados" ON gestao_epis.epi FOR UPDATE USING (auth.role() = 'authenticated');
CREATE POLICY "Permitir exclusão para autenticados" ON gestao_epis.epi FOR DELETE USING (auth.role() = 'authenticated');

CREATE POLICY "Permitir inserção para autenticados" ON gestao_epis.entrega FOR INSERT WITH CHECK (auth.role() = 'authenticated');
CREATE POLICY "Permitir atualização para autenticados" ON gestao_epis.entrega FOR UPDATE USING (auth.role() = 'authenticated');
CREATE POLICY "Permitir exclusão para autenticados" ON gestao_epis.entrega FOR DELETE USING (auth.role() = 'authenticated');