require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def reject_transfer
    @status = 'rejected'
    'Transaction rejected. Please check your account balance.'
  end



  def execute_transaction
    #binding.pry
    if valid? && sender.balance > self.amount && self.status == 'pending'
      self.sender.balance = self.sender.balance - self.amount
      self.receiver.balance = self.receiver.balance + self.amount
      self.status = "complete"
    else
      reject_transfer 
     end
  end

  
  def reverse_transfer
    if valid? && receiver.balance > self.amount && self.status == 'complete'
      self.receiver.balance = self.receiver.balance - self.amount
      self.sender.balance = self.sender.balance + self.amount
      self.status = "reversed"
    else
      reject_transfer 
     end
  end


end

