defmodule BusCarDsl.Size do

  @root :size
  @stems []

  def root,   do: @root
  def stems,  do: @stems

  def parse([:size, num | rest], acc) when  is_map(acc) and is_integer(num) do
    {rest, acc |> Map.put(:size, num)}
  end

end