defmodule BusCarDsl.Filter do
  use BusCarDsl.Element


  @key :filter

  TreeList.rule(@key, :match)
  TreeList.rule(@key, :term)
  TreeList.rule(@key, :exists)
  TreeList.rule(@key, :prefix)
  TreeList.rule(@key, :wildcard)
  TreeList.rule(@key, :range)
  TreeList.rule(@key, :fuzzy)
  TreeList.rule(@key, :regexp)

  TreeMap.rule(@key, :range)
  TreeMap.rule(@key, :match)
  TreeMap.rule(@key, :term)

  def stopwords(words) when words |> is_list do
    %{
      stopwords_filter: %{
        type: "stop",
        stopwords: words
      }
    }
  end

end
