class BankAccount
    attr_accessor :balance, :status
    attr_writer
    attr_reader :name
  
    def initialize(name)
      @name = name
      @balance = 1000
      @status = "open"
    end

    def deposit(money)
        @balance+=money
    end

    def display_balance
        puts "Your balance is $#{@balance}."
    end

    def  valid?
        false 
    end

    def close_account
        @status="closed"
    end
    
end
