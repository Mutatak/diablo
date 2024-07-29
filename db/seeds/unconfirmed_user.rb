# This is a test to see if uncorfirmed user can post an article.

# Creating a unconfirmed user
@guest = User.create(
  email: "guest@foo.com",
  password: '123456',
  password_confirmation: '123456'
)

if @guest.save
  puts "Guest succesfully created"
else
  puts "Guest cannot be created"
end

# Creating an article
@article = Article.new(
  title: "Guest article",
  content: "This is the content of the guest article",
  user_id: @guest.id,
  status: 'public'
)

if @article.save
  puts "Article succesfully created!"
else
  puts "Article cannot be created"
end

if @article.save == true
  puts "Test failed, unconfirmed user posted an article"
else
  puts "Test passed, unconfirmed user couldn't post an article"
end
