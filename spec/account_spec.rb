require_relative "../lib/account"

describe Account do
  let(:deposit){500}
  let(:withdraw){300}
  let(:date){DateTime.new(2001,2,3)}

  it " deposits in the bank with date being recorded" do
    expect(subject.deposit(deposit, date)).to eq 500
    expect(date).to be_an_instance_of(DateTime)
  end

  it " withdraws from the bank with date being recorded" do
    expect(subject.withdraw(withdraw, date)).to eq (-300)
    expect(date).to be_an_instance_of(DateTime)
  end

  it "can print the statement" do
    subject.deposit(deposit, date)
    expect(subject.print_statement).to eq ("date || credit || debit || balance\n#{date.strftime("%d/%m/%Y")} || 500.00 || || 500.00\n")
  end
end
