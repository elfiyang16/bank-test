require_relative "../lib/backend"

describe Backend do
  let(:deposit){500}
  let(:withdraw){300}
  let(:old_date){DateTime.new(2001,2,3)}
  let(:new_date){DateTime.new(2015,2,3)}

  it " deposits in the bank with date being recorded" do
    expect(subject.deposit(deposit, date = old_date)).to eq 500
    expect(date).to be_an_instance_of(DateTime)
  end

  it " withdraws from the bank with date being recorded" do
    expect(subject.withdraw(withdraw, date = new_date)).to eq (-300)
    expect(date).to be_an_instance_of(DateTime)
  end

  it "print the statement in certain format" do
    subject.deposit(deposit, date = old_date)
    expect(subject.print_statement).to eq ("date || credit || debit || balance\n#{date.strftime("%d/%m/%Y")} || 500.00 || || 500.00\n")
  end

  it "prints transactions in reverse chronological order" do
    subject.deposit(deposit, date = old_date)
    subject.withdraw(withdraw, date = new_date)
    expect(subject.print_statement).to eq ("date || credit || debit || balance\n#{new_date.strftime("%d/%m/%Y")} || || 300.00 || 200.00\n#{old_date.strftime("%d/%m/%Y")} || 500.00 || || 500.00\n")
  end

end
