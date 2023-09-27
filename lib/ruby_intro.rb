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

