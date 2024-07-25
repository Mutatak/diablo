# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# USER  ############################################
# Create a user
  @admin = User.create(
    email: "bar@foo.com",
    password: '123456',
    password_confirmation: '123456',
    confirmed_at: Time.now
  )
  if @admin.save
    puts "User succesfully created"
  end

# Update a user
  @admin.update(
    password: '1234567',
    password_confirmation: '1234567'
  )

# ARTICLE ############################################
# Create articles
  unless Article.exists?
    @article = Article.new(
      title: "Seed article",
      content: "This is the content of the seed article",
      user_id: 1,
      status: 'public'
    )

    if @article.save
      puts "Article succesfully created!"
    end
  else
    puts "Article already exists!"
  end

# COMMENT ############################################
# Create comments
  unless Comment.exists?
    @comment = Comment.create(
      commentor: "fizbar",
      body: "buzzbizz",
      article_id: 1,
      user_id: 1,
      status: 'public'
    )

    if @comment.save
      puts "Comment succesfully created!"
    end
  else
    puts "Comment already exists!"
  end

puts 'Seeding is complete!'
