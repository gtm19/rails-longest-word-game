class GamesController < ApplicationController

  def new
    @letters = Array.new(9) { ("A".."Z").to_a.sample }
  end
  
  def score
    @word = params["word"]
    letters = params["letters"].split
    in_grid = attempt_in_grid?(@word, letters)
    @message = "#{@word.upcase} #{"not " unless in_grid}in grid"
  end

  private

  def attempt_in_grid?(attempt, grid)
    guess = attempt.upcase.chars
    guess.all? { |letter| guess.count(letter) <= grid.count(letter) }
  end
end
