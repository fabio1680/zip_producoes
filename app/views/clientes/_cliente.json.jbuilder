json.extract! cliente, :id, :nome, :cpf, :telefone, :whatsapp, :email, :endereco, :cidade, :estado, :cep, :observacoes, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
