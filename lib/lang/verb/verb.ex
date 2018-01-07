defmodule JpKatsuyou.Verb do
  @moduledoc """
  Provides functions related to verb

  """

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
    "蹴る" => true,
    "成る" => true
  }

  @doc """
  Check whether the supplied verb is irregular verb or not.

  ## Example
      iex> Verb.is_irregular?("する")
      true
  """
  def is_irregular?("する"), do: true
  def is_irregular?("来る"), do: true
  def is_irregular?(_),    do: false

  @doc """
  Check whether the supplied verb is godan verb or not.

  ## Example
      iex> Verb.is_godan?("走る")
      true
  """
  def is_godan?(verb) do
    @special_godan_lookup[verb] || !String.ends_with?(verb, "る")
  end

  @doc """
  Check whether the supplied verb is ichidan verb or not.

  ## Example
      iex> Verb.is_ichidan?("食べる")
      true
  """
  def is_ichidan?(verb) do
    !is_irregular?(verb) && !is_godan?(verb) && String.ends_with?(verb, "る")
  end

  @doc """
  List all possible conjugations.

  ## Example
      iex> Verb.all_conjugations()
  """
  def all_conjugations() do
    %{
      dic: [
        "past",
        "present",
        "present_negative",
        "order"
      ],
      polite: [
        "past",
        "present",
        "order"
      ]
    }
  end

end
