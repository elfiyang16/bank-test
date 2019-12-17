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
      write_to_backend(choice,money)
    when "Withdraw"
      money = -(gets.chomp.to_f)
      write_to_backend(choice,money)
    when "Print Statement"
      print_from_backend
    end
  end

  private
  def write_to_backend(choice, money)
    @client_backend.deposit(money, date = DateTime.now)  
  end

  def print_from_backend
    puts @client_backend.print_statement
  end

end
