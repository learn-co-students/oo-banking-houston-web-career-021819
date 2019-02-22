require 'bank_account.rb'
class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    (@sender.valid?) && (@receiver.valid?)
  end

  def execute_transaction
    if status == 'complete'
      @sender.balance
      @receiver.balance

    else
      @sender.balance -= amount
      @receiver.balance += amount
      @status = 'complete'

    end
    if @sender.valid? == false
        @status = 'rejected'
        "Transaction rejected. Please check your account balance."

    end

  end

  def reverse_transfer
    if @status=="complete"
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    end
  end
end
