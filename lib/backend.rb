require 'date'

class Backend
  attr_reader :balance
  def initialize
    @balance = 0
    @statement_record = []
  end

  def deposit(money, date = DateTime.now)
    @date = date #=> "11/06/2017 18:11"
    @balance_change = money
    @balance += @balance_change
    @statement_record.push("#{@date.strftime("%d/%m/%Y")} || || #{'%.2f' % @balance_change} || #{'%.2f' % @balance}")
  end

  def withdraw(money, date = DateTime.now)
    @date = date.strftime("%d/%m/%Y")
    @balance_change = money
    @balance -= @balance_change
  end

 def print_statement
   statement_titile = "date || credit || debit || balance\n"
   statement_records = @statement_record.reverse.join("\n")
   statement = statement_titile + statement_records
   statement
 end


end
