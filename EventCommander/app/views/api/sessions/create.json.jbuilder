json.session do
  json.auth_token @user.auth_token
  json.user do
    json.username @user.username
    json.email @user.email
    json.id @user.id
  end
end
