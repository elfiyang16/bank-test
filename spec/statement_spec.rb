require_relative "../lib/statement"

describe Statement do
  let(:date){DateTime.new(2001,2,3)}
  let(:deposit){500}
  let(:withdraw){300}
  let(:current_balance){500}

  it "can record deposit in certain format" do
    expect(subject.record_deposit(date, deposit, current_balance)).to eq(["03/02/2001 || 500.00 || || 500.00"])
  end

  it "can record withdraw in certain format" do
    expect(subject.record_withdraw(date, withdraw, current_balance)).to eq(["03/02/2001 || || -300.00 || 500.00"])
  end
end
