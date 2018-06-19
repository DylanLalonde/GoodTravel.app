
puts "Uprooting"
Booking.destroy_all
Experience.destroy_all
NgoLocation.destroy_all
Location.destroy_all
Ngo.destroy_all
ReferrerInfo.destroy_all
TravellerInfo.destroy_all
HostInfo.destroy_all
User.destroy_all

puts "Planting Seeds"

amsterdam = Location.create!(name:"amsterdam")

redcross = Ngo.create!(name:"red cross")

redcrosslocation = NgoLocation.create!(location: amsterdam, ngo: redcross)

carla = User.create!(first_name:"carla", last_name:"smith", photo:"", email:"carla@test.com", password:"123456")

joe = User.create!(first_name:"joe", last_name:"smith", photo:"", email:"joe@test.com", password:"123456")

barbara = User.create!(first_name:"barbara", last_name:"smith", photo:"", email:"barbara@test.com", password:"123456")

travellercarla = TravellerInfo.create!(user: carla)

hostjoe = HostInfo.create!(name:"Joe", description:"canal tour provider", user: joe)

referrerbarbara = ReferrerInfo.create!(user: barbara, referral_code: "00001")

canaltour = Experience.create!(name: "Joes Canal Tour", price:"50", description:"such water, much wow!", host_info:hostjoe, location: amsterdam, photo:"https://res.cloudinary.com/greggstyle/image/upload/v1529099386/xipqak07dqbfpwrqopaq.jpg"))
cyclingtour = Experience.create!(name: "Joes Cycling Tour", description:"much cycle, very pain!", host_info:hostjoe, location: amsterdam)
canaltour = Experience.create!(name: "Joes Canal Tour", price:"50", description:"much tour, very wow!", host_info:hostjoe, location: amsterdam, photo:"https://res.cloudinary.com/greggstyle/image/upload/v1529099386/xipqak07dqbfpwrqopaq.jpg")
historicaltour = Experience.create!(name: "Historical Tour", price:"40", description:"much tour, very wow!", host_info:hostjoe, location: amsterdam, photo:"https://res.cloudinary.com/greggstyle/image/upload/v1529099386/xipqak07dqbfpwrqopaq.jpg")
cathedraltour = Experience.create!(name: "Cathedrals Tour", price:"30", description:"much tour, very wow!", host_info:hostjoe, location: amsterdam, photo:"https://res.cloudinary.com/greggstyle/image/upload/v1529099386/xipqak07dqbfpwrqopaq.jpg")

carlasbooking = Booking.create!(referrer_info: referrerbarbara, traveller_info: travellercarla, status:"pending", amount:"1", ngo: redcross, experience: canaltour)

puts "Process Completed"