user1 = User.create(username: 'Nicole',
								    email: 'admin@gmail.com',
								    password: 'password1234',
								    password_confirmation: 'password1234', admin: true)
user2 = User.create(username: 'Bruce',
								    email: 'client@gmail.com',
								    password: 'password1234',
								    password_confirmation: 'password1234')

	Article.create(title: "monitor ",
								 text: "600",
								 user: user1)



	Article.create(title: "keyboard",
								 text: "200",
								 user: user2)
