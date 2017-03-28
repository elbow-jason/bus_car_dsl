defmodule BusCarDsl.Match do

  defp parse_map([:match, :_all, str | rest], acc) when is_map(acc) and is_binary(str) do
    {rest, acc |> Map.put(:match, %{:_all => str})}
  end
  use BusCarDsl.Tree.Leaf
  leaf_rule(:match, :query)
end
