
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

#List of Ngosrail
    peta = Ngo.create!(name:"Peta", description:"PETA focuses on establishing and protecting animal rights.Our work focuses on the four areas where the largest numbers of animals suffer the most intensely for the longest time.", category:"Animal Rights", photo:"https://res.cloudinary.com/dylanlalonde/image/upload/v1529492648/goodtravel/pax.png", address:"Bellamyplein 51, 1053 AT Amsterdam")

    icrse = Ngo.create!(name:"ICRSE", description:"International Committee on the Rights of Sex Workers in Europe (ICRSE) is a network of sex worker organisations that work together to support the development of national and international law, policy and practice, which respects and upholds the human and labour rights of sex workers throughout Europe.", category:"Human Rights", photo:"https://res.cloudinary.com/dylanlalonde/image/upload/v1529492648/goodtravel/sexworkers.png", address:"Oosterpark 9, 1091 AC Amsterdam") 

    slow_food = Ngo.create(name:"Slow Food", description:"Slow Food is a global food movement that is committed to a good, clean and fair food system. We ensure good food; sustainably produced at a fair price.", category:"Food Aid",photo:"https://res.cloudinary.com/dylanlalonde/image/upload/v1529492648/goodtravel/slowfoodnl.png", address:"Nieuwe Herengracht 49, 1011 RN Amsterdam")

    pax_for_peace = Ngo.create(name:"Pax for Peace", description:"PAX works together with committed citizens and partners to protect civilians against acts of war, to end armed violence, and to build a just peace.", category:"Nuclear Disarmerment",photo:"https://res.cloudinary.com/dylanlalonde/image/upload/v1529492648/goodtravel/pax.png", address:"Noordermarkt 48, 1015 NA Amsterdam")

    child_helpline = Ngo.create(name:"Child Helpline", description:"We advocate for the rights of children, represent their voices and give them a right to be heard", category:"Human Rights", photo:"https://res.cloudinary.com/dylanlalonde/image/upload/v1529492648/goodtravel/childhelpline.png", address:"Molukkenstraat 581, 1095 BJ Amsterdam")

    sea_sheperd = Ngo.create(name:"Sea Sheperd", description:"Our mission is to end the destruction of habitat and slaughter of wildlife in the world’s oceans in order to conserve and protect ecosystems and species.", category:"Animal Rights", photo:"https://res.cloudinary.com/dylanlalonde/image/upload/v1529492648/goodtravel/seashepherd.png", address:"
    Boeierstraat 1, 1086 VD Amsterdam")

    world_animal_protection = Ngo.create(name:"World Animal Protection", description:"We end the needless suffering of animals . We influence decision makers to put animals on the global agenda. We move the world to protect animals.",  category:"Animal Rights", photo:"https://res.cloudinary.com/dylanlalonde/image/upload/v1529492648/goodtravel/wspa-logo.png", address:"Wibautstraat 150, 1091 GR Amsterdam")

    war_child = Ngo.create(name:"War Child", description:"When war sweeps through a child’s life, children  become anxious, depressed and withdrawn, or rebellious and aggressive. To overcome these effects, War Child provides children and young people with psychosocial support, education and protection.", category:"Human Rights", photo:"https://res.cloudinary.com/dylanlalonde/image/upload/v1529492648/goodtravel/wspa-logo.png", address:"Floraweg 170, 1032 ZG Amsterdam")
#end

#NGOLocations

    redcrosslocation = NgoLocation.create!(location: amsterdam, ngo: peta)

#end

#travellers
    carla = User.create!(first_name:"Carla", last_name:"Smith", photo:"", email:"carla@test.com", password:"123456", credit:500, photo:image_tag("Carla.jpg"))
    Feiko = User.create!(first_name:"Feiko", last_name:"Boerstra", photo:"", email:"feiko@test.com", password:"123456", credit:500, photo:image_tag("the-fiek.jpg"))
#end

#tourhost
    Jennifer = User.create!(first_name:"Jennifer", last_name:"Rodrigez", photo:image_tag("jennifer.jpg"), email:"jennifer@test.com", password:"123456")
    Jad = User.create!(first_name:"Jad", last_name:"Joubran", photo:image_tag("jad.jpg"), email:"jad@test.com", password:"123456")
#end

#referrer
    barbara = User.create!(first_name:"Barbara", last_name:"Samantha", photo:"", email:"barbara@test.com", password:"123456")

#end
travellercarla = TravellerInfo.create!(user: carla)

hostjoe = HostInfo.create!(name:"Joe", description:"canal tour provider", user: joe)

referrerbarbara = ReferrerInfo.create!(user: barbara, referral_code: "00001")

canaltour = Experience.create!(name: "Joes Canal Tour", price:"50", description:"such water, much wow!", host_info:hostjoe, location: amsterdam, address: "16 Villa Gaudelet Paris", featured_ngo: peta.id, photo:"https://res.cloudinary.com/dylanlalonde/image/upload/v1529492648/goodtravel/pax.png")
cyclingtour = Experience.create!(name: "Joes Cycling Tour", price:"25", description:"much cycle, very pain!", host_info:hostjoe, location: amsterdam, address: "Overhoeksplein 2, 1031 KS Amsterdam", featured_ngo: sea_sheperd.id, photo:"https://res.cloudinary.com/greggstyle/image/upload/v1529099386/xipqak07dqbfpwrqopaq.jpg")
canaltour = Experience.create!(name: "Joes Canal Tour", price:"50", description:"much tour, very wow!", host_info:hostjoe, location: amsterdam, address: "Overhoeksplein 2, 1031 KS Amsterdam", featured_ngo: icrse.id, photo:"https://res.cloudinary.com/greggstyle/image/upload/v1529099386/xipqak07dqbfpwrqopaq.jpg")
historicaltour = Experience.create!(name: "Historical Tour", price:"40", description:"much tour, very wow!", host_info:hostjoe, location: amsterdam, address: "Overhoeksplein 2, 1031 KS Amsterdam", featured_ngo: world_animal_protection.id, photo:"https://res.cloudinary.com/greggstyle/image/upload/v1529099386/xipqak07dqbfpwrqopaq.jpg")
cathedraltour = Experience.create!(name: "Cathedrals Tour", price:"30", description:"much tour, very wow!", host_info:hostjoe, location: amsterdam, address: "Overhoeksplein 2, 1031 KS Amsterdam", featured_ngo: slow_food.id,  photo:"https://res.cloudinary.com/greggstyle/image/upload/v1529099386/xipqak07dqbfpwrqopaq.jpg")

carlasbooking = Booking.create!(referrer_info: referrerbarbara, traveller_info: travellercarla, status:"pending", amount:"1", ngo: icrse, experience: canaltour)

puts "Process Completed"