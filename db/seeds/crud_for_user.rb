# This is a test to see if CRUD operations can be performed on a user.

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

# Updating the user
@user.update(
  email: "UpdatedUser@example.com"
)

if @user.save
  puts "User successfully updated!"
else
  puts "User cannot be updated: #{@user.errors.full_messages.join(", ")}"
end

# Deleting the user
@user.destroy

if @user.destroyed?
  puts "User successfully deleted!"
else
  puts "User cannot be deleted: #{@user.errors.full_messages.join(", ")}"
end
