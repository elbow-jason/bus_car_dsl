defmodule BusCarDsl.Source do

  @root :source
  @stems [
    :excludes,
    :includes,
  ]

  def root,  do: @root
  def stems, do: @stems

  def parse([:source], acc) do
    {[], acc}
  end
  def parse([:source, :excludes, list | rest], acc) when is_map(acc) and is_list(list) do
    parse([:source | rest], merge_map(%{excludes: list}, acc))
  end
  def parse([:source, :includes, list | rest], acc) when is_map(acc) and is_list(list) do
    parse([:source | rest], merge_map(%{includes: list}, acc))
  end
  def parse([:source, str | rest], acc) when is_map(acc) and is_binary(str) do
    parse([:source | rest], acc |> Map.put(:source, str))
  end

  def parse([:source, list | rest], acc) when is_map(acc) and is_list(list) do
    parse([:source | rest], acc |> Map.put(:source, list))
  end

  def parse([:source | rest], acc) do
    {rest, acc}
  end

  defp merge_map(map, acc) do
    acc
    |> Map.update(:source, map, fn prev -> Map.merge(prev, map) end)
  end

end