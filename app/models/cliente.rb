class Cliente < ApplicationRecord
    has_many :eventos, dependent: :destroy
end
