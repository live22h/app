# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Title.create(name: 'Общее мнение о работе отдела')
Title.create(name: 'Компетентность и профессионализм')
Title.create(name: 'Оперативность в предоставлении информации')
Title.create(name: 'Вежливость и готовность помочь')
Title.create(name: 'Своевременность предварительного звонка от менеджера отдела')
Title.create(name: 'Своевременность звонка от водителя - экспедитора')
Title.create(name: 'Пунктуальность забора/доставки груза')
Title.create(name: 'Удобство расположения склада в городе')
Title.create(name: 'Оперативность приема/выдачи груза')
Title.create(name: 'Своевременность выставления счетов')
Title.create(name: 'Своевременность предоставления оригиналов документов')

Unit.create(name: 'мм', factor: 10)
Unit.create(name: 'см', factor: 1)
Unit.create(name: 'м', factor: 0.01)

Cargo.create(name:'ТНП',  delicate: false)
Cargo.create(name:'Мебель',  delicate: true)
Cargo.create(name:'Оборудование',  delicate: false)
Cargo.create(name:'Бытовая техника',  delicate: true)
Cargo.create(name:'Автотовары',  delicate: false)
Cargo.create(name:'Автохимия',  delicate: true)
Cargo.create(name:'Строительные материалы',  delicate: false)
Cargo.create(name:'Зоотовары',  delicate: false)
Cargo.create(name:'Отделочные материалы',  delicate: false)

Payment.create(name: 'Наличные')
Payment.create(name: 'Безналичная оплата')

Status.create(name: 'Заявка принята')
Status.create(name: 'Обрабатывается')
Status.create(name: 'В пути')
Status.create(name: 'Груз готов к выдаче')
Status.create(name: 'Груз выдан')
Status.create(name: 'Заявка закрыта')
Status.create(name: 'Заявка отклонена')

roles = Role.create([{name: 'Администратор сайта'}, {name: 'Администратор филиала'}, {name:'Менеджер филиала'}])
admin = User.create(:name => "Admin",
                    :email => "admin@tee.su",
                    :password => "@dmin123",
                    :password_confirmation => "@dmin123")
Userrole.create(:role_id => roles[0].id,
                :user_id => admin.id)
