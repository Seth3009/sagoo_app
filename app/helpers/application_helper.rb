module ApplicationHelper
    def delimiter(number)
        number_with_delimiter(number_with_precision(number, :precision => 0), :delimiter => ",")
    end
    
end
