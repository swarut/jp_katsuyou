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
      assert Verb.polite_present(%{verb: "する", kumi: "irregular"}) == "しる"
      assert Verb.polite_present(%{verb: "食べる", kumi: "ichidan"}) == "食べます"
      assert Verb.polite_present(%{verb: "話す", kumi: "godan"}) == "話します"
    end


  end
end
