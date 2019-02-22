require 'bank_account.rb'

class Transfer

  attr_accessor :sender, :receiver, :status, :amount
  def initialize (sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @status = "pending"
  @amount = amount # your code here
end

def valid?
  (@sender.valid?) && (@receiver.valid?)  #class instance method
end

def execute_transaction
  if status == "complete"
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
    @receiver.balance -= amount
    @sender.balance += amount
    @status = "reversed"


end
end
end
