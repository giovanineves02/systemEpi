-- Criar tabela de setores
CREATE TABLE setor (
  id_setor SERIAL PRIMARY KEY,
  nome_setor VARCHAR(255) NOT NULL UNIQUE,
  responsavel VARCHAR(255),
  turno VARCHAR(50),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Criar tabela de funcionários
CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  document VARCHAR(50) NOT NULL,
  position VARCHAR(255) NOT NULL,
  setor_id INTEGER REFERENCES setor(id_setor),
  shift VARCHAR(50) NOT NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'ativo',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Inserir alguns setores de exemplo
INSERT INTO setor (nome_setor) VALUES
  ('Administrativo'),
  ('Produção'),
  ('Manutenção'),
  ('Qualidade'),
  ('Logística');

-- Criar índices para melhor performance
CREATE INDEX idx_employees_setor_id ON employees(setor_id);
CREATE INDEX idx_employees_status ON employees(status);
CREATE INDEX idx_employees_name ON employees(name);

-- Políticas RLS (Row Level Security) para setores
ALTER TABLE setor ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Permitir leitura de setores para todos" ON setor FOR SELECT USING (true);
CREATE POLICY "Permitir inserção de setores para usuários autenticados" ON setor FOR INSERT WITH CHECK (auth.role() = 'authenticated');
CREATE POLICY "Permitir atualização de setores para usuários autenticados" ON setor FOR UPDATE USING (auth.role() = 'authenticated');
CREATE POLICY "Permitir exclusão de setores para usuários autenticados" ON setor FOR DELETE USING (auth.role() = 'authenticated');

-- Políticas RLS (Row Level Security) para funcionários
ALTER TABLE employees ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Permitir leitura de funcionários para todos" ON employees FOR SELECT USING (true);
CREATE POLICY "Permitir inserção de funcionários para usuários autenticados" ON employees FOR INSERT WITH CHECK (auth.role() = 'authenticated');
CREATE POLICY "Permitir atualização de funcionários para usuários autenticados" ON employees FOR UPDATE USING (auth.role() = 'authenticated');
CREATE POLICY "Permitir exclusão de funcionários para usuários autenticados" ON employees FOR DELETE USING (auth.role() = 'authenticated');