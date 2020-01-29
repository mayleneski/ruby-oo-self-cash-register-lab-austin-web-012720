require 'pry'
class CashRegister
  attr_reader :total, :employee_discount, :items
  attr_accessor :last_transaction

  def initialize(discount = nil)
    @total = 0
    @employee_discount = discount
    @items = []
  end

  def discount
    @employee_discount
  end

  def total=(total)
    @total = total
  end

  def add_item(item, price, quanity = 1)
    @total += price * quanity
    @last_transaction = price * quanity

    if quanity > 1
      @items.concat([item] * quanity)
    else
      @items << item
    end
  end

  def apply_discount
    if @employee_discount
      @total -= @total * @employee_discount / 100.00
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_transaction
  end

end
