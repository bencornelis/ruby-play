class Fixnum
  DECIMALS   = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  ROMANS     = %w(M CM D CD C XC L XL X IX V IV I)
  DEC_TO_ROM = DECIMALS.zip(ROMANS).to_h

  def to_roman
    num = self
    DECIMALS.reduce('') do |roman, d|
      count, num = num.divmod(d)
      roman + DEC_TO_ROM[d] * count
    end
  end
end