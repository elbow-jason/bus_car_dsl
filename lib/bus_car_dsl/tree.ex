defmodule BusCarDsl.Tree do
  alias BusCarDsl, as: Dsl

  @module_list [
    {Dsl.Term,    :term},
    {Dsl.Bool,    :bool},
    {Dsl.Must,    :must},
    {Dsl.Match,   :match},
    {Dsl.Query,   :query},
    {Dsl.Fuzzy,   :fuzzy},
    {Dsl.Range,   :range},
    {Dsl.Nested,  :nested},
    {Dsl.Filter,  :filter},
    {Dsl.Exists,  :exists},
    {Dsl.Prefix,  :prefix},
    {Dsl.Regexp,  :regexp},
    {Dsl.Should,  :should},
    {Dsl.Source,  :source},
    {Dsl.Size,    :size},
    {Dsl.MustNot, :must_not},
    {Dsl.Wildcard, :wildcard},
    {Dsl.Highlight, :highlight},
    {Dsl.QueryString, :query_string},
    {Dsl.ConstantScore, :constant_score},
  ]

  def get_key(mod) do
    case Enum.find(@module_list, fn {k, _v} -> k == mod end) do
      {^mod, key} -> key
      err -> raise "Invalid Module - #{inspect mod} #{inspect err}"
    end
  end

  def get_handler(key) do
    case Enum.find(@module_list, fn {_k, v} -> v == key end) do
      {mod, ^key} -> mod
      err -> raise "Invalid Handler Key - #{inspect key} #{inspect err}"
    end
  end

  def stem_leaf(field, opts, default_key, value) do
    %{field => leaf(opts, default_key, value)}
  end

  def leaf(opts, default_key, value) when opts |> is_list do
    opts
    |> Enum.into(%{})
    |> leaf(default_key, value)
  end
  def leaf(opts, default_key, value) when opts |> is_map do
    opts
    |> Map.put(default_key, value)
  end

  def accumulate_leaf(acc, key, opts, field, subkey, value) when acc |> is_map do
    acc |> Map.put(key, stem_leaf(field, opts, subkey, value))
  end
  def accumulate_leaf(acc, key, opts, field, subkey, value) when acc |> is_list do
    [ accumulate_leaf(%{}, key, opts, field, subkey, value) | acc ]
  end


end
