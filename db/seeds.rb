PostTag.delete_all
Post.delete_all
User.delete_all
Tag.delete_all

User.create([
  { name: "Alice Johnson", email: "alice@example.com", password: "password1" },
  { name: "Bob Smith", email: "bob@example.com", password: "password2" },
  { name: "Charlie Brown", email: "charlie@example.com", password: "password3" },
  { name: "Diana Martinez", email: "diana@example.com", password: "password4" },
  { name: "Ethan Wilson", email: "ethan@example.com", password: "password5" },
  { name: "John Doe", email: "john@example.com", password: "password6" }
])


tags = Tag.create([
  { name: "Tag 1" },
  { name: "Ruby" },
  { name: "Rails" },
  { name: "JavaScript" },
  { name: "WebTech" },
  { name: "SQL" }
])

users = User.all
tags = Tag.all

users.each do |user|
  2.times do |i|
    post = user.posts.create(
      title: "Post #{i + 1} by #{user.name}",
      content: "This is a post content by #{user.name}",
      published_at: Time.now,
      answers_count: rand(0..10),
      likes_count: rand(0..100)
    )
    selected_tags = tags.sample(2) 
    post.tags << selected_tags
  end
end

special_user = users.first
special_post = special_user.posts.create(
  title: "Post 1",
  content: "This is a special post content by #{special_user.name}",
  published_at: Time.now,
  answers_count: 0,
  likes_count: 0
)
special_post.tags << tags.first
