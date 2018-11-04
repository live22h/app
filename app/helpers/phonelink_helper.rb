# tel_to '(01234) 555 6789'

module PhonelinkHelper
  def tel_to(text)
    groups = text.to_s.scan(/(?:^\+)?\d+/)
    link_to text, "tel:#{groups.join '-'}"
  end
end
