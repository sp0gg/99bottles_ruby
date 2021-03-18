# frozen_string_literal: true

class Bottles # committed after 30 minutes
  def song
    verses(99, 0)
  end

  def verses(start_verse, end_verse)
    start_verse.downto(end_verse).map { |v| verse(v) }.join "\n"
  end

  def verse(count)
    "#{main_phrase(count)} of beer on the wall, " \
      "#{main_phrase(count, capitalize: false)} of beer.\n" \
      "#{final_phrase(count)} of beer on the wall.\n"
  end

  def main_phrase(count, **args)
    "#{bottles_starting_word(count, args)} #{bottle_word(count)}"
  end

  def final_phrase(count)
    return 'Go to the store and buy some more, 99 bottles' if count.zero?

    "Take #{bottles_to_take_word(count)} down and pass it around, " \
      "#{bottles_remaining_word(count)} #{bottle_word(count - 1)}"
  end

  def bottles_starting_word(count, capitalize: true)
    word = capitalize ? 'No more' : 'no more'
    return word if count.zero?

    count
  end

  def bottle_word(count)
    return 'bottle' if count == 1

    'bottles'
  end

  def bottles_remaining_word(count)
    return 'no more' if count == 1

    count - 1
  end

  def bottles_to_take_word(count)
    return 'it' if count == 1

    'one'
  end
end
