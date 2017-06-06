defmodule BusCarDsl.From do

  @root :from
  @stems []

  def root,   do: @root
  def stems,  do: @stems

  def parse([@root, num | rest], acc) when  is_map(acc) and is_integer(num) do
    {rest, acc |> Map.put(@root, num)}
  end

end