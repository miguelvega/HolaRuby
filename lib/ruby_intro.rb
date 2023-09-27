# Parte 1

def sum(arr)
  # COMPLETA TU CODIGO
  resultado = 0
  arr.each { |n| resultado += n }
  resultado
end

def max_2_sum arr
  # COMPLETA TU CODGO
  return 0 if arr.empty?
  return arr[0] if arr.length == 1
  
  max1 = nil
  max2 = nil
  arr.each do |num|
    if max1.nil? || num > max1
      max2 = max1
      max1 = num
    elsif max2.nil? || num > max2
      max2 = num
    end
  end

  # Suma los dos números máximos
  sum = max1 + max2
  
end


def sum_to_n?(arr, n)
  arr.each_with_index do |elemento, index|
    # Verifica si n - elemento está en el arreglo y no es el mismo elemento
    if arr.include?(n - elemento) && arr.index(n - elemento) != index
      return true
    end
  end
  false
end



# Parte 2

def hello(name)
  # COMPLETA TU CODIGO
   if name =~ /^(Mr\.|Mrs\.|Ms\.)?\s?[A-Za-z]+$/
    "Hello, #{name}"
   end
    
end

def starts_with_consonant? s
  # COMPLETA TU CODIGO
  return /^[b-df-hj-np-tv-z]/i.match?(s)
end

def binary_multiple_of_4? s
  # COMPLETA TU CODIGO
  return /^[01]+$/.match?(s) && s.to_i(2) % 4 == 0
end

# Parte 3

class BookInStock
# COMPLETA TU CODIGO
  attr_accessor :isbn, :price

  def initialize(isbn, price)
    raise ArgumentError, "ISBN no válido" if isbn.empty?
    raise ArgumentError, "Precio no válido" if price <= 0

    @isbn = isbn
    @price = price
  end
  

  def price_as_string
    format("$%.2f", @price)
  end
  
end
