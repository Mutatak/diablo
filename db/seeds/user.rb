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
