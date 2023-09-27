# Respuestas
## Parte 1

### lib

### metodo sum
El método sum recibe un arreglo de números e itera a través de ellos gracias al método each en un bloque de una sola linea, con lo cual se ejecuta la suma total de todos los números en el arreglo

### metodo max_2_sum 
El método max_2_sum recibe un arreglo de números enteros como argumento y devuelve la suma de sus elementos.Por lo tanto, retorno 0 si arreglo resulta ser vacío, retorna el unico elemento si el arreglo solo contiene un elemento. Finalmente, en el bloque de código entre do y end se itera a través de los elementos del arreglo arr uno por uno utilizando el método each,luego de que el bucle each haya recorrido todo el arreglo, max1 contendrá el número más grande y max2 contendrá el segundo número más grande y retorna la suma fuera del bloque.
```
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



```


### spec
```

require_relative '../lib/ruby_intro.rb'




describe 'Introduccion a Ruby' do
  describe '#sum' do
    it 'deberia ser definido' do
      expect { sum([1, 3, 4]) }.not_to raise_error
    end

    it 'retorna la suma correcta'  do
      expect(sum([1, 2, 3, 4, 5])).to be_a_kind_of Integer
      expect(sum([1, 2, 3, 4, 5])).to eq(15)
      expect(sum([1, 2, 3, 4, -5])).to eq(5)
      expect(sum([1, 2, 3, 4, -5, 5, -100])).to eq(-90)
    end

    it 'trabaja sobre el arreglo vacio' do
      expect { sum([]) }.not_to raise_error
      expect(sum([])).to be_zero
    end
  end

  describe '#max_2_sum' do
    it 'deberia ser definido' do
      expect { max_2_sum([1, 2, 3]) }.not_to raise_error
    end
    it 'retorna la suma correcta'  do
      expect(max_2_sum([1, 2, 3, 4, 5])).to be_a_kind_of Integer
      expect(max_2_sum([1, -2, -3, -4, -5])).to eq(-1)
    end
    it 'trabaja incluso si los dos valores mas grandes son lo mismo' do
      expect(max_2_sum([1, 2, 3, 3])).to eq(6)
    end
    it 'retorna cero si el arreglo es vacio' do
      expect(max_2_sum([])).to be_zero
    end
    it 'retorna el valor del elemento si es solo un elemento' do
      expect(max_2_sum([3])).to eq(3)
    end
  end

  describe '#sum_to_n' do
    it 'deberia ser definido' do
      expect { sum_to_n?([1, 2, 3], 4) }.not_to raise_error
    end
    it 'retorna verdadero cuando dos elementos cualesquiera se suman al segundo argumento' do
      expect(sum_to_n?([1, 2, 3, 4, 5], 5)).to be true # 2 + 3 = 5
      expect(sum_to_n?([3, 0, 5], 5)).to be true # 0 + 5 = 5
      expect(sum_to_n?([-1, -2, 3, 4, 5, -8], -3)).to be true  # maneja la suma negativa
      expect(sum_to_n?([-1, -2, 3, 4, 5, -8], 12)).to be false # 3 + 4 + 5 = 12 
      expect(sum_to_n?([-1, -2, 3, 4, 6, -8], 12)).to be false # no dos elementos que sumar
    end
    it 'retorna falso para un unico elemento del arreglo' do
      expect(sum_to_n?([0], 0)).to be false
      expect(sum_to_n?([1], 1)).to be false
      expect(sum_to_n?([-1], -1)).to be false
      expect(sum_to_n?([-3], 0)).to be false
    end
    it 'retorna falso para un arreglo vacior' do
      expect(sum_to_n?([], 0)).to be false
      expect(sum_to_n?([], 7)).to be false
    end
  end
end

```


![Captura de pantalla de 2023-09-27 04-53-34](https://github.com/miguelvega/HolaRuby/assets/124398378/1e7b324e-8259-42fa-aacb-bba16961fda1)


## Parte2

### lib
```
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

```

### spec

```
# frozen_string_literal: true

require_relative '../lib/ruby_intro.rb'

describe '#hello' do
  it 'deberia ser definido' do
    expect { hello('Testing') }.not_to raise_error#::NoMethodError)
  end

  it 'El metodo hello retorna la cadena correcta' do
    expect(hello('Checha').class).to eq(String)
    expect(hello('Checha')).to eq('Hello, Checha'), 'Resultado incorrecto para la entrada: "Checha"'
    expect(hello('CESARIO')).to eq('Hello, CESARIO'), 'Resultado incorrecto para la entrada: "CESARIO"'
    expect(hello('Mr. Zarin')).to eq('Hello, Mr. Zarin'), 'Resultado incorrecto para la entrada: "Mr. Zarin"'
  end
end

describe '#starts_with_consonant?' do
  it 'deberia ser definido' do
    expect { starts_with_consonant?('d') }.not_to raise_error#::NoMethodError)
  end
  it 'clasifica casos verdaderos' do
    expect(starts_with_consonant?('v')).to be_truthy, "'v' es una consonante"
    %w[v vest Veeee crypt].each do |string|
      expect(starts_with_consonant?(string)).to be_truthy, "Resultado incorrecto para la entrada: \"#{string}\""
    end
  end
  it 'clasifica casos falsos' do
    expect(starts_with_consonant?('a')).to be_falsy, "'a' no es una consonante"
    %w[asdfgh Unix].each do |string|
      expect(starts_with_consonant?(string)).to be_falsy, "Resultado incorrecto para la entrada: \"#{string}\""
    end
  end
  it 'funciona en la cadena vacia'  do
    expect(starts_with_consonant?('')).to be_falsy
  end
  it 'funciona con elementos que no son letras' do
    expect(starts_with_consonant?('#foo')).to be_falsy
  end
end

describe '#binary_multiple_of_4?' do
  it 'deberia ser definido' do
    expect { binary_multiple_of_4?('yes') }.not_to raise_error#::NoMethodError)
  end
  it 'clasifica numeros binarios validos' do
    %w[1010101010100 0101010101010100 100 0].each do |string|
      expect(binary_multiple_of_4?(string)).to be_truthy,  "Resultado incorrecto para la entrada: \"#{string}\""
    end
    %w[101 1000000000001].each do |string|
      expect(binary_multiple_of_4?(string)).not_to be_truthy,  "Resultado incorrecto para la entrada: \"#{string}\""
    end
  end
  it 'rechaza numeros binarios no validos' do
    expect(binary_multiple_of_4?('a100')).to be_falsy, "'a100' no es un numero binario valido!"
    expect(binary_multiple_of_4?('')).to be_falsy, 'La cadena vacia no es un numero binario valido.!'
  end
end


```

![Captura de pantalla de 2023-09-27 16-15-28](https://github.com/miguelvega/HolaRuby/assets/124398378/bc934b89-c4ae-4b90-9a79-9223d7513f67)


## Parte 3

### lib
```
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

```

### spec
```
require_relative '../lib/ruby_intro.rb'

describe 'BookInStock' do
  it 'esto deberia ser definido' do
    expect { BookInStock }.not_to raise_error
  end

  describe 'getters y setters' do
    before(:each)  { @book = BookInStock.new('isbn1', 33.8) }
    it 'debe establecer ISBN ' do
      expect(@book.isbn).to eq('isbn1')
    end
    it 'deberia establecer el precio ' do
      expect(@book.price).to eq(33.8)
    end
    it 'deberia cambiar el ISBN' do
      @book.isbn = 'isbn2'
      expect(@book.isbn).to eq('isbn2')
    end
    it 'deberia cambiar el precio' do
      @book.price = 300.0
      expect(@book.price).to eq(300.0)
    end
  end
  describe 'constructor' do
    it 'debe rechazar el numero ISBN no valido' do
      expect { BookInStock.new("", 25.00) }.to raise_error(ArgumentError)
    end
    it 'debe rechazar el precio cero' do
      expect { BookInStock.new("isbn1", 0) }.to raise_error(ArgumentError)
    end
    it 'debe rechazar el precio negativo' do
      expect { BookInStock.new("isbn1", -5.0) }.to raise_error(ArgumentError)
    end
  end
  describe '#price_as_string' do
    it 'esto deberia ser definido' do
      expect(BookInStock.new('isbn1', 10)).to respond_to(:price_as_string)
    end
    it 'debe mostrar 33.95 como "$33.95"' do
      expect(BookInStock.new('isbn11', 33.95).price_as_string).to eq('$33.95')
    end
    it 'debe mostrar  1.1 como $1.10' do
      expect(BookInStock.new('isbn11', 1.1).price_as_string).to eq('$1.10')
    end
    it 'debe mostrar  20 como $20.00 ' do
      expect(BookInStock.new('isbn11', 20).price_as_string).to eq('$20.00')
    end
  end
end

```

![Captura de pantalla de 2023-09-27 17-10-09](https://github.com/miguelvega/HolaRuby/assets/124398378/db35c4c5-6e54-423f-9ba2-d4e60ddb27b9)
