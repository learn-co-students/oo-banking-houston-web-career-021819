require_relative "./bank_account.rb"
require 'pry'

class Transfer

  attr_accessor :sender, :status, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    self.sender = sender
    self.receiver = receiver
    self.amount = amount
    self.status = "pending"
    
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true
      return true
    else
      return false
    end
  end

  def execute_transaction
    if self.amount <= sender.balance && self.status == "pending" && sender.valid?
      sender.balance = sender.balance - self.amount 
      receiver.balance = receiver.balance + self.amount
      self.status = "complete"
    
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if self.status == "complete"
      sender.balance = sender.balance + self.amount 
      receiver.balance = receiver.balance - self.amount
      self.status = "reversed"
    end
  end



end

