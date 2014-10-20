class Boggle
	attr_reader :alph, :n, :board
	attr_accessor :occurences
	def initialize(n)
		@n = n
		@alph = ('a'..'z').to_a
		@occurences = {}
		@alph.map do |a|
			@occurences[a] = 0
		end
	end
	def find_word(word) 

		rows = @board.map do |r|
			r.join
		end

		columns = []
		n.times do 
			columns << []
		end

		@board.each_with_index do |row, y_index|
			row.each_with_index do |letter, x_index|
				columns[x_index][y_index] = letter
			end
			columns
		end
		rows.include?(word) || columns.join.include?(word)

	end

	def make_board
		@board = []
		@n.times do 
			row = []
			@n.times do
				row.push(make_letter)
			end
			@board.push(row)
		end
		@board 
	end
	def make_letter 
		letter = alph[Random.rand(0..25)]
		while @occurences[letter] > (@n-1) 
			letter = alph[Random.rand(0..25)]
		end
		@occurences[letter] += 1
		letter
	end
end
game = Boggle.new(5)
game.make_board
game.find_word("to") 
