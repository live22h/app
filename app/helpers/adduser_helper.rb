module AdduserHelper
  include ApplicationHelper

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

  def add_user_by_email(email)
    passwd = gen_password
    if User.exists?(email: email)
      passwd = ''
    else
      user = User.create(:email => email,
                         :password => passwd,
                         :password_confirmation => passwd)
      user.save
      user.id
    end
    return passwd
  end

end
