class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  before_save :set_unit_price
  before_save :set_subtotal

  #Si la orden mantiene su estado de "creado" por más de 20 minutos, se elimina.


  #Precios de los productos 
  def unit_price
    if persisted?
      self [:unit_price]
    else
      product.price
    end
  end

  def subtotal 
    return unit_price * quantity 
  end 

  private 
  def set_unit_price
    self[:unit_price] = unit_price 
  end

  def set_subtotal 
    self[:subtotal] = subtotal
  end
end
