require 'pry'
require_relative 'bank_account'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  @@all = []

  def initialize(sender, receiver, amount=50)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    Transfer.all << self
    #sender and receiver will be BankAccount instances
  end

  def self.all
    @@all
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    #should be using self.attribute_name
    if self.status == "pending" && valid? && sender.balance > amount #why 'amount' and not self.amount
      sender.balance -= amount
      receiver.balance += amount #why does 'amount' work here and not self.smount?
      self.status = "complete"
    else
      reject_transfer
    end
    #why does this reject transfer after you change the transfer amount to a valid amount?
    #because reject_transfer changed the status to 'rejected' and to execute transaction, you need status to equal 'pending'
  end

  def update_amount(new_amount)
    self.amount = new_amount
    self.status = "pending"
    "The new transfer amount is $#{new_amount}."
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end

  #TODO
    #reverse transfer goes here
    #also add one to many relationship
    #then add many to many relationship through Bank class
      #create a BankTransfer class to act as a join class
      #create sender class
        #bank account that's sending money
      #create receiver class
        #bank account that's receiving money


  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  
end

# amanda = BankAccount.new("Amanda")
# avi = BankAccount.new("Avi")
# bad_transfer = Transfer.new(amanda, avi, 4000)

# binding.pry