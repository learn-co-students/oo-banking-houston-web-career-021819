require_relative "./bank_account.rb"
require "pry"

class Transfer

  attr_accessor :sender, :receiver, :status,:amount 
  
  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    if @sender.valid? && @receiver.valid? && @status === "pending"
      true
    else
      false
    end
  end
  
  def execute_transaction 
    if self.valid? && @amount < @sender.balance
      @receiver.balance = @receiver.balance + @amount
      @sender.balance = @sender.balance - @amount 
      @status = "complete" 
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  
def reverse_transfer
  if self.execute_transaction
    @sender.balance = @sender.balance + @amount 
    @receiver.balance = @receiver.balance - @amount
    @status = "reversed" 
  end
end

end
