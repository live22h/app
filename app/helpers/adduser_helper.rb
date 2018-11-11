module AdduserHelper
  def add_user(name, email, passwd)
    if User.exists?(email: email)
      User.where(email: email).take.id
    else
      @is_new_user = true
      fio = name.strip.split(/\s+/)
      fio.push ''
      fio.push ''
      user = User.create(:family => fio[0],
                         :name => fio[1],
                         :otch => fio[2],
                         :email => email,
                         :password => passwd,
                         :password_confirmation => passwd)
      user.save
      user.id
    end
  end
end
