require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver 
    @amount = amount 
    @status = 'pending'
  end 
  
  def valid? 
    sender.valid? && receiver.valid?
  end 
  
  def execute_transaction 
    if self.status == 'pending' &&  sender.status == 'open' && sender.balance > 0
      receiver.deposit(amount)
      sender.balance -= amount
      self.status = 'complete'
      amount = 0
      binding.pry
    else 
    self.status = 'rejected'
    "Transaction rejected. Please check your account balance."
  end 
  end 
  
end
