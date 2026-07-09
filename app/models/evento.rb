class Evento < ApplicationRecord
  belongs_to :cliente

  validates :tipo, presence: true
  validates :data, presence: true
  validates :local, presence: true
end
