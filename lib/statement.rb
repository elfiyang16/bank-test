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


end
