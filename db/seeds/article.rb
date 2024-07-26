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
