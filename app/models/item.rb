class Item < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_one :group, through: :author

  validates_presence_of :name, :quantity, :author

end
