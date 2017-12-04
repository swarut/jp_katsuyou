defmodule JpKatsuyou.Verb do
  @moduledoc """
  Provides functions related to verb

  """

  # use JpKatsuyou.Verb.Polite
  use JpKatsuyou.Verb.Dict
  use JpKatsuyou.Verb.Polite

  @special_godan_lookup %{
    "走る" => true,
    "要る" => true,
    "入る" => true,
    "知る" => true,
    "切る" => true,
    "返る" => true,
    "帰る" => true,
    "滑る" => true,
    "蹴る" => true
  }

  def is_irregular?("する"), do: true
  def is_irregular?("来る"), do: true
  def is_irregular?(_),    do: false

  def is_godan?(verb) do

  end


  def is_ichidan?(verb) do

  end





end
