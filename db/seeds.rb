5.times do |i|
    User.create!(
      name: "User#{i + 1}",
      email: "user#{i + 1}@example.com",
      password: "password",
      password_confirmation: "password",
      role: "user" # 一般ユーザー
    )
end