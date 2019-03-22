class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
     if sender.valid? && receiver.valid?
       true 
     else
       false 
     end
  end
  
  def execute_transaction
    if self.status == "pending" && valid?
      receiver.deposit(self.amount)
      sender.balance -= self.amount
      self.status = "complete"
    else
      "Transaction rejected. Please check your account balance."
    end
  end
end
