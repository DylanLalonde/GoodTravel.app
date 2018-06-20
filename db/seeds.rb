
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

#List of Ngos
    redcross = Ngo.create!(name:"Red Cross", description:"")

    peta = Ngo.create!(name:"Peta", description:"PETA focuses on establishing and protecting animal rights.Our work focuses on the four areas where the largest numbers of animals suffer the most intensely for the longest time.", category:"Animal Rights", photo:"../app/assets/images/ngologos/petanl.png")

    icrse = Ngo.create!(name:"ICRSE", description:"International Committee on the Rights of Sex Workers in Europe (ICRSE) is a network of sex worker organisations that work together to support the development of national and international law, policy and practice, which respects and upholds the human and labour rights of sex workers throughout Europe.", category:"Human Rights", photo:image_path(sexworker.png)) 

    slow_food = Ngo.create(name:"Slow Food", description:"Slow Food is a global food movement that is committed to a good, clean and fair food system. We ensure good food; sustainably produced at a fair price.", category:"Food Aid")

    pax_for_peace = Ngo.create(name:"Pax for Peace", description:"PAX works together with committed citizens and partners to protect civilians against acts of war, to end armed violence, and to build a just peace.", category:"Nuclear Disarmerment")

    child_helpline = Ngo.create(name:"Child Helpline", description:"We advocate for the rights of children, represent their voices and give them a right to be heard", category:"Human Rights")

    sea_sheperd = Ngo.create(name:"Sea Sheperd", description:"Our mission is to end the destruction of habitat and slaughter of wildlife in the world’s oceans in order to conserve and protect ecosystems and species.", category:"Animal Rights")

    world_animal_protection = Ngo.create(name:"World Animal Protection", description:"We end the needless suffering of animals . We influence decision makers to put animals on the global agenda. We move the world to protect animals.",  category:"Animal Rights")

    war_child = Ngo.create(name:"War Child", description:"When war sweeps through a child’s life, children  become anxious, depressed and withdrawn, or rebellious and aggressive. To overcome these effects, War Child provides children and young people with psychosocial support, education and protection.", category:"Human Rights")

redcrosslocation = NgoLocation.create!(location: amsterdam, ngo: redcross)

carla = User.create!(first_name:"carla", last_name:"smith", photo:"", email:"carla@test.com", password:"123456")

joe = User.create!(first_name:"joe", last_name:"smith", photo:"", email:"joe@test.com", password:"123456")

barbara = User.create!(first_name:"barbara", last_name:"smith", photo:"", email:"barbara@test.com", password:"123456")

travellercarla = TravellerInfo.create!(user: carla)

hostjoe = HostInfo.create!(name:"Joe", description:"canal tour provider", user: joe)

referrerbarbara = ReferrerInfo.create!(user: barbara, referral_code: "00001")

canaltour = Experience.create!(name: "Joes Canal Tour", price:"50", description:"such water, much wow!", host_info:hostjoe, location: amsterdam, address: "16 Villa Gaudelet Paris", featured_ngo: peta.id, photo:"https://res.cloudinary.com/greggstyle/image/upload/v1529099386/xipqak07dqbfpwrqopaq.jpg")
cyclingtour = Experience.create!(name: "Joes Cycling Tour", price:"25", description:"much cycle, very pain!", host_info:hostjoe, location: amsterdam, address: "Overhoeksplein 2, 1031 KS Amsterdam", featured_ngo: redcross.id, photo:"https://res.cloudinary.com/greggstyle/image/upload/v1529099386/xipqak07dqbfpwrqopaq.jpg")
canaltour = Experience.create!(name: "Joes Canal Tour", price:"50", description:"much tour, very wow!", host_info:hostjoe, location: amsterdam, address: "Overhoeksplein 2, 1031 KS Amsterdam", featured_ngo: redcross.id, photo:"https://res.cloudinary.com/greggstyle/image/upload/v1529099386/xipqak07dqbfpwrqopaq.jpg")
historicaltour = Experience.create!(name: "Historical Tour", price:"40", description:"much tour, very wow!", host_info:hostjoe, location: amsterdam, address: "Overhoeksplein 2, 1031 KS Amsterdam", featured_ngo: redcross.id, photo:"https://res.cloudinary.com/greggstyle/image/upload/v1529099386/xipqak07dqbfpwrqopaq.jpg")
cathedraltour = Experience.create!(name: "Cathedrals Tour", price:"30", description:"much tour, very wow!", host_info:hostjoe, location: amsterdam, address: "Overhoeksplein 2, 1031 KS Amsterdam", featured_ngo: redcross.id,  photo:"https://res.cloudinary.com/greggstyle/image/upload/v1529099386/xipqak07dqbfpwrqopaq.jpg")

carlasbooking = Booking.create!(referrer_info: referrerbarbara, traveller_info: travellercarla, status:"pending", amount:"1", ngo: redcross, experience: canaltour)

puts "Process Completed"