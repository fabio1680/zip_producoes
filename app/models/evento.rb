class Evento < ApplicationRecord
  belongs_to :cliente

  before_save :calcular_financeiro

  private

  def calcular_financeiro
    self.valor ||= 0
    self.entrada ||= 0
    self.recebido ||= entrada

    self.restante = valor - recebido

    if restante <= 0
      self.restante = 0
      self.status_pagamento = "Pago"
    elsif recebido > 0
      self.status_pagamento = "Parcial"
    else
      self.status_pagamento = "Pendente"
    end
  end
end
