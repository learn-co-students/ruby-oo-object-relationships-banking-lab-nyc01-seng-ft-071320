require 'pry'
class Transfer

  attr_accessor :sender, :receiver, :status, :amount   
  
  @@all = []
  
  
  def initialize(sender, receiver, status="pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
    save 
  end 

  def self.all 
    @@all
  end    

  def save
    @@all << self 
  end

  def valid?
    if self.sender.valid? == true && self.receiver.valid? == true
      true
    else  
      false
    end  
  end

  def execute_transaction
    self.receiver.deposit(@amount)
    binding.pry
  end
  
  




end
