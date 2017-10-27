defmodule Cards do
  @moduledoc """
    Provides methods for creating and dealing deck of cards
  """
  @doc """
    Returns list of playing cards
  """

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamond"]
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end
  @doc """
    check if a deck contains a given card
    ## Examples
      iex(1)> deck = Cards.create_deck
      iex(2)> Cards.contains?(deck, "Ace of Spades")
      true

  """
  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _} -> "That file doesn't exist"
    end

  end
end
