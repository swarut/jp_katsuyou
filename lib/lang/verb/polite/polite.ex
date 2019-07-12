defmodule JpKatsuyou.Verb.Polite do

  alias JpKatsuyou.Lang

  def polite_past(%{kumi: "ichidan", verb: verb}) do
    verb
    |> String.replace_suffix("る", "ました")
  end
  def polite_past(%{kumi: "godan", verb: verb}) do
    verb
    |> Lang.shift_suffix(:i)
    |> String.replace_suffix("", "ました")
  end
  def polite_past(%{kumi: "irregular", verb: verb}) do
    case verb do
      "する" -> "しました"
      "来る" -> "来ました"
    end
  end
  def polite_past_negative(%{kumi: _kumi, verb: _verb} = verb_item) do
    polite_past(verb_item)
    |> String.replace_suffix("した", "せんでした")
  end

  def polite_present(%{kumi: "ichidan", verb: verb}) do
    verb
    |> String.replace_suffix("る", "ます")
  end
  def polite_present(%{kumi: "godan", verb: verb}) do
    verb
    |> Lang.shift_suffix(:i)
    |> String.replace_suffix("", "ます")
  end
  def polite_present(%{kumi: "irregular", verb: verb}) do
    case verb do
      "する" -> "しる"
      "来る" -> "来ます"
    end
  end

  def polite_order(%{kumi: "ichidan", verb: verb}) do
    verb
    |> String.replace_suffix("る", "なさい")
  end
  def polite_order(%{kumi: "godan", verb: verb}) do
    verb
    |> Lang.shift_suffix(:i)
    |> String.replace_suffix("", "なさい")

  end
  def polite_order(%{kumi: "irregular", verb: verb}) do
    case verb do
      "する" -> "しなさい"
      "来る" -> "来なさい"
    end
  end
  defdelegate polite_imperative(map), to: __MODULE__, as: :polite_order

end
