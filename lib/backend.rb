require 'date'

class Backend
  attr_reader :balance
  def initialize
    @balance = 0
    @statement_record = []
  end

  def deposit(money, date = DateTime.now)
    @date = date
    @balance_change = money
    @balance += @balance_change
    current_balance = @balance
    @statement_record.push("#{@date.strftime("%d/%m/%Y")} || || #{'%.2f' % @balance_change} || #{'%.2f' % current_balance}")
  end

  def withdraw(money, date = DateTime.now)
    @date = date
    @balance_change = money
    @balance -= @balance_change
    current_balance = @balance
    @statement_record.push("#{@date.strftime("%d/%m/%Y")} || #{'%.2f' % @balance_change} || || #{'%.2f' % current_balance}")
  end

 def print_statement
   statement_titile = "date || credit || debit || balance\n"
   statement_records = @statement_record.reverse.join("\n")
   statement = statement_titile + statement_records
   statement
 end


end
