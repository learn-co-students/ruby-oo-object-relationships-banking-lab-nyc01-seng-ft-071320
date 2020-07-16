class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :transfer, :status
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
    @sender.valid? && @receiver.valid?l
  end

  def execute_transaction
    @receiver+=transfer
    @sender-=transfer
    @status="rejected" if @sender.balance <transfer
  end

end
