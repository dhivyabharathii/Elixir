#Sum of the numbers in the list
defmodule Recursion do
  def sum_list([head|tail],accumulator) do
    sum_list(tail,head+accumulator)
  end

  def sum_list([],accumulator) do
    accumulator
  end
end

#To print numbers between range
defmodule MyList do
  def span(from, to) when from > to, do: raise "to must be >= from"
  def span(from, to) when from === to, do: [from]
  def span(from, to) when from < to, do: [from | span(from + 1, to)]
end

IO.inspect MyList.span(1, 40)
IO.puts Recursion.sum_list([2,3,4],1)



# Tail Recursive
defmodule Reverse do
  def rev(num,acc\\0)
  def rev(0,acc), do: acc
  def rev(num,acc) do
    rev(div(num,10),acc*10 + rem(num,10))
  end
end
IO.puts Reverse.rev(123)
