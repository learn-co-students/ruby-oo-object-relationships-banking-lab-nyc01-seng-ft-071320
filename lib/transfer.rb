class Transfer
  
    attr_accessor :sender, :receiver, :amount, :status
    

  def initialize(sender, receiver, amount)
  @sender= sender
  @receiver = receiver
  @amount= amount
  @status= "pending"
  end

  def valid?
   (@sender.valid? && @receiver.valid?)
  end 
  def execute_transaction
    if valid? && sender.balance > amount && self.status== "pending"
      sender.withdrawl(self.amount)
      receiver.deposit(self.amount)
      self.status= "complete"
    else
      self.status= "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.withdrawl(self.amount)
      sender.deposit(self.amount)
      self.status= "reversed"
    else
      self.status= "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end 
  







end 