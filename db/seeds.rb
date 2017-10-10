user1 = User.create(username: 'Nicole',
								    email: 'admin@gmail.com',
								    password: 'password1234',
								    password_confirmation: 'password1234', admin: true)
user2 = User.create(username: 'Bruce',
								    email: 'client@gmail.com',
								    password: 'password1234',
								    password_confirmation: 'password1234')
1.upto(5) do |i|
	Article.create(title: "monitor #{i}",
								 text: "600" * i,
								 user: user1)
end

1.upto(5) do |i|
	Article.create(title: "keyboard #{i}",
								 text: "200" * i,
								 user: user2)
end