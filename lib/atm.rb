require_relative "./account"

class Atm
  def initialize(client_account =  Account.new)
    @client_account = client_account
  end

  def start_service
    puts "Choose one of the following 'Deposit','Withdraw', 'Print Statement'"
    choice = gets.chomp
    case choice
    when "Deposit"
      puts "How much to deposit"
      money = gets.chomp.to_f
      write_to_account(choice,money)
    when "Withdraw"
      puts "How much to withdraw"
      money = -(gets.chomp.to_f)
      write_to_account(choice,money)
    when "Print Statement"
      print_from_account
    end
  end

  private
  def write_to_account(choice, money)
    @client_account.deposit(money, date = DateTime.now)
  end

  def print_from_account
    puts @client_account.print_statement
  end

end
