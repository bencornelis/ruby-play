# Write a function:
#
# simplify(poly)
# that takes a string in input, representing a multilinear non-constant polynomial
# in integers coefficients (like "3x-zx+2xy-x"), and returns another string as output
# where the same expression has been simplified in the following way ( -> means application of simplify):
#
# All possible sums and subtraction of equivalent monomials ("xy==yx") has been done, e.g.:
# "cb+cba" -> "bc+abc", "2xy-yx" -> "xy", "-a+5ab+3a-c-2a" -> "-c+5ab"
#
# All monomials appears in order of increasing number of variables, e.g.:
# "-abc+3a+2ac" -> "3a+2ac-abc", "xyz-xz" -> "-xz+xyz"
#
# If two monomials have the same number of variables, they appears in lexicographic order, e.g.:
# "a+ca-ab" -> "a-ab+ac", "xzy+zby" ->"byz+xyz"
#
# There is no leading + sign if the first coefficient is positive, e.g.:
# "-y+x" -> "x-y", but no restrictions for -: "y-x" ->"-x+y"
#
# N.B. to keep it simplest, the string in input is restricted to represent only multilinear non-constant polynomials,
# so you won't find something like `-3+yx^2'. Multilinear means in this context: of degree 1 on each variable.

Term = Struct.new(:coeff, :vars) do
  def to_s
    "#{coeff_str}#{vars_str}"
  end

  def vars_count
    vars.size
  end

  def vars_str
    vars.join
  end

  def coeff_str
    "#{sign}#{coeff.abs unless coeff.abs == 1}"
  end

  def sign
    coeff > 0 ? "+" : "-"
  end
end

def simplify(poly)
  join(combine(create_terms(poly)))
end

def join(terms)
  non_zero = -> term { !term.coeff.zero? }
  result =
    terms.select(&non_zero)
         .sort_by { |term| [term.vars_count, term.vars_str] }
         .map(&:to_s).join
  result[0] == "+" ? result[1..-1] : result
end

def combine(terms)
  terms.group_by(&:vars).map do |vars, terms|
    coeff = terms.map(&:coeff).reduce :+
    Term.new(coeff, vars)
  end
end

def create_terms(poly)
  poly.scan(/[+-]*\d*[a-z]+/).map do |term|
    sign   = term[/[+-]/] || "+"
    number = term[/\d+/]  || "1"
    coeff  = "#{sign}#{number}".to_i
    vars   = term[/[a-z]+/].split("").sort
    Term.new(coeff, vars)
  end
end
