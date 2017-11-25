defmodule JpKatsuyou.Lang do
  @moduledoc """
  Provides japanese language helper functions.

  ## Examples

      iex> Math.sum(1, 2)
      3

  """

  defmacro __using__(_) do

    quote do
      @hira_rows %{
        あ: [{:a, "あ"}, {:i, "い"}, {:u, "う"}, {:e, "え"}, {:o, "お"}],
        か: [{:a, "か"}, {:i, "き"}, {:u, "く"}, {:e, "け"}, {:o, "こ"}],
        が: [{:a, "が"}, {:i, "ぎ"}, {:u, "ぐ"}, {:e, "げ"}, {:o, "ご"}],
        さ: [{:a, "さ"}, {:i, "し"}, {:u, "す"}, {:e, "せ"}, {:o, "そ"}],
        ざ: [{:a, "ざ"}, {:i, "じ"}, {:u, "ず"}, {:e, "ぜ"}, {:o, "ぞ"}],
        た: [{:a, "た"}, {:i, "ち"}, {:u, "つ"}, {:e, "て"}, {:o, "と"}],
        だ: [{:a, "だ"}, {:i, "ぢ"}, {:u, "づ"}, {:e, "で"}, {:o, "ど"}],
        な: [{:a, "な"}, {:i, "に"}, {:u, "ぬ"}, {:e, "ね"}, {:o, "の"}],
        は: [{:a, "は"}, {:i, "ひ"}, {:u, "ふ"}, {:e, "へ"}, {:o, "ほ"}],
        ば: [{:a, "ば"}, {:i, "び"}, {:u, "ぶ"}, {:e, "べ"}, {:o, "ぼ"}],
        ぱ: [{:a, "ぱ"}, {:i, "ぴ"}, {:u, "ぷ"}, {:e, "ぺ"}, {:o, "ぽ"}],
        ま: [{:a, "ま"}, {:i, "み"}, {:u, "む"}, {:e, "め"}, {:o, "も"}],
        や: [{:a, "や"}, {:i, "　"}, {:u, "ゆ"}, {:e, "　"}, {:o, "よ"}],
        ら: [{:a, "ら"}, {:i, "り"}, {:u, "る"}, {:e, "れ"}, {:o, "ろ"}],
        わ: [{:a, "わ"}, {:i, "　"}, {:u, "　"}, {:e, "　"}, {:o, "を"}],
        ん: [{:a, "ん"}, {:i, "ん"}, {:u, "ん"}, {:e, "ん"}, {:o, "ん"}],
      }

      @hira_columns %{
        あ: :あ, い: :あ, う: :あ, え: :あ, お: :あ,
        か: :か, き: :か, く: :か, け: :か, こ: :か,
        が: :が, ぎ: :が, ぐ: :が, げ: :が, ご: :が,
        さ: :さ, し: :さ, す: :さ, せ: :さ, そ: :さ,
        ざ: :ざ, じ: :ざ, ず: :ざ, ぜ: :ざ, ぞ: :ざ,
        た: :た, ち: :た, つ: :た, て: :た, と: :た,
        だ: :だ, ぢ: :だ, づ: :だ, で: :だ, ど: :だ,
        な: :な, に: :な, ぬ: :な, ね: :な, の: :な,
        は: :は, ひ: :は, ふ: :は, へ: :は, ほ: :は,
        ば: :ば, び: :ば, ぶ: :ば, べ: :ば, ぼ: :ば,
        ぱ: :ぱ, ぴ: :ぱ, ぷ: :ぱ, ぺ: :ぱ, ぽ: :ぱ,
        ま: :ま, み: :ま, む: :ま, め: :ま, も: :ま,
        や: :や, ゆ: :や, よ: :や,
        ら: :ら, リ: :ら, ル: :ら, れ: :ら, る: :ら,
        わ: :わ, を: :わ,
        ん: :ん,
      }

      @doc """
      Transform the character to a specific column
        - from : a string for the original character
        - to : an atom of column name (in english)
      ## Example
            iex> Lang.shift("あ", :i)
            い
      """
      def shift(from, to) do
        row_name = @hira_columns[String.to_atom(from)]
        @hira_rows[row_name][to]
      end

      def shift_suffix(word, to) do
        last = String.last(word)
        String.replace_suffix(word, last, shift(last, to))
      end
      
    end
  end

end
