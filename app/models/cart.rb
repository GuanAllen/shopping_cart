class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(product_id)
    # 檢查是否有重複
    item = items.find{ |i| i.product_id == product_id}

    if item
      # 有的話，數量加1
      item.increment
    else
      # 沒有的話，加入items
      @items << CartItem.new(product_id)
    end
  end

  def empty?
    items.empty?
  end

  def total_price
    total = 0
    items.reduce(0) { | sum, item| sum + item.total_price }
  end
end
