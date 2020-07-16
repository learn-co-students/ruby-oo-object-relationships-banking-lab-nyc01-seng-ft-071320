require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status, :prior
  attr_reader :name
  attr_writer 
  def initialize (sender,receiver, amount)
    @sender = sender
    @receiver = receiver
    # @sender.balance-=transfer
    # @receiver.balance+=transfer
    @amount =amount
    @status="pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    # binding.pry
    if @sender.balance > @amount && valid?
      @status="complete"
      @receiver.balance+=@amount
      @sender.balance-=@amount
      @prior=@amount
      @amount=0
    else
      # binding.pry
      @status="rejected" 
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status=="complete"
    @receiver.balance-=@prior
    @sender.balance+=@prior
    @prior=0
    @status="reversed"
    end
  end


end
