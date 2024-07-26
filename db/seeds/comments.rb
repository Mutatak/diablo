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
