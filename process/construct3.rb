# ==========================================================================================
# 3 kyu Rail Fence Cipher: Encoding and Decoding   https://www.codewars.com/kata/58c5577d61aefcf3ff000081/train/ruby
# ==========================================================================================
# переделать. В решении какието ошибки через раз не проходит много тестов


# ==========================================================================================
# 3 kyu Binomial Expansion   https://www.codewars.com/kata/540d0fdd3b6532e5c3000b5b/train/ruby
# ==========================================================================================
# переделать

def bin_coef(k, n)
  (1..n).inject(:*) / ((1..k).inject(:*) * (1..n-k).inject(:*))
end

def bin_nuton(pow, a, b)
  (1..pow-1).map{|k| [bin_coef(k, pow), a * (pow - k), b**k]}
end

def expand(expr)
  var = expr.tr('^a-z','') # variable name
  exp, pow = expr.split('^') # (-2k-3)^3 => ["(-2k-3)", "3"]
  return '1' if pow == '0' # ex ^0
  exp, pow = exp.tr('()',''), pow.to_i # ["(-2k-3)", "3"] => ["-2k-3", 3]
  return exp if pow == 1 # ex ^1

  exp = exp.chars.slice_when{|a, b| /[-+]/ === b}.to_a # "-2k-3" => [["-", "2", "k"], ["-", "3"]]
  exp[0] = exp[0].slice_when{|a, b| b == var}.map.with_index do |a, j|
    if j == 0
      a.join == '-' ? -1 : a.join == var ? var : a.join.to_i
    else
      a.join
    end
  end #=> [-2, "k"]
  exp[1] = exp[1].join.to_i #=> -3

  return exp[0].size == 1 ? exp[0].join + "^#{pow}" : "#{exp[0][0]**pow}" + "#{var}^#{pow}" if exp[1] == 0

  exp[0] = exp[0].join # [-2, "k"] => "-2k"

  # ============= остановился тут ====================

  expfl = bin_nuton(pow, exp[0], exp[1]) # разложение по биному Ньютона без 1го и последнего члена
  l = exp[1]**pow # посл член(Integer)
  expl = [[exp[0] * pow]] + expfl # все кроме последнего

  res=expl.map do |ar| # преобразование строковых членов(всех кроме последнего)
    ar=ar.map do |e|
      if e.class==Integer
        e
      else
        e.count('-').odd? ? zn='-' : zn=nil
        n=e.tr('^0-9',' ').split.map(&:to_i).inject(:*)
        str=e.tr('^a-z','')
        str.size==1 ? x=str[0] : x=str[0]+"^#{str.size}"
        [x, n, zn]
      end
    end
    ar=ar.flatten.compact
    coef=ar.select{|e| e.class==Integer}.inject(:*)
    if ar.include?('-')
      coef=-coef
      ar.delete('-')
    end
    coef.to_s+ar.select{|e| e.class==String}.join
  end

  res=(res+[l.to_s]).map.with_index{|e,i| (e[0]!='-' && i!=0) ? '+'+e : e}.join

  res.chars.slice_when{|a,b| /[\^-]/===b}.map(&:join).map{|e| e=="-1#{var}" ? "-#{var}" : e}.join # убираем начальные единицы
end

p expand('(-2k-3)^3')#'-8k^3-36k^2-54k-27'
