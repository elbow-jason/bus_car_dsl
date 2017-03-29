defmodule BusCarDsl.Tree.List do

  defmacro __using__(_) do
    quote do
      alias BusCarDsl.Tree.Leaf
    end
  end

  defmacro rule(root, stem) do
    quote do
      Module.put_attribute __MODULE__, :stems, unquote(stem)
      Module.put_attribute(__MODULE__, :handler, BusCarDsl.Tree.get_handler(unquote(stem)))
      defp parse_list([unquote(root), unquote(stem) | rest], acc) do
        {rest, parsed} = @handler.parse([unquote(stem) | rest], [])
        parse_list([unquote(root) | rest], parsed ++ acc)
      end
      Module.delete_attribute(__MODULE__, :handler)      
    end
  end

end