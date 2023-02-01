def stock_picker(chart)
  buy_price = chart[0]
  buy_day = 0
  sell_price = chart[0]
  sell_day = 0
  profit = sell_price - buy_price
  chart.each_with_index do |price, day|
    if price - buy_price > profit and buy_day < day
      sell_price = price
      sell_day = day
      profit = sell_price - buy_price
    end
    if price < buy_price
      chart.drop(day).each do |future_price|
        if future_price - price > profit
          buy_price = price
          buy_day = day
        end
      end
    end
  end
  [buy_day, sell_day]
end
p stock_picker([17,3,6,9,15,8,6,1,10])