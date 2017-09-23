# list all primes <= n
# I really like this implementation here:
# https://medium.com/@tgurner/the-sieve-of-eratosthenes-8e13acb5ab88

def sieve(n)
  (primes = [*2..n]).each do |k|
    next unless k
    (k*k..n).step(k) { |m| primes[m-2] = nil }
  end

  primes.compact
end

# returns a hash of prime multiplicities
# e.g.
# prime_factors 24
# => { 2 => 3, 3 => 1 }

def prime_factors(n)
  (2..n).each_with_object(Hash.new(0)) do |d, primes|
    while n % d == 0
      primes[d] += 1
      n /= d
    end
  end
end