# This is a test to see if user can post an article.

# Creating a user
@user = User.create!(
  email: "user1@example.com",
  password: "password",
  password_confirmation: "password",
  confirmed_at: Time.now
)

if @user.save
  puts "User successfully created!"
else
  puts "User cannot be created: #{@user.errors.full_messages.join(", ")}"
end

# Creating an article
@article = Article.new(
    title: "User1's article",
    content: "This is the content of the user1's article",
    user_id: @user.id,
    status: 'public'
  )

if @article.save
  puts "Article succesfully created!"
else
  puts "Article cannot be created!"
end
