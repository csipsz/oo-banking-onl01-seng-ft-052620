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
    @sender.valid? && @receiver.valid? 
  end 
  
=begin
  def execute_transaction 
    if valid? && @status == 'pending'
      @receiver.balance += @amount
      sender.balance -= @amount
      @status = 'complete'
    else 
    @status = 'rejected'
    return "Transaction rejected. Please check your account balance."
  end 
  end 
=end 

def execute_transaction
    if @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."

    elsif @status == "complete"
      puts "Transaction was already excuted"
    else
      @sender.deposit( @amount * -1 ) 
      @receiver.deposit( @amount )
      @status = "complete"
    end
  end


  
  def reverse_transfer
    if @status == 'complete'
      receiver.balance -= amount 
      sender.balance += amount 
      @status = 'reversed'
      
  end 
end 
  
end