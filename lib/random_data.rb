module RandomData

    def self.random_paragraph
        sentences = []

        # pushes 4 to 6 sentences to an array
        rand(4..6).times do
            sentences << random_sentence
        end

        # joins array to create a paragraph
        sentences.join
    end

    def self.random_sentence
        strings = []

        # pushes 3 to 8 words per array
        rand(3..8).times do 
            strings << random_word
        end

        # joins strings into one string with space in between each word
        sentence = strings.join(" ")
        # capitalize string and add a period to the end
        sentence.capitalize << ".  "
    end

    def self.random_word
        # Creates an array of a to z chars
        letters = ('a'..'z').to_a
        # randomize array
        # bang! is used to keep array in place, 
        # rather than making a new array
        letters.shuffle!
        # joins the first and up to 8 chars
        # to create a word
        letters[0, rand(3..6)].join
    end
end