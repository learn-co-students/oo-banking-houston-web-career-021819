require_relative './bank_account.rb'

class Transfer

  attr_accessor :status, :sender, :receiver
  attr_reader :amount

  def initialize(sender, receiver, amount)
      self.status = 'pending'
      @amount = amount 
      self.sender = sender
      self.receiver = receiver 
  end 

  def valid?
    if sender.valid? && receiver.valid? 
      true
    else
      false
    end
  end 

  def execute_transaction
    if self.status == 'pending' && sender.valid? && sender.balance >= self.amount
    sender.balance -= self.amount 
    receiver.balance += self.amount 
    self.status = 'complete'
    else  
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == 'complete'
    sender.balance += self.amount 
    receiver.balance -= self.amount 
    self.status = 'reversed'
    else
      false 
    end
  end 
end
