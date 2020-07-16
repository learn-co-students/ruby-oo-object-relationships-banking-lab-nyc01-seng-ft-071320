require 'pry'

class Transfer
  attr_reader :amount
  attr_accessor :sender, :receiver, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @sender.balance > self.amount && self.status == 'pending'&& valid?
      @sender.balance -= self.amount
      @receiver.balance += self.amount
      self.status = 'complete'
    else
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == 'complete'
      @sender.balance += self.amount
      @receiver.balance -= self.amount
      @status = 'reversed'
    end
  end
end
