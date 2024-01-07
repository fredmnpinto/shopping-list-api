class Item < ApplicationRecord
  belongs_to :group
  belongs_to :author, class_name: 'User'
end
