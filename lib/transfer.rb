class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @reciever = receiver 
    @amount = amount 
    @status = 'pending'
  end 
end
