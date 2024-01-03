#Atom
defmodule Data_types do
  def data_types do
    list=[1,2,3]
    IO.puts(Enum.sum(list))

    {:ok,message}={:ok,"Status 200 ok"}
    IO.puts(message)

    "E" <> rest = "Elixir"
    IO.puts(rest)
  end
end
Data_types.data_types()
Data_types
