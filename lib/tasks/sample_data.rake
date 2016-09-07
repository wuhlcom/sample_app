namespace :db do
	desc "Fill database with sample data"

	task populate: :environment do
		make_users
		make_microposts
		make_relationships
	end
end

def make_users
	User.create!(name:"Example User",
		     email:"example@railstutorial.org",
		     password:"foobar",
		     password_confirmation:"foobar",
		     admin:true)
	User.create!(name:"myself",
		     email:"378433855@qq.com",
		     password:"123456",
		     password_confirmation:"123456",
		     admin:true)
	99.times do |n|
		name = Faker::Name.name
		email="example-#{n+1}@railstutorial.org"	
		password="passowrd"
		User.create!(name:name,
			     email: email,
			     password:password,
			     password_confirmation:password)
	end
end

def make_microposts
	users = User.all(limit: 6)
	50.times do
		content = Faker::Lorem.sentence(5)
		users.each { |user| user.microposts.create!(content: content)}
	end
 end 

def make_relationships
 	#email_addr="example@railstutorial.org"
	#users= User.where.not("email = :example",{example:email_addr})
	#user = User.where("email = :example",{example:email_addr})
	users= User.all
	user = users.first
	followed_users = users[2..50]
	followers      = users[3..40]
	followed_users.each {|followed|user.follow!(followed)}
	followers.each{|follower|follower.follow!(user)}
end	
