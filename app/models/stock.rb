class Stock
  include Mongoid::Document
  field :ticker, type: String
  field :name, type: String
  field :last_price, type: Decimal

  def self.new_from_lookup(ticker_symbol)
  end
end
