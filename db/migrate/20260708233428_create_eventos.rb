class CreateEventos < ActiveRecord::Migration[8.1]
  def change
    create_table :eventos do |t|
      t.references :cliente, null: false, foreign_key: true
      t.string :tipo
      t.date :data
      t.time :hora
      t.string :local
      t.decimal :valor
      t.decimal :sinal
      t.decimal :restante
      t.string :situacao
      t.string :equipe
      t.text :observacoes

      t.timestamps
    end
  end
end
