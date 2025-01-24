
user1 = User.find_or_create_by(name: "John Doe") do |user|
    user.points = 5500
  end
  
  Reward.find_or_create_by(name: "Free Coffee") do |reward|
    reward.points = 500
  end
  
  Reward.find_or_create_by(name: "Movie Ticket") do |reward|
    reward.points = 1000
  end
  
  puts "Seed data created!"
  