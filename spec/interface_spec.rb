require_relative "../lib/interface"

describe Interface do
  let(:new_interface){described_class.new(new_backend)}
  let(:new_backend){Backend.new}
  let(:new_statement){"date || credit || debit || balance\n17/12/2019 || || 200.00 || 300.00\n17/12/2019 || 500.00 || || 500.00\n"}

  it "choose among 'Withdraw, Depost, Print Statement'" do
   expect{new_interface.start_service}.to output("Choose one of the following 'Deposit','Withdraw', 'Print Statement'\n").to_stdout
  end

  it "when chosen 'Deposit', ask user input deposit amount" do
   allow(new_interface).to receive(:gets).and_return("Deposit\n","500\n")
   expect(new_interface).to receive(:gets).and_return("Deposit\n","500\n")
   new_interface.start_service
  end

  it "when chosen 'Withdraw', ask user input withdraw amount" do
   allow(new_interface).to receive(:gets).and_return("Withdraw\n","200\n")
   expect(new_interface).to receive(:gets).and_return("Withdraw\n","200\n")
   new_interface.start_service
  end

  it "when chosen 'Print Statement', print the statement" do
   allow(new_interface).to receive(:gets).and_return("Deposit\n","500\n")
   new_interface.start_service
   allow(new_interface).to receive(:gets).and_return("Withdraw\n","200\n")
   new_interface.start_service

   allow(new_interface).to receive(:gets).and_return("Print Statement\n")
   expect(new_interface).to receive(:gets).and_return("Print Statement\n")
   expect{new_interface.start_service}.to output("Choose one of the following 'Deposit','Withdraw', 'Print Statement'\n"+new_statement).to_stdout
  end


end
