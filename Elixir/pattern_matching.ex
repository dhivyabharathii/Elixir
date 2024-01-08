defmodule Patterns do
  def greet(%{name: name}) do
    IO.puts "HI #{name} -> name passed in a function"
  end
  def greet(%{name: "Dhivya"}) do
    IO.puts "HI"
  end
  def greet(%{name: name, age: age}) do
    IO.puts "HI #{name} , age is #{age}"
  end
end

#Changing the order of the function written in Module , the function call is executed correctly
Patterns.greet %{name: "Elixir", age: 9}
Patterns.greet %{name: "Elixir"}
Patterns.greet %{name: "Dhivya"}




items = [%{id: 1, deleted: false}, %{id: 2, deleted: true}, %{id: 3, deleted: false}]
IO.puts "All ID"
for item <- items do
  IO.puts Map.fetch!(item, :id)
end

IO.puts "Deleted ID"
for %{deleted: true} = item <- items do
  IO.puts Map.fetch!(item, :id)
end

#tuple
person = {:person, "Bob", 25}
{:person, name, age} = person

IO.puts name

expected_name ="Bob"
{^expected_name, _} = {"Bob", 25}
# {^expected_name, _} = {"Alice", 30}

#map
%{name: name, age: age} = %{name: "ob", age: 25}
IO.puts name

# Multiclause
defmodule Geometry do
  def area({:rectangle, a, b}) do
  IO.puts a * b
  end
  def area({:square, a}) do
  IO.puts a * a
  end
  def area({:circle, r}) do
  IO.puts r * r * 3.14
  end
end

Geometry.area({:rectangle, 4, 5})
Geometry.area({:square, 5})
Geometry.area({:circle, 4})
