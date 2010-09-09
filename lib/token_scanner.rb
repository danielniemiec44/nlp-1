
module NLP
    class TokenScanner
        
        attr_reader :text, :tokens

        def initialize(text)
            @text = text
            @pos = 0
            @tokens = flatten_text(@text)
        end

        def next(type)
            @pos+=1

            case type
            when :word
                while @pos < @tokens.size and !@tokens[@pos].word?
                    @pos+= 1
                end

            when :interp
                while @pos < @tokens.size and !@tokens[@pos].interp?
                    @pos+= 1
                end
               
             when :number
                while @pos < @tokens.size and !@tokens[@pos].number?
                    @pos+= 1
                end
            end
        end


        def current
            
            if @pos == @tokens.size
                nil
            else
                @tokens[@pos]
            end

        end


        def index
            @pos
        end


        def end?
            @pos == tokens.size
        end
               

        private 

        def flatten_text(text)
            flattened = []
            text.each { |s| s.tokens.each {|t| flattened.push t } }
            flattened
        end

end
end
