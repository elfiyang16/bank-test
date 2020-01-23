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
    calculate_balance(@balance_change)
    record_transaction(@date, @balance_change, current_balance = @balance)
    @balance
  end

  def withdraw(money, date = DateTime.now)
    @date = date
    @balance_change = -(money)
    calculate_balance(@balance_change)
    record_transaction(@date, @balance_change, current_balance = @balance)
    @balance
  end

 def print_statement
   statement_titile = "date || credit || debit || balance\n"
   statement_end = "\n"
   statement_records = @statement_record.reverse.join("\n")
   statement = statement_titile + statement_records+statement_end
   statement
 end

private
def calculate_balance(balance_change)
  @balance += @balance_change
end

def record_transaction(date, balance_change, current_balance)
  if balance_change >= 0
    @statement_record.push("#{date.strftime("%d/%m/%Y")} || #{'%.2f' % balance_change} || || #{'%.2f' % current_balance}")
  else
    @statement_record.push("#{date.strftime("%d/%m/%Y")} || || #{'%.2f' % -(balance_change)} || #{'%.2f' % current_balance}")
  end
end

end
