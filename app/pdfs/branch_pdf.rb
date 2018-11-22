class BranchPdf < Prawn::Document
  def initialize(branch)
    super(top_margin: 10)
    font_families.update("Times New Roman"=>{:normal =>"fonts/times.ttf"})
    font "Times New Roman"
    image "#{Rails.root}/app/assets/images/logo.png", :width => 250
    move_down(20)
    text "Реквизиты филиала", size: 30
    move_down(5)
    text "#{branch.organization}", size: 14
    move_down(5)
    text "Юридический адрес: #{branch.address}", size: 14
    move_down(5)
    text "ОГРН: #{branch.ogrn}", size: 14
    move_down(5)
    text "ИНН: #{branch.inn}", size: 14
    move_down(5)
    text "КПП: #{branch.kpp}", size: 14
    move_down(5)
    text "Банковские реквизиты", size: 18
    move_down(5)
    text "БИК: #{branch.bik}", size: 14
    text "#{branch.bank}", size: 14
    move_down(5)
    text "Р/с: #{branch.rs}", size: 14
    move_down(5)
    text "К/с #{branch.ks}", size: 14
    move_down(5)
    text "Руководитель: #{branch.director}", size: 14
    move_down(15)
    text "Контакты:", size: 18
    text "Тел: #{branch.phone}"
    text "E-mail: #{branch.email}"
    move_down(5)

    text "Адреса терминалов:", size: 18
    branch.storage.each do |storage|
      text "#{storage.address}", size: 14
      move_down(10)
    end
    move_down(30)
     text "Всегда будем рады видеть Вас нашими партнерами!", size: 20
  end
end
