defmodule BusCarDsl.Highlight do
  
  use BusCarDsl.Element

  @stems :_all # accumulates: true
  defp parse_map([:highlight, :fields, str | rest], acc) when is_map(acc) and is_binary(str) do
    {rest, acc |> Map.put(:highlight, %{:_all => str})}
  end

  TreeLeaf.rule(:highlight, :fields)

end