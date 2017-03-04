class UserStock
  include Mongoid::Document
  field :user_id, type: Integer
  field :stock_id, type: Integer

  belongs_to :user
  belongs_to :stock
end
