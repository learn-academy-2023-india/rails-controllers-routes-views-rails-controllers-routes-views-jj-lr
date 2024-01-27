class MainController < ApplicationController

    def cubed
      @num = params[:num]
      if number?(@num)
        @cubed_result = @num.to_i ** 3
      else
        @error_message = "Please enter a valid number."
      end
    end
  
    def evenly
      @num1 = params[:num1]
      @num2 = params[:num2]
  
      if number?(@num1) && number?(@num2)
        @num1 = @num1.to_i
        @num2 = @num2.to_i
        if @num2.zero?
          @error_message = "Cannot divide by zero."
        else
          @outcome = (@num1 % @num2).zero? ? "evenly" : "not evenly"
        end
      else
        @error_message = "Please enter valid numbers for both parameters."
      end
    end
  
    def palindrome
      @string = params[:string]
      if @string.present?
        @result = @string == @string.reverse ? "is a palindrome" : "is not a palindrome"
      else
        @error_message = "Please enter a string."
      end
    end
  
    def random
      @num1 = params[:num1]
      @num2 = params[:num2]
  
      if number?(@num1) && number?(@num2)
        @random_num = rand(@num1.to_i..@num2.to_i)
      else
        @error_message = "Please enter valid numbers for both parameters."
      end
    end
  
    def madlib
      parts_of_speech = {
        adjective1: params[:adjective1],
        adverb1: params[:adverb1],
        verb: params[:verb],
        adverb2: params[:adverb2],
        adjective2: params[:adjective2]
      }
  
      missing_or_invalid_params = parts_of_speech.each_with_object([]) do |(key, value), missing|
        missing << key.to_s if value.blank? || number?(value)
      end
  
      if missing_or_invalid_params.empty?
        @story = "The #{params[:adjective1]} cat #{params[:adverb1]} #{params[:verb]} #{params[:adverb2]} over the #{params[:adjective2]} fence."
      else
        @error_message = "Please provide valid words for: #{missing_or_invalid_params.join(', ')}"
      end
    end
  
    private
  
    def number?(string)
      string.to_f.to_s == string || string.to_i.to_s == string
    end
end  