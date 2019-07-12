defmodule JpKatsuyouTest.Verb.Dict do
  use ExUnit.Case
  alias JpKatsuyou.Verb.Dict

  describe "Dict" do

    test "dic_present/1 returns the dic form of a verb" do
      assert Dict.dic_present(%{kumi: "ichidan", verb: "食べる"}) == "食べる"
      assert Dict.dic_present(%{kumi: "godan", verb: "話す"}) == "話す"
      assert Dict.dic_present(%{kumi: "irregular", verb: "する"}) == "する"
      assert Dict.dic_present(%{kumi: "irregular", verb: "来る"}) == "来る"
    end

    test "dic_present_negative/1 returns the present negative form of a verb" do
      assert Dict.dic_present_negative(%{kumi: "ichidan", verb: "食べる"}) == "食べない"
      assert Dict.dic_present_negative(%{kumi: "godan", verb: "会う"}) == "会わない"
      assert Dict.dic_present_negative(%{kumi: "godan", verb: "買う"}) == "買わない"
      assert Dict.dic_present_negative(%{kumi: "godan", verb: "聞く"}) == "聞かない"
      assert Dict.dic_present_negative(%{kumi: "godan", verb: "話す"}) == "話さない"
      assert Dict.dic_present_negative(%{kumi: "irregular", verb: "する"}) == "しない"
      assert Dict.dic_present_negative(%{kumi: "irregular", verb: "来る"}) == "来ない"
    end

    test "dic_past/1 returns the past form of a verb" do
      assert Dict.dic_past(%{kumi: "ichidan", verb: "食べる"}) == "食べた"
      assert Dict.dic_past(%{kumi: "godan", verb: "話す"}) == "話した"
      assert Dict.dic_past(%{kumi: "godan", verb: "書く"}) == "書いた"
      assert Dict.dic_past(%{kumi: "godan", verb: "泳ぐ"}) == "泳いだ"
      assert Dict.dic_past(%{kumi: "godan", verb: "飲む"}) == "飲んだ"
      assert Dict.dic_past(%{kumi: "godan", verb: "死ぬ"}) == "死んだ"
      assert Dict.dic_past(%{kumi: "godan", verb: "遊ぶ"}) == "遊んだ"
      assert Dict.dic_past(%{kumi: "godan", verb: "切る"}) == "切った"
      assert Dict.dic_past(%{kumi: "godan", verb: "持つ"}) == "持った"
      assert Dict.dic_past(%{kumi: "godan", verb: "買う"}) == "買った"
      assert Dict.dic_past(%{kumi: "irregular", verb: "する"}) == "した"
      assert Dict.dic_past(%{kumi: "irregular", verb: "来る"}) == "来た"
    end

    test "dic_past_negative/1 returns the past negative form of a verb" do
      assert Dict.dic_past_negative(%{kumi: "ichidan", verb: "食べる"}) == "食べなかった"
      assert Dict.dic_past_negative(%{kumi: "godan", verb: "話す"}) == "話さなかった"
      assert Dict.dic_past_negative(%{kumi: "godan", verb: "書く"}) == "書かなかった"
      assert Dict.dic_past_negative(%{kumi: "godan", verb: "泳ぐ"}) == "泳がなかった"
      assert Dict.dic_past_negative(%{kumi: "godan", verb: "飲む"}) == "飲まなかった"
      assert Dict.dic_past_negative(%{kumi: "godan", verb: "死ぬ"}) == "死ななかった"
      assert Dict.dic_past_negative(%{kumi: "godan", verb: "遊ぶ"}) == "遊ばなかった"
      assert Dict.dic_past_negative(%{kumi: "godan", verb: "切る"}) == "切らなかった"
      assert Dict.dic_past_negative(%{kumi: "godan", verb: "持つ"}) == "持たなかった"
      assert Dict.dic_past_negative(%{kumi: "godan", verb: "買う"}) == "買わなかった"
      assert Dict.dic_past_negative(%{kumi: "irregular", verb: "する"}) == "しなかった"
      assert Dict.dic_past_negative(%{kumi: "irregular", verb: "来る"}) == "来なかった"
    end

    test "dic_order/1 returns order form of a verb" do
      assert Dict.dic_order(%{kumi: "ichidan", verb: "食べる"}) == "食べろ"
      assert Dict.dic_order(%{kumi: "godan", verb: "話す"}) == "話せ"
      assert Dict.dic_order(%{kumi: "irregular", verb: "する"}) == "しろ"
      assert Dict.dic_order(%{kumi: "irregular", verb: "来る"}) == "来い"
    end

    test "dic_imperative/1 returns order form of a verb" do
      assert Dict.dic_imperative(%{kumi: "ichidan", verb: "食べる"}) == "食べろ"
      assert Dict.dic_imperative(%{kumi: "godan", verb: "話す"}) == "話せ"
      assert Dict.dic_imperative(%{kumi: "irregular", verb: "する"}) == "しろ"
      assert Dict.dic_imperative(%{kumi: "irregular", verb: "来る"}) == "来い"
    end

    test "dic_conditional/1 returns conditional form of a verb" do
      assert Dict.dic_conditional(%{kumi: "ichidan", verb: "食べる"}) == "食べれば"
      assert Dict.dic_conditional(%{kumi: "godan", verb: "話す"}) == "話せば"
      assert Dict.dic_conditional(%{kumi: "irregular", verb: "する"}) == "すれば"
      assert Dict.dic_conditional(%{kumi: "irregular", verb: "来る"}) == "来れば"
    end

    test "dic_conditional_negative/1 returns conditional form of a verb" do
      assert Dict.dic_conditional_negative(%{kumi: "ichidan", verb: "食べる"}) == "食べなければ"
      assert Dict.dic_conditional_negative(%{kumi: "godan", verb: "話す"}) == "話さなければ"
      assert Dict.dic_conditional_negative(%{kumi: "irregular", verb: "する"}) == "しなければ"
      assert Dict.dic_conditional_negative(%{kumi: "irregular", verb: "来る"}) == "来なければ"
    end

  end
end
