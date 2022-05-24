defmodule DicerTest do
  use ExUnit.Case
  doctest Dicer

  test "generates any size string list with an language" do
    size = :rand.uniform(30)
    lang = Enum.random([:portuguese, :latin])

    words = Dicer.get_words(size, lang)

    assert length(words) == size
  end
end
