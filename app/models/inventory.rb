class Inventory < ApplicationRecord
    belongs_to :survivor
    belongs_to :item
end
