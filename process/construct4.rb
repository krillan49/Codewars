# ==========================================================================================
# 4 kyu Permutational Primes  https://www.codewars.com/kata/55eec0ee00ae4a8fa0000075/train/ruby
# ==========================================================================================
# [В решении есть какието ошмбки(не проходит какието тесты иногдв)]

# мод версия
require 'prime'

def permutation_unit(p, max)
  p.digits.permutation(p.to_s.size).map{|a| a.join.to_i}.uniq.select{|n| n <= max && n.prime? && n.to_s.size == p.to_s.size}
end

RES = Prime.entries(50000).each_with_object({}) do |p,res|
  pers = permutation_unit(p, 50000)
  num = pers.size - 1
  if res[num]
    res[num] << p if !pers.any?{|e| res[num].include?(e)}
  elsif num > 0
    res[num] = [p]
  end
end

def permutational_primes(nMax, permutes)
  r=[]
  RES.each do |k,v|
    if k>=permutes
      v.each do |p|
        if p<=nMax
          pers = permutation_unit(p, nMax)
          r << p if pers.size-1==permutes
        end
      end
    end
  end
  [r.size, r.min, r.max].map{|e| e ? e : 0}
end


# ==========================================================================================
# 4 kyu Square and Cube of a Number Become Prime When Reversed
# https://www.codewars.com/kata/5644a69f7849c9c097000073/train/ruby
# ==========================================================================================
# Нужно переделывать. Не проходит по времени без хардкода.


# ==========================================================================================
# 4 kyu Escape the maze
# https://www.codewars.com/kata/5877027d885d4f6144000404/train/ruby
# ==========================================================================================
# Нужно переделывать.(есть какаято ошибка появляется иногда, но в основном тесты проходят)


# ==========================================================================================
# 4 kyu Total increasing or decreasing numbers up to a power of 10
# https://www.codewars.com/kata/55b195a69a6cc409ba000053/train/ruby
# ==========================================================================================
# Нужно переделывать(вернее сделать сейчас просто хардод).


# ==========================================================================================
# 4 Ten-Pin Bowling
# https://www.codewars.com/kata/5531abe4855bcc8d1f00004c/train/ruby
# ==========================================================================================
# Нужно переделывать.


# ==========================================================================================
# 4 How many numbers III
# https://www.codewars.com/kata/5877e7d568909e5ff90017e6/train/ruby
# ==========================================================================================
# Нужно переделывать.


# ==========================================================================================
# 4 Simplifying multilinear polynomials
# https://www.codewars.com/kata/55f89832ac9a66518f000118/train/ruby
# ==========================================================================================
# Нужно переделывать.


# ==========================================================================================
# 4 Square into Squares. Protect trees!
# https://www.codewars.com/kata/54eb33e5bc1a25440d000891/train/ruby
# ==========================================================================================
# Нужно переделывать.


# ==========================================================================================
# 4 Sort binary tree by levels
# https://www.codewars.com/kata/52bef5e3588c56132c0003bc/train/ruby
# ==========================================================================================
# Нужно переделывать.


# ==========================================================================================
# 4 Range Extraction
# https://www.codewars.com/kata/51ba717bb08c1cd60f00002f/train/ruby
# ==========================================================================================
# Нужно переделывать.
