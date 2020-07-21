class BankAccount
    attr_reader :name 
    attr_accessor :open , :balance, :status

    def initialize(name) # name gives you thr bsnk sccount the status the balance
        #@bank_account= bank_account
        @name= name
        @balance= 1000
        @status= "open"
    
    end 

    def deposit(deposit_money)
        @balance+= deposit_money
    end
    
    def withdrawl(withdrawl_money)
        @balance -= withdrawl_money
    end 
    def display_balance
        p "Your balance is $#{self.balance}."
    end
    def valid?
        (status == "open") && (balance > 0) 
    end
    def close_account 
        @status= "closed"
    end

end
