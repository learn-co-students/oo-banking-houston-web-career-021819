class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    end
  end
  
  def execute_transaction
    
    if @status == "complete"
      @sender.balance
      @receiver.balance
    else
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
    end
    
    if @sender.valid? == false
      @status = "rejected"
      "Transaction rejected. Please check your account balance." 
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    end
  end
end
