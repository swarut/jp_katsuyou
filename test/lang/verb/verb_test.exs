defmodule JpKatsuyouTest.Verb do
  use ExUnit.Case
  alias JpKatsuyou.Verb

  describe "Verb" do

    test "is_irregular?/1 returns true when check with irregular verb" do
      assert Verb.is_irregular?("する") == true
      assert Verb.is_irregular?("来る") == true
    end

    test "is_irregular?/1 returns false when check with ichidan and godan verb" do
      assert Verb.is_irregular?("食べる") == false
      assert Verb.is_irregular?("話す") == false
    end

    test "is_ichidan?/1 returns true when check with ichidan verb" do
      assert Verb.is_ichidan?("食べる") == true
      assert Verb.is_ichidan?("見える") == true
    end

    test "is_ichidan?/1 returns false when check with godan and irregular verb" do
      assert Verb.is_ichidan?("する") == false
      assert Verb.is_ichidan?("来る") == false
      assert Verb.is_ichidan?("話す") == false
      assert Verb.is_ichidan?("走る") == false
    end

    test "is_godan?/1 returns true when check with godan verb" do
      assert Verb.is_godan?("成る") == true
      assert Verb.is_godan?("いく") == true
      assert Verb.is_godan?("走る") == true
    end

    test "is_godan?/1 returns false when check with ichidan and irregular verb" do
      assert Verb.is_godan?("する") == false
      assert Verb.is_godan?("来る") == false
      assert Verb.is_godan?("食べる") == false
      assert Verb.is_godan?("見える") == false
    end

    test "polite_present/2 returns correct polite present conjugation" do
      assert Verb.polite_present(%{kumi: "irregular", verb: "する"}) == "しる"
      assert Verb.polite_present(%{kumi: "ichidan", verb: "食べる"}) == "食べます"
      assert Verb.polite_present(%{kumi: "godan", verb: "話す"}) == "話します"
    end

    test "polite_order/1 returns order form of a verb" do
      assert Verb.polite_order(%{kumi: "godan", verb: "話す"}) == "話しなさい"
      assert Verb.polite_order(%{kumi: "ichidan", verb: "食べる"}) == "食べなさい"
      assert Verb.polite_order(%{kumi: "irregular", verb: "する"}) == "しなさい"
      assert Verb.polite_order(%{kumi: "irregular", verb: "来る"}) == "来なさい"
    end

    test "polite_imperative/1 returns order form of a verb" do
      assert Verb.polite_imperative(%{kumi: "godan", verb: "話す"}) == "話しなさい"
      assert Verb.polite_imperative(%{kumi: "ichidan", verb: "食べる"}) == "食べなさい"
      assert Verb.polite_imperative(%{kumi: "irregular", verb: "する"}) == "しなさい"
      assert Verb.polite_imperative(%{kumi: "irregular", verb: "来る"}) == "来なさい"
    end

    test "dic_order/1 returns order form of a verb" do
      assert Verb.dic_order(%{kumi: "godan", verb: "話す"}) == "話せ"
      assert Verb.dic_order(%{kumi: "ichidan", verb: "食べる"}) == "食べろ"
      assert Verb.dic_order(%{kumi: "irregular", verb: "する"}) == "しろ"
      assert Verb.dic_order(%{kumi: "irregular", verb: "来る"}) == "来い"
    end

    test "dic_imperative/1 returns order form of a verb" do
      assert Verb.dic_imperative(%{kumi: "godan", verb: "話す"}) == "話せ"
      assert Verb.dic_imperative(%{kumi: "ichidan", verb: "食べる"}) == "食べろ"
      assert Verb.dic_imperative(%{kumi: "irregular", verb: "する"}) == "しろ"
      assert Verb.dic_imperative(%{kumi: "irregular", verb: "来る"}) == "来い"
    end


  end
end
