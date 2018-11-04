module CoinHelper
  def add_coin(user, c)
    coin = Coin.new
    coin.user_id = user
    coin.coin = c
    coin.save
  end

  def amount_coin(user)
    amount =  Coin.where(user_id: user).sum(:coin)
    return amount
  end
end
