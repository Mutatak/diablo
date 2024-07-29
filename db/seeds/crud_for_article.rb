# This is a test to see if CRUD operations can be performed on a article.

# Creating a user
@user = User.create!(
  email: "user7@example.com",
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
    title: "User8's article",
    content: "This is the content of the user8's article",
    user_id: @user.id,
    status: 'public'
  )

if @article.save
  puts "Article succesfully created!"
else
  puts "Article cannot be created!"
end

# Updating the article
@article.update(
  title: "Updated article"
)

if @article.save
  puts "Article successfully updated!"
else
  puts "Article cannot be updated: #{article.errors.full_messages.join(", ")}"
end

# Deleting the article
@article.destroy

if @article.destroyed?
  puts "Article successfully deleted!"
else
  puts "Article cannot be deleted: #{article.errors.full_messages.join(", ")}"
end
