require 'date'

class Backend
  attr_reader :balance
  def initialize
    @balance = 0
  end

  def deposit(money, date = DateTime.now)
    @date = date.strftime("%d/%m/%Y") #=> "11/06/2017 18:11"
    @balance_change = money
    @balance += @balance_change
  end




end
