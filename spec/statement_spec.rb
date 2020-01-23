require_relative "../lib/statement"

describe Statement do
  let(:date){DateTime.new(2001,2,3)}
  let(:new_date){DateTime.new(2015,2,3)}
  let(:deposit){500}
  let(:withdraw){-300}
  let(:balance){500}
  let(:new_balance){200}


  it "can record deposit in certain format" do
    expect(subject.record_deposit(date, deposit, balance)).to eq(["03/02/2001 || 500.00 || || 500.00"])
  end

  it "can record withdraw in certain format" do
    expect(subject.record_withdraw(date, withdraw, balance)).to eq(["03/02/2001 || || 300.00 || 500.00"])
  end

  it "can format statement in certain format and in reverse chronological order" do
    subject.record_deposit(date, deposit, balance)
    subject.record_withdraw(new_date, withdraw, new_balance)
    expect(subject.format_statement).to eq(
      "date || credit || debit || balance\n03/02/2015 || || 300.00 || 200.00\n03/02/2001 || 500.00 || || 500.00\n"
    )
  end
end
