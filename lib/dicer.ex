defmodule Dicer do
  @moduledoc """
  Provides functions for generating an list of words based on diceware
  """

  @langauges [:portuguese, :latin]

  @typedoc """
  Diceware word lists specific by language
  """
  @type languages() :: :portuguese | :latin

  @doc """
  Finds `quant` words in the `language` diceware list

  Returns an list of words as strings

  ## Examples

      iex> Dicer.get_words(5, :latin)
      ["incensi", "essem", "archias", "salsus", "angusta"]

  """

  @spec get_words(integer(), languages()) :: [binary()]
  def get_words(quant, language)
      when is_integer(quant) and is_atom(language) and language in @langauges do
    diceware_list = file2keyword("./diceware/#{language}.txt")

    1..quant
    |> Enum.map(fn _ -> get_number() |> find_word(diceware_list) end)
  end

  defp get_number() do
    1..5
    |> Enum.map(fn _ -> :rand.uniform(6) end)
    |> Enum.join("")
  end

  defp file2keyword(path) do
    path
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      [num, word] = String.split(line, "\t", trim: true)

      {:"#{num}", word}
    end)
  end

  defp find_word(number_str, diceware_list) do
    Keyword.get(diceware_list, :"#{number_str}")
  end
end
