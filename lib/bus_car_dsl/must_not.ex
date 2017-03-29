defmodule BusCarDsl.MustNot do
  use BusCarDsl.Element

  @key :must_not

  TreeList.rule(@key, :match)
  TreeList.rule(@key, :term)
  TreeList.rule(@key, :exists)
  TreeList.rule(@key, :prefix)
  TreeList.rule(@key, :wildcard)
  TreeList.rule(@key, :range)
  TreeList.rule(@key, :fuzzy)

end
