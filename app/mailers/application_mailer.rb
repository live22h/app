class ApplicationMailer < ActionMailer::Base
  default from: 'live22h@gmail.com',
          template_path: 'mailers'

  def user_welcome(user)
    @user = user
    mail to: user.email, subject: 'Регистрация на сайте Балтийская служба доставки'
  end

  def new_order(order, orderuser, new_user_password)
    @order = order
    @orderuser = orderuser
    @new_user_password = new_user_password
    mail to: orderuser.email, subject: "Заявка на доставку груза #{order.from_city}-#{order.to_city}"
  end

  def new_branch_admin(branch, user, new_user_password)
    @branch = branch
    @user = user
    @new_user_password = new_user_password
    mail to: orderuser.email, subject: "Вы назначены администратором филиала #{branch.new}"
  end
end
