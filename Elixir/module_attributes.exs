defmodule Circle do
  @moduledoc "Implements basic circle functions"
  @pi 3.14159
  @doc "Computes the area of a circle"
  def area(r), do: r*r*@pi
  @doc "Computes the circumference of a circle"
  def circumference(r), do: 2*r*@pi
end


defmodule StringHelpers do
  #we declare a new type (word()) that is equivalent to the string type (String.t());
  @type word() :: String.t()

  #we specify that the long_word?/1 function takes an argument of type word() and returns a boolean (boolean()), that is, either true or false.
  @spec long_word?(word()) :: boolean()
  def long_word?(word) when is_binary(word) do
    IO.puts(String.length(word) > 8)
  end
end

StringHelpers.long_word?("hi")
