defmodule BusCarDsl.Must do
  use BusCarDsl.Element

  @key :must

  TreeList.rule(@key, :match)
  TreeList.rule(@key, :term)
  TreeList.rule(@key, :exists)
  TreeList.rule(@key, :prefix)
  TreeList.rule(@key, :wildcard)
  TreeList.rule(@key, :range)
  TreeList.rule(@key, :fuzzy)
  TreeList.rule(@key, :regexp)

end
