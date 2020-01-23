class Statement
  def initialize
    @statement_record = []
  end

  def record_deposit(date, balance_change, current_balance)
    @statement_record.push("#{date.strftime("%d/%m/%Y")} || #{'%.2f' % balance_change} || || #{'%.2f' % current_balance}")
    @statement_record
  end

  def record_withdraw(date, balance_change, current_balance)
    @statement_record.push("#{date.strftime("%d/%m/%Y")} || || #{'%.2f' % -(balance_change)} || #{'%.2f' % current_balance}")
    @statement_record
  end

  def format_statement
    statement_titile = "date || credit || debit || balance\n"
    statement_end = "\n"
    statement_records = @statement_record.reverse.join("\n")
    statement = statement_titile + statement_records+statement_end
    statement
  end
end
