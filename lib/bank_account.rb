require_relative "./transfer.rb"

class BankAccount

    attr_accessor :balance, :status
    attr_reader :name

    def initialize(name)
        @name = name
        self.balance = 1000
        self.status = "open"
    end

    def deposit(amount)
        self.balance = self.balance + amount
    end

    def display_balance
        return "Your balance is $#{self.balance}."
    end

    def valid?
        if self.balance > 0 && self.status == "open"
            return true
        else false    
        end
    end

    def close_account
        self.status = "closed"
    end





end
