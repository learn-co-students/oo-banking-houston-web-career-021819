class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    self.balance = 1000
    self.status = 'open'
  end

  def deposit(int)
    self.balance += int

  end

  def display_balance
    return "Your balance is $#{self.balance}."
  end

  def valid?
    if self.status == 'open' && self.balance > 0
      return true
    else
      return false
    end
  end

  def close_account
    self.status = 'closed'
  end

end
