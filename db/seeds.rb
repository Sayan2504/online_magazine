User.new( { name: "user one", email: "user1@gmail.com", password: "12345678", password_confirmation: "12345678" } ).save
User.new( { name: "user two", email: "user2@gmail.com", password: "12345678", password_confirmation: "12345678" } ).save

Article.new( { author: "Author one", title: "Title one", body: "Content one", user_id: 1 }).save
Article.new( { author: "Author two", title: "Title two", body: "Content two", user_id: 1 }).save
Article.new( { author: "Author three", title: "Title three", body: "Content three", user_id: 2 }).save
Article.new( { author: "Author four", title: "Title four", body: "Content four", user_id: 2 }).save