defmodule CardTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck amkes 20 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 20
  end

  test "shuffle will randomize a deck" do
    deck = Cards.create_deck
    assert deck != Cards.shuffle deck
  end
end
