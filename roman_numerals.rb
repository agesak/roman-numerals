# this is how to convert decimal to roman numeral
# https://www.rapidtables.com/convert/number/how-number-to-roman-numerals.html

# class Integer

#   def to_roman
#     return "I"
#   end
# end



class Integer

  CONVERTER_HASH = {
    1 => "I",
    4 => "IV",
    5 => "V",
    9 => "IX",
    10 => "X",
    40 => "XL",
    50 => "L",
    90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
    1000 => "M" 
  }

  def find_roman_numeral(num)
    sub_hash = CONVERTER_HASH.select{|k, v| num - k >= 0}
    max_pair = sub_hash.max_by{|k, v| k}
    num = num - max_pair[0]
    roman_numeral = max_pair[1]
    return num, roman_numeral
  end
  

  def to_roman
    num = self
    roman = ""
    max_decimal_num = num
    until max_decimal_num == 0
      max_decimal_num, roman_numeral = find_roman_numeral(max_decimal_num)
      roman += roman_numeral
    end
    return roman
  end

end