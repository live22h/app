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
end
