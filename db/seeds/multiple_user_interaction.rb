# db/seeds/multiple_users_interactions.rb

# Creating users
@users = 3.times.map do |i|
  User.create!(
    email: "user#{i+3}@example.com",
    password: "password",
    password_confirmation: "password",
    confirmed_at: Time.now
  )
end

@users.each do |user|
  if user.save
    puts "User successfully created: #{user.email}"
  else
    puts "User cannot be created: #{user.errors.full_messages.join(", ")}"
  end
end

# Creating articles and comments for every user
@users.each do |user|
  article = Article.create!(
    title: "Article by #{user.email}",
    content: "Content of the article by #{user.email}",
    user_id: user.id,
    status: 'public'
  )

  if article.save
    puts "Article successfully created: #{article.title}"
  else
    puts "Article cannot be created: #{article.errors.full_messages.join(", ")}"
  end

  other_users = @users.reject { |u| u == user }
  other_users.each do |commentor|
    comment = Comment.create!(
      commentor: commentor.email,
      body: "Comment by #{commentor.email} on article by #{user.email}",
      article_id: article.id,
      user_id: commentor.id,
      status: 'public'
    )

    if comment.save
      puts "Comment successfully created: #{comment.body}"
    else
      puts "Comment cannot be created: #{comment.errors.full_messages.join(", ")}"
    end
  end
end
