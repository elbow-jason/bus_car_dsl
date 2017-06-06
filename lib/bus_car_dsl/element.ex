defmodule BusCarDsl.Element do

  defmacro __using__(_opts) do
    quote do
      require BusCarDsl.Tree.{Leaf, BranchList, List, Map}
      alias BusCarDsl.Tree.Leaf,        as: TreeLeaf
      alias BusCarDsl.Tree.BranchList,  as: TreeBranchList
      alias BusCarDsl.Tree.List,        as: TreeList
      alias BusCarDsl.Tree.Map,         as: TreeMap


      the_root = BusCarDsl.Tree.get_key(__MODULE__)
      Module.put_attribute __MODULE__, :root, the_root
      Module.register_attribute __MODULE__, :stems, accumulate: true

      @before_compile BusCarDsl.Element

    end
  end


  defmacro __before_compile__(_) do
    quote do

      defp parse_list([ @root | rest ], acc) do
        {rest, acc}
      end

      defp parse_map([ @root | rest ], acc) do
        {rest, acc}
      end

      if Module.defines?(__MODULE__, {:parse_map, 2}, :defp) do
        def parse([@root, stem | rest], acc) when is_map(acc) do
          if stem in @stems do
            parse_map([@root, stem | rest], acc) #there are more elements under this root.
          else
            {[ stem | rest ], acc} # remove root from sequence
          end
        end
      end
      if Module.defines?(__MODULE__, {:parse_list, 2}, :defp) do
        def parse([@root, stem | rest], acc) when is_list(acc) do
          if stem in @stems do
            parse_list([@root, stem | rest], acc)
          else
            {[ stem | rest ], acc}
          end
        end
      end

      def parse([@root | rest], acc) do
        {rest, acc}
      end

      if !Module.defines?(__MODULE__, {:stems, 0}, :def) do
        def stems, do: @stems
      end

      if !Module.defines?(__MODULE__, {:root, 0}, :def) do
        def root,  do: @root
      end

    end
  end

end