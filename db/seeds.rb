
puts "Uprooting"
Booking.destroy_all
Experience.destroy_all
ReferrerInfo.destroy_all
TravellerInfo.destroy_all
HostInfo.destroy_all
NgoLocation.destroy_all
Location.destroy_all
Ngo.destroy_all
Order.destroy_all
User.destroy_all

puts "Planting Seeds"

amsterdam = Location.create!(name:"amsterdam")

#List of Ngos

    # peta = Ngo.create!(name:"Peta", description:"PETA focuses on establishing and protecting animal rights.Our work focuses on the four areas where the largest numbers of animals suffer the most intensely for the longest time.", category:"Animal Rights", photo:"https://res.cloudinary.com/dylanlalonde/image/upload/v1529492648/goodtravel/pax.png", address:"Bellamyplein 51, 1053 AT Amsterdam")


    # icrse = Ngo.create!(name:"ICRSE", description:"International Committee on the Rights of Sex Workers in Europe (ICRSE) is a network of sex worker organisations that work together to support the development of national and international law, policy and practice, which respects and upholds the human and labour rights of sex workers throughout Europe.", category:"Human Rights", photo:"https://res.cloudinary.com/dylanlalonde/image/upload/v1529492648/goodtravel/sexworkers.png", address:"Oosterpark 9, 1091 AC Amsterdam")

    # slow_food = Ngo.create(name:"Slow Food", description:"Slow Food is a global food movement that is committed to a good, clean and fair food system. We ensure good food; sustainably produced at a fair price.", category:"Food Aid",photo:"https://res.cloudinary.com/dylanlalonde/image/upload/v1529492648/goodtravel/slowfoodnl.png", address:"Nieuwe Herengracht 49, 1011 RN Amsterdam")

    # pax_for_peace = Ngo.create(name:"Pax for Peace", description:"PAX works together with committed citizens and partners to protect civilians against acts of war, to end armed violence, and to build a just peace.", category:"Nuclear Disarmerment",photo:"https://res.cloudinary.com/dylanlalonde/image/upload/v1529492648/goodtravel/pax.png", address:"Noordermarkt 48, 1015 NA Amsterdam")

    # child_helpline = Ngo.create(name:"Child Helpline", description:"We advocate for the rights of children, represent their voices and give them a right to be heard", category:"Human Rights", photo:"https://res.cloudinary.com/dylanlalonde/image/upload/v1529492648/goodtravel/childhelpline.png", address:"Molukkenstraat 581, 1095 BJ Amsterdam")

    sea_sheperd = Ngo.create(name:"Sea Sheperd", description:"Our mission is to end the destruction of habitat and slaughter of wildlife in the world’s oceans in order to conserve and protect ecosystems and species.", category:"Animal Rights", photo:"https://res.cloudinary.com/dylanlalonde/image/upload/v1529492648/goodtravel/seashepherd.png", address:"
    Boeierstraat 1, 1086 VD Amsterdam")

    world_animal_protection = Ngo.create(name:"World Animal Protection", description:"We end the needless suffering of animals . We influence decision makers to put animals on the global agenda. We move the world to protect animals.",  category:"Animal Rights", photo:"https://res.cloudinary.com/dylanlalonde/image/upload/v1529492648/goodtravel/wspa-logo.png", address:"Wibautstraat 150, 1091 GR Amsterdam")

    war_child = Ngo.create(name:"War Child", description:"When war sweeps through a child’s life, children  become anxious, depressed and withdrawn, or rebellious and aggressive. To overcome these effects, War Child provides children and young people with psychosocial support, education and protection.", category:"Human Rights", photo:"https://res.cloudinary.com/dylanlalonde/image/upload/v1529492648/goodtravel/wspa-logo.png", address:"Floraweg 170, 1032 ZG Amsterdam")
#end

#NGOLocations

    redcrosslocation = NgoLocation.create!(location: amsterdam, ngo: Ngo.first)

#end


#travellers_user
    carla = User.create!(first_name:"Carla", last_name:"Smith", role:"Traveller", email:"carla@test.com", password:"123456", credit:500, photo:"https://res.cloudinary.com/dp7cn9j0d/image/upload/v1529508838/goodtravel.app/Carla.png")
    feiko = User.create!(first_name:"Feiko", last_name:"Boerstra", role:"Traveller", email:"feiko@test.com", password:"123456", credit:500, photo:"https://res.cloudinary.com/dp7cn9j0d/image/upload/v1529508842/goodtravel.app/the-fiek.png")
#end

#traveller
    travellercarla = TravellerInfo.create!(user: carla)
    travellerfeiko = TravellerInfo.create!(user: feiko)
#end

#tourhost_user
    jennifer = User.create!(first_name:"Jennifer", last_name:"Rodrigez", photo:"https://res.cloudinary.com/dp7cn9j0d/image/upload/v1529508843/goodtravel.app/Jennifer.png", role:"Host",email:"jennifer@test.com", password:"123456")
    jad = User.create!(first_name:"Jad", last_name:"Joubran", photo:"https://res.cloudinary.com/dp7cn9j0d/image/upload/v1529508844/goodtravel.app/jad.png", role:"Host",email:"jad@test.com", password:"123456")
#end

#tourhoster
    hostjennifer = HostInfo.create!(user: jennifer, description:"canal tour provider")
    hostjad = HostInfo.create!(user: jad, description:"Cycling tour provider")
#end

#referrer_user
    barbara = User.create!(first_name:"Barbara", last_name:"Samantha", photo:"https://res.cloudinary.com/dp7cn9j0d/image/upload/v1529508836/goodtravel.app/Barbara.png", role:"Referrer",email:"barbara@test.com", password:"123456")
    bob = User.create!(first_name:"Bob", last_name:"Bobbonius", photo:"https://res.cloudinary.com/dp7cn9j0d/image/upload/v1529508837/goodtravel.app/bob.png", role:"Referrer",email:"bob@test.com", password:"123456")
#end

#Referrer_code
    referrerbarbara = ReferrerInfo.create!(user: barbara, referral_code: "00001")
    referrerbob = ReferrerInfo.create!(user: bob, referral_code: "00002")
#end

#tours
    canaltour = Experience.create!(name: "Canal Tour", price:"50", smdescription:"Explore Amsterdam's UNESCO protected Seventeenth-Century Canals that provide a truly Dutch experience, from the water", lgdescription:"With more than one hundred kilometers of grachten, about 90 islands and 1,500 bridges, canals are a core aspect of Amsterdam. Lining the canals are historical buildings that will transport you back to Amsterdam's hayday.", host_info:hostjennifer, location: amsterdam, address: "Binnenkant 1, 1011 BG Amsterdam", featured_ngo: Ngo.first.id, photo:"https://res.cloudinary.com/dp7cn9j0d/image/upload/v1529508839/goodtravel.app/canal_tour.png")


    cyclingtour = Experience.create!(name: "Cycling Tour", price:"25", smdescription:"much cycle, very pain!", host_info:hostjad, location: amsterdam, address: "Nieuwezijds Kolk 29, 1012 PV Amsterdam", featured_ngo: Ngo.first.id, photo:"https://res.cloudinary.com/dp7cn9j0d/image/upload/v1529508843/goodtravel.app/cycling_tour.png")

    Beertour = Experience.create!(name: "Craft Beer Tour", price:"50", smdescription:"Just one beer!", host_info:hostjad, location: amsterdam, address: "Funenkade 7, 1018 AL Amsterdam", featured_ngo: Ngo.first.id, photo:"https://res.cloudinary.com/dp7cn9j0d/image/upload/v1529508843/goodtravel.app/Beer_tour.png")

    historicaltour = Experience.create!(name: "Historical Tour", price:"40", smdescription:"much tour, very wow!", host_info:hostjennifer, location: amsterdam, address: "Dam 3, 1012 JS Amsterdam", featured_ngo: Ngo.first.id,photo:"https://res.cloudinary.com/dp7cn9j0d/image/upload/v1529508842/goodtravel.app/Historical_Tour.png")

    cathedraltour = Experience.create!(name: "Cathedrals Tour", price:"30", smdescription:"much tour, very wow!", host_info:hostjad, location: amsterdam, address: "Overhoeksplein 2, 1031 KS Amsterdam", featured_ngo: Ngo.first.id,  photo:"https://res.cloudinary.com/dp7cn9j0d/image/upload/v1529508841/goodtravel.app/cathedral_tour.png")

    cheesetour = Experience.create!(name: "Cheese Tour", price:"30", smdescription:"Such yellow, very cheese!", host_info:hostjad, location: amsterdam, address: "Overhoeksplein 2, 1031 KS Amsterdam", featured_ngo: Ngo.first.id,  photo:"https://res.cloudinary.com/dp7cn9j0d/image/upload/v1529508841/goodtravel.app/cheese_tour.png")

#end

#bookings
carlasbooking = Booking.create!(referrer_info: referrerbarbara, traveller_info: travellercarla, status:"pending", amount_cents:"1", ngo: sea_sheperd, experience: canaltour)
#end
puts "Seedling is visable"
