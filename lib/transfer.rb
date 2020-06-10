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
    if !sender.valid?
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    else 
      receiver.balance += amount
      amount = 0
    end 
  end 
end
