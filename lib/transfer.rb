require "bank_account.rb"

class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, status = "pending", amount)
    self.sender = sender
    self.receiver = receiver
    self.status = status
    self.amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid? == true && sender.balance >= amount
      return true
    else
      return false
    end
  end

  def execute_transaction
    if self.valid? == true && self.status != "complete"
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount
      self.status = "complete"
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance = sender.balance + amount
      receiver.balance = receiver.balance - amount
      self.status = "reversed"
    else
      "this transer has not been completed."
    end
  end


end
