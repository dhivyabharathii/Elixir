defmodule ListLinked do
  def rev(listt,acc\\[])
  def rev([],acc), do: Enum.each(
    acc,
    &IO.puts/1)
  def rev([h | t],acc) do
    rev(t,[h | acc])
  end
end
IO.puts ListLinked.rev([1,2,3])
