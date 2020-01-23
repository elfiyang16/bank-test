require 'date'
require_relative './statement'

class Account
  def initialize(client_statement = Statement.new)
    @balance = 0
    @client_statement = client_statement
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
   @client_statement.format_statement
 end

private
  def calculate_balance(balance_change)
    @balance += @balance_change
  end

  def record_transaction(date, balance_change, current_balance)
    if balance_change >= 0
      @client_statement.record_deposit(date, balance_change, current_balance)
    else
      @client_statement.record_withdraw(date, balance_change, current_balance)
    end
  end
end
