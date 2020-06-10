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
    if self.status == 'pending' && sender.balance >= self.amount
      receiver.deposit(amount)
      sender.balance -= amount
      self.status = 'complete'
      amount = 0
    else 
      "Transaction rejected. Please check your account balance."
    end 
    
  
  end 
  
end
