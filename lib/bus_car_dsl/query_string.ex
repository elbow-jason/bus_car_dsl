defmodule BusCarDsl.QueryString do
  use BusCarDsl.Element

  def parse([ :query_string, value | rest ], acc) when acc |> is_map and value |> is_binary do
    {rest, acc |> Map.put(:query_string, %{:query => value})}
  end

end
