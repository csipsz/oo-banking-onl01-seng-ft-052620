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
    if sender.balance >= amount 
      "Transaction rejected. Please check your account balance."
    else 
      receiver.balance += amount
    end 
  end 
end
