class CreateClientes < ActiveRecord::Migration[8.1]
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :cpf
      t.string :telefone
      t.string :whatsapp
      t.string :email
      t.string :endereco
      t.string :cidade
      t.string :estado
      t.string :cep
      t.text :observacoes

      t.timestamps
    end
  end
end
