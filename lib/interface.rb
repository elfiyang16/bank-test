require "backend"

class Interface
  def initialize(client_backend =  Backend.new)
    @client_backend = client_backend
  end

  def start_service
    puts "Choose one of the following 'Deposit','Withdraw', 'Print Statement'"
    # choice = gets.chomp
  end




end
