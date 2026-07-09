json.extract! evento, :id, :cliente_id, :tipo, :data, :hora, :local, :valor, :sinal, :restante, :situacao, :equipe, :observacoes, :created_at, :updated_at
json.url evento_url(evento, format: :json)
