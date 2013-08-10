if @user
  json.id @user.id
  json.username @user.name
  json.loggedIn true
end
