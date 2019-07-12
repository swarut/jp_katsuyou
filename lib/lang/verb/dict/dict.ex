defmodule JpKatsuyou.Verb.Dict do

  alias JpKatsuyou.Lang

  def dic_present(%{kumi: "ichidan", verb: verb}) do
    verb
  end
  def dic_present(%{kumi: "godan", verb: verb}) do
    verb
  end
  def dic_present(%{kumi: "irregular", verb: verb}) do
    verb
  end

  def dic_present_negative(%{kumi: "ichidan", verb: verb}) do
    verb
    |> String.replace_suffix("る", "ない")
  end
  def dic_present_negative(%{kumi: "godan", verb: verb}) do
    case String.ends_with?(verb, "う") do
      true ->
        verb
        |> String.replace_suffix("う", "わない")
      false ->
        verb
        |> Lang.shift_suffix(:a)
        |> String.replace_suffix("", "ない")
    end
  end
  def dic_present_negative(%{kumi: "irregular", verb: verb}) do
    case verb do
      "する" -> "しない"
      "来る" -> "来ない"
    end
  end

  def dic_past(%{kumi: "ichidan", verb: verb}) do
    verb
    |> String.replace_suffix("る", "た")
  end
  def dic_past(%{kumi: "godan", verb: verb}) do
    case String.last(verb) do
      "す" ->
        verb
        |> Lang.shift_suffix(:i)
        |> String.replace_suffix("", "た")
      "く" ->
        verb |> String.replace_suffix("く", "いた")
      "ぐ" ->
        verb |> String.replace_suffix("ぐ", "いだ")
      "む" ->
        verb |> String.replace_suffix("む", "んだ")
      "ぬ" ->
        verb |> String.replace_suffix("ぬ", "んだ")
      "ぶ" ->
        verb |> String.replace_suffix("ぶ", "んだ")
      "る" ->
        verb |> String.replace_suffix("る", "った")
      "つ" ->
        verb |> String.replace_suffix("つ", "った")
      "う" ->
        verb |> String.replace_suffix("う", "った")
    end
  end
  def dic_past(%{kumi: "irregular", verb: verb}) do
    case verb do
      "する" -> "した"
      "来る" -> "来た"
    end
  end

  def dic_past_negative(%{kumi: _kumi, verb: _verb} = verb_item) do
    dic_present_negative(verb_item)
    |> String.replace_suffix("い", "かった")
  end

  def dic_order(%{kumi: "ichidan", verb: verb}) do
    verb
    |> Lang.shift_suffix(:o)
  end
  def dic_order(%{kumi: "godan", verb: verb}) do
    verb
    |> Lang.shift_suffix(:e)
  end
  def dic_order(%{kumi: "irregular", verb: verb}) do
    case verb do
      "する" -> "しろ"
      "来る" -> "来い"
    end
  end
  defdelegate dic_imperative(map), to: __MODULE__, as: :dic_order

  def dic_conditional(%{kumi: "ichidan", verb: verb}) do
    verb
    |> String.replace_suffix("る", "れば")
  end
  def dic_conditional(%{kumi: "godan", verb: verb}) do
    verb
    |> Lang.shift_suffix(:e)
    |> String.replace_suffix("", "ば")
  end
  def dic_conditional(%{kumi: "irregular", verb: verb}) do
    case verb do
      "する" -> "すれば"
      "来る" -> "来れば"
    end
  end

  def dic_conditional_negative(verb) do
    verb
    |> dic_present_negative
    |> String.replace_suffix("い", "ければ")
  end

end
