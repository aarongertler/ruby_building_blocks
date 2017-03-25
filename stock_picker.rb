# Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.
#
#     > stock_picker([17,3,6,9,15,8,6,1,10])
#     => [1,4]  # for a profit of $15 - $3 == $12
#
# You need to buy before you can sell
# Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.

def stock_picker(stocks)
  buy_day, sell_day, max_profit = 0, 0, 0
  for i in (0...stocks.length - 1)
    buy, possible_sales = stocks[i], stocks[i+1..-1]
    best_sale = possible_sales.max # Find the best price we can still sell for
    current_profit = best_sale - buy
    if current_profit > max_profit
      max_profit = current_profit # New standard we'll have to beat
      buy_day = i + 1   # If i is 0, we should buy on day 1
      sell_day = sales.index(best_sale) + buy_day + 1 # Add 1 in both cases to correct for indexing
    end
  end
  print [buy_day,sell_day]
end

puts stock_picker([17,3,6,9,15,8,6,1,10])

puts stock_picker([1,2,20,3,30,1])

puts stock_picker([5,4,3,2,1]) # Should output [0,0] when we can't make a profit