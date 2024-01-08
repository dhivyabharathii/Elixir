outside_var=5
my_function= fn -> IO.puts outside_var end  # Captures the current location of outside var
my_function.()

outside_var=7
IO.puts outside_var

my_function.() # rebinding doesn't affect
days = MapSet.new([:monday, :tuesday, :wednesday])
IO.puts MapSet.member?(days, :monday)
