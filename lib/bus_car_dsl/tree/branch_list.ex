defmodule BusCarDsl.Tree.BranchList do

  defmacro __using__(_) do
    quote do
      alias BusCarDsl.Tree.BranchList
    end
  end

  defmacro rule(root, stem) do
    quote do
      Module.register_attribute __MODULE__, :stems, accumulate: true
      @stems unquote(stem)
      Module.put_attribute(__MODULE__, :handler, BusCarDsl.Tree.get_handler(unquote(stem)))
      defp parse_map([unquote(root), unquote(stem) | rest ], acc) when is_map(acc) do
        {rest, leaves} = @handler.parse([ unquote(stem) | rest ], [])
        map = %{} |> Map.put(unquote(stem), leaves)
        update = fn (prev) -> Map.merge(prev, map) end
        acc = Map.update(acc, unquote(root), map, update)
        parse_map([unquote(root) | rest], acc)
      end
      Module.delete_attribute(__MODULE__, :handler)
    end
  end

end
