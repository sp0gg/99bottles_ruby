# frozen_string_literal: true

class Bottles
  def song
    verses(99, 0)
  end

  def verses(start_verse, end_verse)
    start_verse.downto(end_verse).map { |v| verse(v) }.join "\n"
  end

  def verse(count)
    bottle = Bottle.new(count)
    "#{bottle.main_phrase} of beer on the wall, " \
      "#{bottle.main_phrase(capitalize: false)} of beer.\n" \
      "#{bottle.final_phrase} of beer on the wall.\n"
  end
end

class Bottle
  def initialize(number)
    @number = number
  end

  def main_phrase(**args)
    "#{bottles_starting_word(args)} #{bottle_word}"
  end

  def final_phrase
    return 'Go to the store and buy some more, 99 bottles' if number.zero?

    "Take #{bottles_to_take_word} down and pass it around, " \
      "#{quantity_remaining_word} #{bottles_remaining_word}"
  end

  def bottles_starting_word(capitalize: true)
    word = capitalize ? 'No more' : 'no more'
    return word if number.zero?

    number
  end

  def bottle_word
    return 'bottle' if (number) == 1

    'bottles'
  end

  def bottles_remaining_word
    return 'bottle' if (number - 1) == 1

    'bottles'
  end

  def quantity_remaining_word
    return 'no more' if number == 1

    number - 1
  end

  def bottles_to_take_word
    return 'it' if number == 1

    'one'
  end

  private

  attr_reader :number
end

# class Wall
#   def initialize(quantity)
#     @bottles_remaining = quantity
#   end
#
#   def take_bottle
#     bottle = Bottle.new(bottles_remaining)
#     @bottles_remaining -= 1
#     bottle
#   end
#
#   attr_reader :bottles_remaining
#
#   private
#
#   attr_writer :bottles_remaining
# end
