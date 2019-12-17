require "backend"

class Interface
  def initialize(client_backend =  Backend.new)
    @client_backend = client_backend
  end

  def start_service
    puts "Choose one of the following 'Deposit','Withdraw', 'Print Statement'"
    choice = gets.chomp
    case choice
    when "Deposit"
      money = gets.chomp.to_f
      @client_backend.deposit(money, date = DateTime.now)
    when "Withdraw"
      money = gets.chomp.to_f
      @client_backend.withdraw(money, date = DateTime.now)
    when "Print Statement"
      puts @client_backend.print_statement
    end
  end




end
