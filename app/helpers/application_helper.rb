# encoding: utf-8
module ApplicationHelper

  require 'securerandom'
  def gen_password
    SecureRandom.hex(4)
  end

  def order_code(order)
    letters = 'CTEKMHPABX'
    code_digits = order.payment_id * 100 + Date.today.strftime("%U").to_i
    counter = (((Order.maximum('id').to_i + 1) % 1000) + 1000).to_s[1, 3]

    code = "#{order.kladr_from[0, 2]}#{code_digits}#{order.kladr_to[0, 2]}#{counter}"

    index = 1
    check_sum = 0
    code.each_char do |c|
      check_sum += c.to_i * (index.even? ? 2 : 1)
      index += 1
    end
    code = "#{letters[order.kladr_from[0].to_i]}#{letters[order.kladr_from[1].to_i]}-#{code_digits}-#{letters[order.kladr_to[0].to_i]}#{letters[order.kladr_to[1].to_i]}-#{counter}#{(check_sum + 1000).to_s[1, 3]}"
  end

  def translit(str)
    str.strip.gsub(/[абвгдеёжзийклмнопрстуфхцчшщыэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЫЭЮЯЪъьЬ]/, "а"=>"a","б"=>"b","в"=>"v","г"=>"g","д"=>"d","е"=>"e","ё"=>"e","ж"=>"zh","з"=>"z","и"=>"i","й"=>"y","к"=>"k","л"=>"l","м"=>"m","н"=>"n","о"=>"o","п"=>"p","р"=>"r","с"=>"s","т"=>"t","у"=>"u","ф"=>"f","х"=>"kh","ц"=>"ts","ч"=>"ch","ш"=>"sh","щ"=>"shch","ы"=>"y","э"=>"e","ю"=>"yu","я"=>"ya","А"=>"A","Б"=>"B","В"=>"V","Г"=>"G","Д"=>"D","Е"=>"E","Ё"=>"E","Ж"=>"Zh","З"=>"Z","И"=>"I","Й"=>"Y","К"=>"K","Л"=>"L","М"=>"M","Н"=>"N","О"=>"O","П"=>"P","Р"=>"R","С"=>"S","Т"=>"T","У"=>"U","Ф"=>"F","Х"=>"Kh","Ц"=>"Ts","Ч"=>"Ch","Ш"=>"Sh","Щ"=>"Shch","Ы"=>"Y","Э"=>"E","Ю"=>"Yu","Я"=>"Ya","Ъ"=>"","ъ"=>"b","ь"=>"b","Ь"=>"b")
  end
end
