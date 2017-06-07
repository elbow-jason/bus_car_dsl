defmodule BusCarDsl.Sort do
  @orderings [:asc, :desc]

  def stems(), do: []
  def root(), do: :sort

  def parse([:sort, field | rest], acc) when is_map(acc) and is_binary(field) do
    {left, sort_list} = parse_list([:sort, field | rest], [])
    {left, acc |> Map.put(:sort, sort_list)}
  end

  defp parse_list([:sort, field, ordering | rest], acc) when is_binary(field) and ordering in @orderings do
    parse_list([:sort | rest ], [%{field => ordering} | acc])
  end
  defp parse_list([:sort, field, opts | rest], acc) when is_binary(field) and is_list(opts) do
    parse_list([:sort | rest ], [ %{field => Enum.into(opts, %{})} | acc ])
  end
  defp parse_list([:sort, field | rest ], acc) when is_binary(field) do
    parse_list([:sort | rest], [ field | acc ])
  end
  defp parse_list([ :sort | rest ], acc) do
    {rest, acc}
  end
end