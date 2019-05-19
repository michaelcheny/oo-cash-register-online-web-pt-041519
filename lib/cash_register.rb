require "pry"

class CashRegister

  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(employee_discount = 0)
    @total = 0
    @discount = employee_discount
    @items = []
  end


  def add_item(item, price, quantity = 1)
    @items.fill(item, @items.size, quantity)
    item = price * quantity
    @total += item
    @last_transaction = @total
  end

  def apply_discount
    if @discount != 0
      @total -= @total * (@discount.to_f/100.0)
      "After the discount, the total comes to $#{@total.to_i}."
    else 
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_transaction
  end

end
