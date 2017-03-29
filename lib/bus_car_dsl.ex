defmodule BusCarDsl do
  @moduledoc """
  
  """

  def parse(dsl, acc \\ %{})
  def parse([], acc), do: acc
  def parse([:query | rest ], acc) do
    {rest, acc} = BusCarDsl.Query.parse([:query | rest], acc)
    parse(rest, acc)
  end



  # defmacro stem_rule(root, stem) do
  #   quote do
  #     @stems unquote(stem)
  #     def parse_map([unquote(root), unquote(stem) | rest], acc) do
  #       mod = BusCarDsl.get_handler(unquote(stem))
  #       {rest, parsed} = apply(mod, :parse, [[unquote(stem) | rest], []])
  #       parse_map([unquote(root) | rest], acc |> Map.put(unquote(root), parsed))
  #     end
  #   end
  # end




end
