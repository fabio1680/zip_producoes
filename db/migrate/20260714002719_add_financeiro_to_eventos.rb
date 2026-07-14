class AddFinanceiroToEventos < ActiveRecord::Migration[8.1]
  def change
    add_column :eventos, :forma_pagamento, :string unless column_exists?(:eventos, :forma_pagamento)

    add_column :eventos, :data_pagamento, :date unless column_exists?(:eventos, :data_pagamento)
  end
end