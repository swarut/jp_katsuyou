defmodule JpKatsuyouTest.Verb.Polite do
  use ExUnit.Case
  alias JpKatsuyou.Verb.Polite

  describe "Polite" do

    test "polite_past/2 returns correct polite past conjugation" do
      assert Polite.polite_past(%{kumi: "ichidan", verb: "食べる"}) == "食べました"
      assert Polite.polite_past(%{kumi: "godan", verb: "話す"}) == "話しました"
      assert Polite.polite_past(%{kumi: "irregular", verb: "する"}) == "しました"
      assert Polite.polite_past(%{kumi: "irregular", verb: "来る"}) == "来ました"
    end

    test "polite_past_negative/2 returns correct polite past conjugation" do
      assert Polite.polite_past_negative(%{kumi: "ichidan", verb: "食べる"}) == "食べませんでした"
      assert Polite.polite_past_negative(%{kumi: "godan", verb: "話す"}) == "話しませんでした"
      assert Polite.polite_past_negative(%{kumi: "irregular", verb: "する"}) == "しませんでした"
      assert Polite.polite_past_negative(%{kumi: "irregular", verb: "来る"}) == "来ませんでした"
    end

    test "polite_present/2 returns correct polite present conjugation" do
      assert Polite.polite_present(%{kumi: "ichidan", verb: "食べる"}) == "食べます"
      assert Polite.polite_present(%{kumi: "godan", verb: "話す"}) == "話します"
      assert Polite.polite_present(%{kumi: "irregular", verb: "する"}) == "しる"
    end

    test "polite_order/1 returns order form of a verb" do
      assert Polite.polite_order(%{kumi: "ichidan", verb: "食べる"}) == "食べなさい"
      assert Polite.polite_order(%{kumi: "godan", verb: "話す"}) == "話しなさい"
      assert Polite.polite_order(%{kumi: "irregular", verb: "する"}) == "しなさい"
      assert Polite.polite_order(%{kumi: "irregular", verb: "来る"}) == "来なさい"
    end

    test "polite_imperative/1 returns order form of a verb" do
      assert Polite.polite_imperative(%{kumi: "ichidan", verb: "食べる"}) == "食べなさい"
      assert Polite.polite_imperative(%{kumi: "godan", verb: "話す"}) == "話しなさい"
      assert Polite.polite_imperative(%{kumi: "irregular", verb: "する"}) == "しなさい"
      assert Polite.polite_imperative(%{kumi: "irregular", verb: "来る"}) == "来なさい"
    end

  end
end
