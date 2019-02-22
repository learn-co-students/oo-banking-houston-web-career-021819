class BankAccount

  attr_accessor :status, :balance
  attr_reader :name
  def initialize(name, balance = 1000, status = 'open')
    @name = name 
    self.balance = balance
    self.status = status
  end

  def deposit(value)
    self.balance = self.balance + value
  end

  def valid?
    if self.status == "open" && self.balance > 0
      return true
    else
      return false
    end
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def close_account
    self.status = "closed"
  end
end


  
