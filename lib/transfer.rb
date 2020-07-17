require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :balance


  def initialize (sender, receiver, amount=50)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if self.sender.valid? == true && self.receiver.valid? == true
      true
    end
  end

  def execute_transaction
    if valid? && sender.balance>amount && self.status == "pending"
      self.sender.balance = self.sender.balance - self.amount
      self.receiver.balance = self.receiver.balance + self.amount
      self.status = "complete"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      self.receiver.balance -= amount
      self.sender.balance += amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end

end
