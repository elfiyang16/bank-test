require_relative "../lib/interface"

describe Interface do
  it "choose among 'Withdraw, Depost, Print Statement'" do
   expect{subject.start_service}.to output("Choose one of the following 'Deposit','Withdraw', 'Print Statement'\n").to_stdout
  end




end
