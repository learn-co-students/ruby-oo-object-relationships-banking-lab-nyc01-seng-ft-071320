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
    if check_validity && sender.balance > self.amount && self.status == "pending"  
      receiver.balance += amount 
      sender.balance -= amount
      self.status = "complete"
    else
      rejection
    end
  end
 
  
  def check_validity
    self.sender.valid? && self.receiver.valid?
  end

  def rejection
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer 
    if check_validity && receiver.balance > self.amount && self.status == "complete"
      receiver.balance -= amount 
      sender.balance += amount
      self.status = "reversed"
    else 
      rejection
    end
  end 
end
