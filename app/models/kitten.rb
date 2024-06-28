class Kitten < ApplicationRecord
    validates :name, presence: true, length:{minimum: 3}
    validates :age, presence: true
end
