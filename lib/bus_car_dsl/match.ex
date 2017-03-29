defmodule BusCarDsl.Match do
  use BusCarDsl.Element

  @stems :_all # accumulates: true
  defp parse_map([:match, :_all, str | rest], acc) when is_map(acc) and is_binary(str) do
    {rest, acc |> Map.put(:match, %{:_all => str})}
  end
  
  TreeLeaf.rule(:match, :query)

end
