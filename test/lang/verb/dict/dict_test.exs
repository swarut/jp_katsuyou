defmodule JpKatsuyouTest.Verb.Dict do
  use ExUnit.Case
  alias JpKatsuyou.Verb

  describe "Dict" do

    test "dic_present/1 returns the dic form of a verb" do
      assert Verb.dic_present(%{kumi: "ichidan", verb: "食べる"}) == "食べる"
      assert Verb.dic_present(%{kumi: "godan", verb: "話す"}) == "話す"
      assert Verb.dic_present(%{kumi: "irregular", verb: "する"}) == "する"
      assert Verb.dic_present(%{kumi: "irregular", verb: "来る"}) == "来る"
    end

    test "dic_present_negative/1 returns the present negative form of a verb" do
      assert Verb.dic_present_negative(%{kumi: "ichidan", verb: "食べる"}) == "食べない"
      assert Verb.dic_present_negative(%{kumi: "godan", verb: "会う"}) == "会わない"
      assert Verb.dic_present_negative(%{kumi: "godan", verb: "買う"}) == "買わない"
      assert Verb.dic_present_negative(%{kumi: "godan", verb: "聞く"}) == "聞かない"
      assert Verb.dic_present_negative(%{kumi: "godan", verb: "話す"}) == "話さない"
      assert Verb.dic_present_negative(%{kumi: "irregular", verb: "する"}) == "しない"
      assert Verb.dic_present_negative(%{kumi: "irregular", verb: "来る"}) == "来ない"
    end

    test "dic_past/1 returns the past form of a verb" do
      assert Verb.dic_past(%{kumi: "ichidan", verb: "食べる"}) == "食べた"
      assert Verb.dic_past(%{kumi: "godan", verb: "話す"}) == "話した"
      assert Verb.dic_past(%{kumi: "godan", verb: "書く"}) == "書いた"
      assert Verb.dic_past(%{kumi: "godan", verb: "泳ぐ"}) == "泳いだ"
      assert Verb.dic_past(%{kumi: "godan", verb: "飲む"}) == "飲んだ"
      assert Verb.dic_past(%{kumi: "godan", verb: "死ぬ"}) == "死んだ"
      assert Verb.dic_past(%{kumi: "godan", verb: "遊ぶ"}) == "遊んだ"
      assert Verb.dic_past(%{kumi: "godan", verb: "切る"}) == "切った"
      assert Verb.dic_past(%{kumi: "godan", verb: "持つ"}) == "待った"
      assert Verb.dic_past(%{kumi: "godan", verb: "買う"}) == "買った"
      assert Verb.dic_past(%{kumi: "irregular", verb: "する"}) == "した"
      assert Verb.dic_past(%{kumi: "irregular", verb: "来る"}) == "来た"
    end

    test "dic_order/1 returns order form of a verb" do
      assert Verb.dic_order(%{kumi: "ichidan", verb: "食べる"}) == "食べろ"
      assert Verb.dic_order(%{kumi: "godan", verb: "話す"}) == "話せ"
      assert Verb.dic_order(%{kumi: "irregular", verb: "する"}) == "しろ"
      assert Verb.dic_order(%{kumi: "irregular", verb: "来る"}) == "来い"
    end

    test "dic_imperative/1 returns order form of a verb" do
      assert Verb.dic_imperative(%{kumi: "ichidan", verb: "食べる"}) == "食べろ"
      assert Verb.dic_imperative(%{kumi: "godan", verb: "話す"}) == "話せ"
      assert Verb.dic_imperative(%{kumi: "irregular", verb: "する"}) == "しろ"
      assert Verb.dic_imperative(%{kumi: "irregular", verb: "来る"}) == "来い"
    end

    test "dic_conditional/1 returns conditional form of a verb" do
      assert Verb.dic_conditional(%{kumi: "ichidan", verb: "食べる"}) == "食べれば"
      assert Verb.dic_conditional(%{kumi: "godan", verb: "話す"}) == "話せば"
      assert Verb.dic_conditional(%{kumi: "irregular", verb: "する"}) == "すれば"
      assert Verb.dic_conditional(%{kumi: "irregular", verb: "来る"}) == "来れば"
    end

    test "dic_conditional_negative/1 returns conditional form of a verb" do
      assert Verb.dic_conditional_negative(%{kumi: "ichidan", verb: "食べる"}) == "食べなければ"
      assert Verb.dic_conditional_negative(%{kumi: "godan", verb: "話す"}) == "話さなければ"
      assert Verb.dic_conditional_negative(%{kumi: "irregular", verb: "する"}) == "しなければ"
      assert Verb.dic_conditional_negative(%{kumi: "irregular", verb: "来る"}) == "来なければ"
    end

  end
end
