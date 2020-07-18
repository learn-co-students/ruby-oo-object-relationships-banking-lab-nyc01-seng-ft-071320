class Transfer
  # your code here
  @@all = []
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if(status == "pending" && valid? && amount <= sender.balance)
    sender.balance -= amount
    receiver.balance += amount
    self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if(status == "complete" && valid?)
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end

end
