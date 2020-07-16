class BankAccount
    attr_reader :name
    attr_accessor :balance, :status 
    
    @@all = [] 

    
    def initialize(name, balance=1000, status="open")
        @name = name
        @balance = balance 
        @status = status
        save 
    end

    def self.all 
        @@all
    end    

    def save
        @@all << self 
    end

    def deposit(amount)
        self.balance += amount 
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end 

    def valid?
        if self.status == "open" && self.balance > 0
            true
        else
            false 
        end
    end

    def close_account 
        self.status = "closed"
    end 


end
