class DashboardController < ApplicationController

  def clientes

    @total_clientes = Cliente.count

    @clientes = Cliente.order(created_at: :desc)
                       .limit(5)

    @eventos = Evento.count

  end

end