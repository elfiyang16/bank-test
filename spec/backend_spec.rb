require_relative "../lib/backend"

describe Backend do
  let(:deposit){500}
  let(:withdraw){300}

  # let(:date1){}

  it " deposits in the bank with date being recorded" do
    subject.deposit(deposit, date = DateTime.now)
    expect(subject.balance).to eq 500
    expect(date).to be_an_instance_of(DateTime)
  end

  it " withdraws from the bank with date being recorded" do
    subject.withdraw(withdraw, date = DateTime.now)
    expect(subject.balance).to eq (-300)
    expect(date).to be_an_instance_of(DateTime)
  end

  it "print the statement in certain format" do
    subject.deposit(deposit, date = DateTime.now)
    expect(subject.print_statement).to eq ("date || credit || debit || balance\n#{date.strftime("%d/%m/%Y")} || || 500.00 || 500.00")
  end


end
