require_relative "../lib/interface"

describe Interface do
  let(:new_interface){described_class.new(new_backend)}
  let(:new_backend){Backend.new}

  it "choose among 'Withdraw, Depost, Print Statement'" do
   expect{new_interface.start_service}.to output("Choose one of the following 'Deposit','Withdraw', 'Print Statement'\n").to_stdout
  end

  it "when chosen 'Deposit', ask user input deposit amount" do
   allow(new_interface).to receive(:gets).and_return("Deposit\n","500\n")
   expect(new_interface).to receive(:gets).and_return("Deposit\n","500\n")
   new_interface.start_service
  end




end
