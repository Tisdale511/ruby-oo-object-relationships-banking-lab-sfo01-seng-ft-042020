class Transfer

  # your code here
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"
  end

  def execute_transaction
    if status == "pending" && valid? && sender.balance >= amount
      receiver.balance += amount
      sender.balance -= amount
      self.status = "complete"
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if status == "complete" && valid? && sender.balance >= amount
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def valid?
    sender.valid? && receiver.valid?
  end

end

#sender = BankAccount.new
