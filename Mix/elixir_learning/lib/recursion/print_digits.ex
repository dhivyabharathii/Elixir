defmodule ElixirLearning.Recursion.PrintDigits do
  def upto(0), do: :ok
  def upto(num) do
    #  "Ascending"
    IO.puts num
    upto(num-1)
    # "Desending"
    IO.puts num

 end
 def sum(num) do
  num + sum(num-1)
end
end
