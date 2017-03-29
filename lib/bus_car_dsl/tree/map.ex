defmodule BusCarDsl.Tree.Map do
  defmacro __using__(_) do
    quote do
      import BusCarDsl.Tree.Map
    end
  end

  @doc """
  This `rule` macro defines a parse_map/2 function for the calling module.
  An example:
    `map_rule(:filter, :term)` injects a parse_map/2 function with the
    signature `def parse_map([:filter, :term | rest], acc) do`
  """
  defmacro rule(root, stem) do
    quote do
      Module.put_attribute __MODULE__, :stems, unquote(stem)
      Module.put_attribute(__MODULE__, :handler, BusCarDsl.Tree.get_handler(unquote(stem)))
      defp parse_map([unquote(root), unquote(stem) | rest], acc) do
        {rest, parsed} = @handler.parse([unquote(stem) | rest], %{})
        parse_map([unquote(root) | rest], acc |> Map.put(unquote(root), parsed))
      end
      Module.delete_attribute(__MODULE__, :handler)      
    end
  end

end