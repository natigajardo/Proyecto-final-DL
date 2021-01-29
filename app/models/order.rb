class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :products, through: :order_items
  before_save :set_total
  before_create -> { generate_number(RANDOM_SIZE) }

  #OPCIONES DE STATUS
  STATE = %w{ Creada Pendiente Aceptada Enviado Finalizado Rechazada }

  #AGREGAR CODIGO UNICO A LA ORDEN : NUMERO 
  ORDER_PREFIX = 'PO'
  RANDOM_SIZE = 9
  validates :number, uniqueness: true
  
  def generate_number(size)
    self.number = loop do 
      rand_str = random_candidate(size)
      break rand_str unless Order.exists?(number: rand_str)
    end
  end

  def random_candidate(size)
    "#{ORDER_PREFIX}#{Array.new(size){rand(size)}.split}"
  end

  #CALCULO DEL TOTAL DE LA ORDEN
  def total 
    order_items.collect{|order_item| order_item.valid? ? order_item.unit_price * order_item.quantity : 0}.sum 
  end

  private

  def set_total
    self[:total] = total 
  end
end
