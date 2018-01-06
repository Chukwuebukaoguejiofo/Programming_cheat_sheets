# Elixir


```elixir
IO.puts "Hello world"

IO.puts("Hello"); IO.puts("World!")


IO.puts(:brian) # atoms

# true false

# This is a comment in Elixir

{a, b, c} = {:hello, "world", 42}
IO.inspect {a, b, c}


# Lists are actually stored as linked lists, so insertions, deletions are very fast in lists.
# Tuples on the other hand, are stored in contiguous memory block, which make accessing them faster but adds an # additional cost on insertions and deletions.


name = "Spinos"
IO.puts name


my_list = [123, "ABC", :an_atom, true]
IO.inspect my_list

my_tuple = {123, "ABC", :an_atom, true}
IO.inspect my_tuple


my_number = 123
IO.puts my_number


# You can create lists of key value tuples
my_list2 = [name: "Brian", age: 29, address: "123 foobar st"]
IO.inspect my_list2

my_map = %{"name" => "Brian", "age" => 29, "address" => "123 foobar st"}
IO.inspect my_map
IO.puts my_map["name"]


my_map2 = %{name: "Brian", age: 29, address: "123 foobar st"}
IO.inspect my_map2
IO.puts my_map2[:name]
IO.puts my_map2.address




get_sum = fn (x, y) -> x + y end
IO.puts "5 + 5 = #{get_sum.(5,5)}"


#========================= functions
defmodule MY_MODULE do
  def foo(x, y) do
    x + y
  end
end
IO.puts MY_MODULE.foo(2, 3)
#========================= 


# lambdas
sum = fn (a, b) -> a + b end
IO.puts(sum.(1, 5))


# Loops
for n <- 1..3 do
  IO.puts "Hello ##{n}"
end

IO.puts "=========================="
#=============================== Structs
defmodule User do
  defstruct name: nil, age: nil, address: nil
end

defmodule AnotherModule do # we cannot call `%User{}` in the same contexts it was defined.
  def test_user do
    brian = %User{name: "spinos", age: 29, address: "foobar st"}
    IO.puts(brian.name)
    IO.puts(brian.age)
    IO.puts(brian.address)
    
    # update
    brian = %{brian | name: "Brian Spinos"}
    IO.puts(brian.name)
    IO.puts(brian.age)
    IO.puts(brian.address)
  end
end


AnotherModule.test_user()




#=============================== `use` keyword
defmodule MyModuleA do  
  defmacro __using__(_) do
    quote do
      def foo(s) do
        IO.puts(s <> "!!!")
      end
    end
  end
end  

defmodule MyModuleB do  
  use MyModuleA
end

MyModuleB.foo("Brian") # Brian!!!


```
