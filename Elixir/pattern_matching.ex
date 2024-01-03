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
