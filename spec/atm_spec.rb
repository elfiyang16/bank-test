require_relative "../lib/atm"

describe Atm do
  let(:new_atm){described_class.new(new_account)}
  let(:new_account){Account.new}
  let(:new_statement){"date || credit || debit || balance\n#{DateTime.now.strftime("%d/%m/%Y")} || || 200.00 || 300.00\n#{DateTime.now.strftime("%d/%m/%Y")} || 500.00 || || 500.00\n"}

  it "choose among 'Withdraw, Depost, Print Statement'" do
   expect{new_atm.start_service}.to output("Choose one of the following 'Deposit','Withdraw', 'Print Statement'\n").to_stdout
  end

  it "when chosen 'Deposit', ask user input deposit amount" do
   allow(new_atm).to receive(:gets).and_return("Deposit\n","500\n")
   expect(new_atm).to receive(:gets).and_return("Deposit\n","500\n")
   new_atm.start_service
  end

  it "when chosen 'Withdraw', ask user input withdraw amount" do
   allow(new_atm).to receive(:gets).and_return("Withdraw\n","200\n")
   expect(new_atm).to receive(:gets).and_return("Withdraw\n","200\n")
   new_atm.start_service
  end

  it "when chosen 'Print Statement', print the statement" do
   allow(new_atm).to receive(:gets).and_return("Deposit\n","500\n")
   new_atm.start_service
   allow(new_atm).to receive(:gets).and_return("Withdraw\n","200\n")
   new_atm.start_service

   allow(new_atm).to receive(:gets).and_return("Print Statement\n")
   expect(new_atm).to receive(:gets).and_return("Print Statement\n")
   expect{new_atm.start_service}.to output("Choose one of the following 'Deposit','Withdraw', 'Print Statement'\n"+new_statement).to_stdout
  end


end
