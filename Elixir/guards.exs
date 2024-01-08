defmodule TestNum do
  def test(x) when x < 0 do
  :negative
  end
  def test(0) do :zero
  end
  def test(x) when x > 0 do
  :positive
  end
end
IO.puts TestNum.test(1)
defmodule ListHelper do
  def smallest(list) when length(list) > 0 do
  Enum.min(list)
  end
  # def smallest(_), do: {:error, :invalid_argument}
  end
IO.puts ListHelper.smallest(1)
