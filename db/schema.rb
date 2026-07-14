# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_07_14_002719) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "clientes", force: :cascade do |t|
    t.string "cep"
    t.string "cidade"
    t.string "cpf"
    t.datetime "created_at", null: false
    t.string "email"
    t.string "endereco"
    t.string "estado"
    t.string "nome"
    t.text "observacoes"
    t.string "telefone"
    t.datetime "updated_at", null: false
    t.string "whatsapp"
  end

  create_table "eventos", force: :cascade do |t|
    t.bigint "cliente_id", null: false
    t.datetime "created_at", null: false
    t.date "data"
    t.decimal "entrada"
    t.string "equipe"
    t.time "hora"
    t.string "local"
    t.text "observacoes"
    t.decimal "recebido"
    t.decimal "restante"
    t.decimal "sinal"
    t.string "situacao"
    t.string "status_pagamento"
    t.string "tipo"
    t.datetime "updated_at", null: false
    t.decimal "valor"
    t.index ["cliente_id"], name: "index_eventos_on_cliente_id"
  end

  add_foreign_key "eventos", "clientes"
end
