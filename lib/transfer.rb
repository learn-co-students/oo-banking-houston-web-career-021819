require "bank_account.rb"

class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, status="pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true && sender.balance >= amount
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? == true && self.status != "complete"
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount
      self.status = "complete"
    else
      self.status = ("rejected")
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance = sender.balance + amount
      receiver.balance = receiver.balance - amount
      self.status = "reversed"
    else
      "this transfer has not been completed."
    end
  end

end
