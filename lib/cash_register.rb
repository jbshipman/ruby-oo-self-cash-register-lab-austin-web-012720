class CashRegister

  attr_reader :discount
  attr_accessor :total, :items, :last_item, :last_item_price

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
    @last_item = [] 
  end 

  def discount
    @discount
  end 

  def add_item(title, price, quantity = nil)
    if quantity
      @total += price * quantity
      @items.concat([title] * quantity)
      @last_item = ([title] * quantity)
      @last_item_price = price * quantity
    else
      @total += price
      @items << title
      @last_item = title
      @last_item_price = price
    end 
  end 

  def apply_discount
    if @discount
      @total = @total - ((0.01 * @discount) * @total)
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end 
  end 

  def void_last_transaction
    @items.delete(@last_item)
    @total -= @last_item_price
  end 

end 