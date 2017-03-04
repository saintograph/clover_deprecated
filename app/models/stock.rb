class Stock
  include Mongoid::Document
  field :ticker, type: String
  field :name, type: String
  field :last_price, type: Money

  has_many :user_stocks
  # has_many :user, through: :user_stocks

  def users
    User.in(id: user_stocks.pluck(:stock_id))
  end


  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end

  def self.new_from_lookup(ticker_symbol)
    looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
    return nil unless looked_up_stock.name

    new_stock = new(ticker: looked_up_stock.symbol, name: looked_up_stock.name,)
    new_stock.last_price = new_stock.price
    new_stock
  end

  def price
    closing_price = Money.new(StockQuote::Stock.quote(ticker).close, 'USD')
    return ("#{closing_price} (Closing)" if closing_price) unless closing_price.zero?

    opening_price = Money.new(StockQuote::Stock.quote(ticker).open, 'USD')
    return "#{opening_price} (Opening)" if opening_price

    'Unavailable'
  end

end
