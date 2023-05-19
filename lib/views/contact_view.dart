import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Info',
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Colors.green,
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 16),
          headline1: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      home: const PlaceScreen(),
    );
  }
}

class PlaceScreen extends StatefulWidget {
  const PlaceScreen({super.key});

  @override
  _PlaceScreenState createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  final List<Map<String, dynamic>> states = [
    {
      "id": "1",
      "name": "Delhi",
      "capital": "New Delhi",
      "about":
          "Delhi, the capital city of India, is one of the most ancient cities in the world which has harboured innumerable cultures and witnessed continuous human life for at least 5,000 years. But as a metropolitan city, Delhi is relatively a new kid on the block having risen to prominence only after becoming the capital of India.Delhi is well known for its amazing food, culture, history and diversity. You will be able to do a lot of sightseeing in this city. There are numerous places in Delhi that you will love to visit as soon as you land there. From India Gate to Qutub Minar, these monuments are a treat to watch.",
      "img": [
        "https://cdn.britannica.com/37/189837-050-F0AF383E/New-Delhi-India-War-Memorial-arch-Sir.jpg",
        "https://www.keyshotels.com/blog/wp-content/uploads/2017/08/port-blair-sea-fish.jpg",
        "https://dynamic.tourtravelworld.com/package-images/photo-big/dir_17/486726/202664.jpg",
      ],
      "tourist": [
        {
          "name": "INDIA GATE",
          "info":
              "Situated in the heart of the city, the India Gate is one of the most popular and well-known monuments in India. It was designed by Edwin Lutyens, with its foundation laid in the year 1920. The 42 mts. high war memorial was unveiled in the year 1933 and is a tribute to the 70,000 British soldiers who lost their lives in various battles.Among the martyrs of World War |, the names of 13,500 soldiers are inscribed on the walls of this structure. Post independence, the India Gate became a site of 'Amar Jawan Jyoti' - Indian Army's Tomb of the Unknown Soldier. The running fountains and well-manicured lawns around the memorial make ita breathtaking place for a picnic as well as a family outing",
          "images":
              "https://www.delhitourism.gov.in/dttdc/explore_the_city/images/india_gate.jpg",
          "location":
              "https://www.google.co.in/maps/place/Neill+Island,+Andaman+and+Nicobar+Islands+744104/data=!4m2!3m1!1s0x3088d9a13824c715:0xddd01ec98b4eb529?sa=X&ved=2ahUKEwjTjPqquvPlAhU56nMBHbmRBCAQ8gEwJXoECBAQBA"
        },
        {
          "name": "LOTUS TEMPLE",
          "info":
              "East of Nehru place, this temple is built in the shape of a lotus flower and is the last of seven Major Bahai's temples built around the world. Completed in1986 it is set among the lush green landscaped gardens.The structure is made up of pure white marble The architect Furiburz Sabha chose the lotus as the symbol common to Hinduism, Buddhism, Bhai TempleJainism and Islam. Adherents of any faith are free to visit the temple and pray or meditate.Around the blooming petals there are nine pools of water, which light up, in natural light. It looks spectacular at dusk when it is flood lit ",
          "images":
              "https://delhitourism.gov.in/delhitourism/images/bahai_temple.jpg",
          "location":
              "https://www.google.co.in/maps/place/Cellular+Jail+National+Monument/@11.6738247,92.7479768,15z/data=!4m2!3m1!1s0x0:0x616a8c6623fdba3f?sa=X&ved=2ahUKEwihqtPEuvPlAhU4IbcAHThdBsAQ_BIwJnoECA4QCA"
        },
        {
          "name": "JAPANESE PARK",
          "info":
              "Swarn Jayanti Park, popular known as Japanese Park, is located in sector 11, Rohini. This lush green park is maintained by Delhi Development Authority (DDA). Abundant greenery, clean walking paths and lakes with colorful boats make Japanese Park an acclaimed picnic spot of Delhi. The park does not only engross the adults, but children too can indulge in gaming zones, play ground or a jet-plane replica installed in the park. Japanese Park is surrounded by several malls and amusement parks as well. So, you have a huge variety for shopping and eating.Japanese park is ideal to visit in the evening or early in the morning to enjoy the sun rise and enchanting setting. In the evening, you can find families and youngsters having a good time. And if you are lucky, you may also spot storks and egrets beside the lake, quenching their thirst.",
          "images":
              "https://delhitourism.gov.in/delhitourism/images/japanese_park.jpg",
          "location":
              "https://www.google.co.in/maps/place/Corbyn+Cove+Beach/@11.6449942,92.7458387,17z/data=!3m1!4b1!4m5!3m4!1s0x308894fccfdb049d:0x60d5e3776ddced65!8m2!3d11.6449942!4d92.7480274"
        },
        {
          "name": "LODHI GARDEN",
          "info":
              "A favourite picnic spot and a joy for morning walkers with lots of greenery and trees. Access from Lodi Road. It's near Khan Market.",
          "images":
              "https://delhitourism.gov.in/delhitourism/images/lodhi_garden.jpg",
          "location":
              "https://www.google.co.in/maps/place/Swaraj+Dweep/@11.9656084,92.9194242,12z/data=!3m1!4b1!4m5!3m4!1s0x3088d3d85e0fe039:0x25c8aaaa513ef4bf!8m2!3d11.9760503!4d92.9875565"
        },
        {
          "name": "JANTAR MANTAR",
          "info":
              "Jantar Mantar (Yantra - instruments, mantra - formulae) was constructed in 1724. Maharaja Jai Singh of Jaipur who built this observatory went on to build other observatories in Ujjain , Varanasi and Mathura. Jai Singh had found the existing astronomical instruments too small to take correct measurements and so he built these larger and more accurate instruments.Jantar MantarThe instruments at Jantar Mantar are fascinating for their ingenuity, but accurate observations can no longer be made from here because of the tall buildings around.",
          "images":
              "https://delhitourism.gov.in/delhitourism/images/jantar_mantar.jpg",
          "location":
              "https://www.google.co.in/maps/place/Swaraj+Dweep/@11.9656084,92.9194242,12z/data=!3m1!4b1!4m5!3m4!1s0x3088d3d85e0fe039:0x25c8aaaa513ef4bf!8m2!3d11.9760503!4d92.9875565"
        }
      ]
    },

    {
      "id": "2",
      "name": "Maharashtra",
      "capital": "Mumbai",
      "about":
          "Maharashtra, the land of everything unlimited invites you into its widespread plethora of attractions. It is adorned by the beautiful Sahyadri ranges of the Western Ghats with high mountains that disappear into the morning mist, while the sprawling belt of the Konkan Coast mesmerises the eyes by its white beaches. The ruins of the ancient forts and palaces in Pune and Ratnagiri among others proudly narrates the story of the then mighty rulers of Maharashtra. Centuries-old temples situated in places like Pandharpur, Ozar are still rooted in their traditions, offering sanctuary to pilgrims. As do the small hill stations of Mahabaleshwar, Lonavala, Matheran, nestled cosily in nature, provide respite to travellers from the hustle and bustle of the cities.Often called the 'Gateway to the Heart of India', Maharashtra is the third largest state and second most populous state than in the country. Owing to its proximity to the Western Ghats, it is blessed with a picturesque backdrop of the mountains on one side and has the beautiful Konkan coastal belt on the other.",
      "img": [
        // "https://www.tripsavvy.com/thmb/sOKirs6tks8NcKlhytwechtqOm4=/4241x2386/smart/filters:no_upscale()/GettyImages-1008831236-5c65d6bf4cedfd00014aa310.jpg",
        "https://ihpl.b-cdn.net/pictures/travelguide/other-images/dest_head_img-550.jpeg",
        "https://cdn.dnaindia.com/sites/default/files/styles/full/public/2018/08/05/713821-mumbai-pune-expressway-03.jpg",
        "https://k6u8v6y8.stackpathcdn.com/blog/wp-content/uploads/2014/12/Untitled-design-17-1.png",
        "https://cdn1.goibibo.com/t_tg_fs/mumbai-juhu-beach-152537165081-orijgp.jpg",
        "https://r-cf.bstatic.com/images/hotel/max1024x768/103/103705059.jpg"
      ],
      "tourist": [
        {
          "name": "Mumbai",
          "info":
              "Mumbai, the capital city of the Indian state of Maharashtra, is a spectacular paradox of chaos and hope, glamour and squalor, modernity and tradition. Famously known as the City of Dreams, Mumbai – formerly known as Bombay - Mumbai is a beautifully blended melting pot of cultures and lifestyles.One of the main centres in the country of art, culture, music, dance and theatre, Mumbai is a dynamic, cosmopolitan city that has been running for years solely on the indomitable spirit of the Mumbaikars.",
          "images": "https://www.holidify.com/images/bgImages/MUMBAI.jpg",
          "location":
              "https://www.google.co.in/maps/place/Mumbai,+Maharashtra/data=!4m2!3m1!1s0x3be7c6306644edc1:0x5da4ed8f8d648c69?sa=X&ved=2ahUKEwib5sWm5frlAhW5xTgGHf10CCMQ8gEwKXoECBcQBA"
        },
        {
          "name": "Ajanta And Ellora Caves",
          "info":
              "Ajanta and Ellora caves, considered to be one of the finest examples of ancient rock-cut caves are located near Aurangabad in the state of Maharashtra, India. Adorned with beautiful sculptures, paintings and frescoes, Ajanta and Ellora caves are an amalgamation of Buddhist, Jain and Hindu monuments as the complex includes both Buddhist monasteries as well as Hindu and Jain temples. The Ajanta caves are 29 in number and were built in the period between 2nd century BC and 6th century AD whereas the Ellora Caves are more spread out and 34 in number and dates to the period between 6th and 11th Century AD.Ajanta and Ellora caves are designated as UNESCO World Heritage Sites and are quite popular among travellers from all over the world. ",
          "images": "https://static.toiimg.com/photo/52533940/.jpg",
          "location":
              "https://www.google.co.in/maps/place/Ajanta+Caves/@20.5518603,75.7032521,15z/data=!4m5!3m4!1s0x0:0x7ca8d7c57639691f!8m2!3d20.5518603!4d75.7032521"
        },
        {
          "name": "Panchgani",
          "info":
              "Deriving its name from the five hills surrounding it, Panchgani is a popular hill station near Mahabaleshwar, famous for its various sunset/sunrise points and scenic valley view.Located at an altitude of 1, 334 mts. , Panchgani is a hill station in Maharashtra, known for its scenic views. Five hills form the Sahyadri mountain ranges offer Panchgani its name. The picturesque backdrop of hills on one side and coastal plains on the other makes for an amazing view. In the British era, the place was treated as a summer resort and hence many colonial period establishments can be seen here. Mahabaleshwar is like a twin city to Panchgani.",
          "images":
              "https://images.thrillophilia.com/image/upload/s--sxUdO_kN--/c_fill,f_auto,fl_strip_profile,g_center,h_642,q_auto,w_1280/v1/images/photos/000/049/457/original/1553066319_panchgani_places_feature.jpg.jpg",
          "location":
              "https://www.google.co.in/maps/place/Panchgani,+Maharashtra/data=!4m2!3m1!1s0x3bc2660326292d1b:0x7b364992c7d16bfc?sa=X&ved=2ahUKEwjjjrmF5vrlAhW8xDgGHa-4BGgQ8gEwJ3oECBgQBA"
        },
        {
          "name": "Mahabaleshwar",
          "info":
              "Mahabaleshwar is a hill station located in the Western Ghats, in Satara district of Maharashtra. Known for its captivating beauty and the beautiful strawberry farms, the city comprises of ancient temples, boarding schools, manicured and lush green dense forest, waterfalls, hills, valleys. The city is definitely among the most sought after weekend getaways from Mumbai. Charming views, enticing valleys, serene lakes and a refreshing delight for your taste buds - the best way to summarize this natures gift.",
          "images":
              "https://www.holidify.com/images/bgImages/MAHABALESHWAR.jpg",
          "location":
              "https://www.google.co.in/maps/place/Mahabaleshwar,+Maharashtra+412806/@17.925819,73.6137621,13z/data=!3m1!4b1!4m5!3m4!1s0x3bc2655313cba1bb:0xca8196c7aa20a0a8!8m2!3d17.9307285!4d73.6477342"
        },
        {
          "name": "Alibag",
          "info":
              "A little coastal town tucked away in the Konkan region of Maharashtra, Alibaug is a very popular weekend getaway holiday destination and has earned itself the name of 'mini-Goa', owing to the high tourist footfall all year round. Steeped in colonial history, Alibaug is a quaint little town located about 110 kilometres from Mumbai, and is replete with sandy beaches, clean unpolluted air and plenty of forts and temples, ensuring that despite being a small town, you never run out of activities to do.Alibaug has numerous beaches, and all the beaches are only a few minutes’ drives away from each other, so you won’t have to worry about which beach to visit and which one to leave out. The most visited in the beach in Alibaug is, of course, Alibag beach, which offers a spectacular of view of not only the sunrise and sunset but of the Colaba fort as well, which you can take a short boat ride to.",
          "images": "https://www.holidify.com/images/bgImages/ALIBAG.jpg",
          "location":
              "https://www.google.co.in/maps/place/Alibag,+Maharashtra/@18.6581318,72.8637615,14z/data=!3m1!4b1!4m5!3m4!1s0x3be87a3b9826f96b:0xa9634e5680f68b81!8m2!3d18.6568523!4d72.8705888"
        },
        {
          "name": "Nashik",
          "info":
              "Nashik (Nasik), named after a relic associated with Ramayana, is a city in Maharashtra located on the banks of river Godavari. Nashik plays host to the famous Kumbh Mela every 12 years. The city is home to plenty of exotic temples and is known in Hindu mythology as the place where Ravana's sister, Surpanakha, tried to seduce Lord Ram and got her nose cut off by Lakshman in the process. Its religious importance doesn't end there. It also plays host to the thousands of tourists visiting Shirdi and Trimbakeshwar. Apart from its temples, Nashik also has forts, waterfalls and vineyards to look out for. With multiple vineyards present in Nashik, the most popular being Sula, the wine-tourism industry is mushrooming in this part of Maharashtra. Nashik gives you the chance to experience a fabulous cocktail of extremes - from temples to vineyards, hills to waterfalls, this place offers a lot to see.",
          "images":
              "https://3.bp.blogspot.com/-9E9gZXWCViM/XJ3nDqdji3I/AAAAAAABVxg/eYWwfQDFXOEruwo_ZgBoEiPL1D3LH6z6gCLcBGAs/s1600/Gondeshwar_temple.jpg",
          "location":
              "https://www.google.co.in/maps/place/Nashik,+Maharashtra/@19.9909493,73.7334397,12z/data=!3m1!4b1!4m5!3m4!1s0x3bddd290b09914b3:0xcb07845d9d28215c!8m2!3d19.9974533!4d73.7898023"
        },
        {
          "name": "Pune",
          "info":
              "Pune is a bustling metropolis of Maharashtra, ranked number one in India in the ease of living. Often referred to as the Oxford of the East, it is a hub of diverse people and activities and is in rapidly growing into one of the top metropolitan cities in the country. Pune is a city that perfectly blends modernity with tradition sprinkled with colonial-era charm, and it deserves the title of being the cultural capital of Maharashtra.Behind the modern commercialized façade of Pune lies the roots of ancient Poona, which gave birth to the Maratha Empire and had a very crucial role to play in the history of India’s independence. Pune is globally known for the Osho Ashram which attracts followers from all over the world. Dotted with palaces and temples, the most important of these are the Shaniwar Wada palace and the Aga Khan Palace. ",
          "images":
              "https://cdn.dnaindia.com/sites/default/files/styles/full/public/2018/08/05/713821-mumbai-pune-expressway-03.jpg",
          "location":
              "https://www.google.co.in/maps/place/Pune,+Maharashtra/@18.5245649,73.7228783,11z/data=!3m1!4b1!4m5!3m4!1s0x3bc2bf2e67461101:0x828d43bf9d9ee343!8m2!3d18.5204303!4d73.8567437"
        },
        {
          "name": "Kashid",
          "info":
              "A Beach town, popular for its white sand and blue seas situated in Konkan region of Maharashtra, Kashid is the perfect destination for a quiet weekend getaway from Mumbai.A soothing and calm place in nature's lap, Kashid is mildly enchanting with its quiet environment and picturesque location. This beach town is known also for its majestic mountains and whispering Casuarinas. A delightful place for those seeking a serene environment, Kashid is has a calm shore that stretches to a vast extent and presents with a spellbound appearance. Kashid's spotless water and clean beach makes it one of the most beautiful spots in the nearby areas. A drive through the area in itself is a great experience. Chaul, which lies near Kashid, has many Buddhist caves that are of public interest, and also famous churches and temples. The Korlai Fort is another beautiful attraction here.",
          "images": "https://www.holidify.com/images/bgImages/KASHID.jpg",
          "location":
              "https://www.google.co.in/maps/place/Kashid,+Maharashtra/@18.4401081,72.8902862,14z/data=!3m1!4b1!4m5!3m4!1s0x3be8687c8a4e9b5d:0x8d857627a2ac7f9d!8m2!3d18.4376235!4d72.9091436"
        },
        {
          "name": "Aurangabad",
          "info":
              "Aurangabad, which was declared by the Government as the Tourism Capital of Maharashtra back in 2010, is a famous tourist hub which greets its visitors with a richly woven tapestry of sights and sounds. The city got its name for being the erstwhile capital of Mughal Emperor Aurangzeb in the 17th century AD. The town is used as the base to explore the extremely famous caves of Ajanta and Ellora, Daulatabad Fort which is renowned for its strong defence systems, Mausoleums of Aurangzeb and Bibi-Ka-Maqbara famous for its architecture and Grishneshwar Temple, one of the only 12 Shiva Jyotirlingas in India.The most famous tourist attraction of Aurangabad is the Ajanta and Ellora Caves. Declared a World Heritage Site by UNESCO, the Ajanta Caves is home to 29 different caves, all of which showcase Buddhist artwork belonging to the period ranging from 200 B.C to 650 A.D.",
          "images": "https://www.holidify.com/images/bgImages/AURANGABAD.jpg",
          "location":
              "https://www.google.co.in/maps/place/Aurangabad,+Maharashtra/@19.8700826,75.2351603,12z/data=!3m1!4b1!4m5!3m4!1s0x3bdb9815a369bc63:0x712d538b29a2a73e!8m2!3d19.8761653!4d75.3433139"
        },
      ]
    },
    {
      "id": "3",
      "name": "West Bengal",
      "capital": "Kolkata",
      "about":
          "Located in Eastern India, the fourth most populous state in the country is widely considered the Melting pot of Cultures. Bordered by five different states, its capital Kolkata is often termed as the cultural capital of India. West Bengal offers a unique flavour to the richness of India with its synthesis of various languages, religions, customs, traditions, cuisines and lifestyle. Bound by the grandeur of the Himalayan ranges in the north and sweetened by the sea in the south, Bengal has everything a state needs to flourish.",
      "img": [
        "https://gos3.ibcdn.com/india-west-bengal-148317058835o.jpeg",
        "https://bit.ly/356rXMx",
        "https://bit.ly/33RDGhU",
        "https://bit.ly/33TedVo",
        "https://bit.ly/2QiHPrf",
        "https://bit.ly/2plyIe9"
      ],
      "tourist": [
        {
          "name": "VICTORIA MEMORIAL",
          "info":
              "Today the Victoria Memorial Hall is a museum having an assortment of Victoria memorabilia, British Raj paintings and other displays. As night descends on Kolkata, the Victoria Memorial Hall is illuminated, giving it a fairy tale look. It is interesting to note that the Victoria Memorial was built without British government funds. The money required for the construction of the stately building, surrounded by beautiful gardens over 64 acres and costing more than 10 million was contributed by British Indian states and individuals who wanted favours with the British government. At the top of the Victoria Memorial is a sixteen foot tall bronze statue of victory, mounted on ball bearings. It rotates with wind.",
          "images":
              "https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Victoria_Memorial_situated_in_Kolkata.jpg/450px-Victoria_Memorial_situated_in_Kolkata.jpg",
          "location":
              "https://www.google.co.in/maps/place/Harmandir+Sahib/@31.6199803,74.8764849,15z/data=!4m5!3m4!1s0x0:0x604384897626248e!8m2!3d31.6199803!4d74.8764849"
        },
        {
          "name": "HOWRAH BRIDGE",
          "info":
              "The Howrah Bridge is a bridge that spans the Hooghly River in West Bengal. It was originally named the New Howrah Bridge because it links the city of Howrah to its twin city, Kolkata (Calcutta). On 14 June 1965, it was renamed Rabindra Setu, after Rabindranath Tagore a great poet and the first Indian Nobel laureate. However it is still popularly known as the Howrah Bridge.",
          "images":
              "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Howrah_bridge_at_night.jpg/413px-Howrah_bridge_at_night.jpg",
          "location":
              "https://www.google.co.in/maps/place/Wagah/@31.604757,74.574136,15z/data=!4m2!3m1!1s0x0:0x325315a52b19a1a9?sa=X&ved=2ahUKEwiupo-auvPlAhVL6XMBHYYYC8UQ_BIwJHoECA4QCA"
        },
        {
          "name": "INDIAN MUSEUM",
          "info":
              "The Indian Museum is the largest and oldest museum in India and has rare collections of antiques, armour and ornaments, fossils, skeletons, mummies, and Mughal paintings. It was founded by the Asiatic Society of Bengal in Kolkata (Calcutta), India, in 1814. The founder curator was Dr Nathaniel Wallich, a Danish botanist. It has six sections comprising thirty five galleries of cultural and scientific artifacts namely Art, Archaeology, Anthropology, Geology, Zoology and Economic Botany. This multipurpose Institution with multidisciplinary activities is being included as an Institute of national importance in the seventh schedule of the Constitution of India. It is one of oldest museums in the world. This is an autonomous organization under Ministry of Culture, Government of India. The present Director of the Indian Museum is Dr. B. Venugopal. The museum was closed to the Visitors due to massive restoration and upgrades from 1 September 2013 to 3 February 2014.",
          "images":
              "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Indian_Museum%2C_Courtyard%2C_Kolkata%2C_India.jpg/375px-Indian_Museum%2C_Courtyard%2C_Kolkata%2C_India.jpg",
          "location":
              "https://www.google.co.in/maps/place/Jallianwala+Bagh/@31.0529259,74.7523128,8z/data=!4m5!3m4!1s0x0:0xcb013976169cb75b!8m2!3d31.6206437!4d74.8801088"
        },
        {
          "name": "ALIPORE ZOO",
          "info":
              "Zoological Garden or Zoo in Kolkata is one of the prime tourist spots in the city. The Alipore Zoological Garden first opened its gate on the 1st of May, 1876 and since then has remained an absolute favorite of children. The history of Alipore Zoo Garden dates back to as early as 1842, when the curator of Bengal Asiatic Society, Dr John McCleland came up with a plan for the establishment of the zoological garden in Calcutta. However, this did not materialize and was followed by the plan of Dr. Joseph Bart Fayrer (the president of Asiatic Society of Bengal) in 1867. This plan drew great public attention but failed due to a lack of space. For the same reason the plan of Carl Louise Schwendler, the postmaster to the Govt. of India failed in 1873. At last, in 1875 the Lt. Govt. of Bengal Sir Richard Temple took the initiative. The land on Alipore Road was chosen and approved leading to opening gates to the public on 1st May, 1876.",
          "images":
              "https://upload.wikimedia.org/wikipedia/en/thumb/7/74/Zoological_Garden_Alipore_logo.jpg/330px-Zoological_Garden_Alipore_logo.jpg",
          "location":
              "https://www.google.co.in/maps/place/Bhakhra+Dam/@31.4111964,76.4334066,15z/data=!4m5!3m4!1s0x0:0x7cb91e54289880ac!8m2!3d31.4111964!4d76.4334066"
        },
        {
          "name": "VIDYASAGAR SETU",
          "info":
              "Vidyasagar Setu, which is famously called Second Hooghly Bridge is located over the River Hooghly in Kolkata. Vidyasagar Setu is reckoned as one of the longest bridges of its type across India. It is also acknowledged as one of the longest bridges of Asia. This cable-stayed bridge covers a little over 457 m and has a deck of 35 m width. The building of the bridge was initiated in 1978 and it was eventually opened to the public on the 10th of October, 1992. A whopping amount of Rs.3.88 billion was invested for constructing the Vidyasagar Setu. The bridge carries the NH 117, also known as the Kona Expressway. With six lanes of traffic, the bridge can carry more than 85,000 vehicles every day.",
          "images":
              "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Vidyasagar_Setu_-_Kolkata_2014-07-11_7360.JPG/375px-Vidyasagar_Setu_-_Kolkata_2014-07-11_7360.JPG",
          "location":
              "https://www.google.co.in/maps/place/Sukhna+Lake/@30.742074,76.8039478,14z/data=!3m1!4b1!4m5!3m4!1s0x390fed34138d9147:0x8a7a0db7c410d5a2!8m2!3d30.7421379!4d76.8187557"
        },
      ]
    },
    {
      "id": "4",
      "name": "Jammu and Kashmir",
      "capital": "Srinagar",
      "about":
          "Jammu and Kashmir (J&K) is a Union Territory (UT) of India, located in the country’s northern part and a global tourist destination. In addition to traditional recreational tourism, vast scope exists for adventure, pilgrimage, spiritual, and health tourism. The natural beauty and picturesque locations have made it a favoured destination for tourists across the world. Jammu is famous for its temples, while Kashmir Valley is known for its lakes and garde.",
      "img": [
        "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Pahalgam_Valley.jpg/375px-Pahalgam_Valley.jpg",
        "https://ihplb.b-cdn.net/wp-content/uploads/2011/02/Forts.jpg",
        "https://assets.traveltriangle.com/blog/wp-content/uploads/2016/09/Gadisar-Lake-in-Rajasthan..jpg",
        "https://mk0egoveletsonla87wv.kinstacdn.com/wp-content/uploads/2018/07/Rajatshan-tourism-1.jpg",
        "https://cdn1.tripoto.com/media/filter/tst/img/1682588/Image/1568655470_things_to_do_in_udaipur_rajasthan.jpg",
        "https://static.toiimg.com/thumb/68427211/3.jpg?width=748&height=499"
      ],
      "tourist": [
        {
          "name": "Vaishno Devi",
          "info":
              "Those who are spiritually inclined should not miss out on visiting Vaishno Devi, a major Hindu pilgrimage destination in India. The temple stands on the Trikuta Hills in Jammu. The Mother Goddess, who is the main deity, is believed to fulfil the wishes of her devotees. To reach the temple, you will have to take a trek of nearly 14 kilometers which starts from the Ban Ganga bridge. Other options are battery operated cars, ponies, palkies and helicopter rides to Mata Vaishno Devi Temple.",
          "images":
              "https://www.tourmyindia.com/blog//wp-content/uploads/2020/12/Vaishno-Devi.jpg",
          "location":
              "https://www.google.co.in/maps/place/Jaipur,+Rajasthan/@26.8851417,75.6504723,11z/data=!3m1!4b1!4m5!3m4!1s0x396c4adf4c57e281:0xce1c63a0cf22e09!8m2!3d26.9124336!4d75.7872709"
        },
        {
          "name": "Yusmarg",
          "info":
              "Yusmarg is a hill station in the western part of the valley of Kashmir. The Ahmadiyya Muslim community believes it to be the place where Jesus once lived. The landscape here is more beautiful than anything you will ever see.There are plenty of options for sightseeing and trying out activities like trekking and horse riding.",
          "images":
              "https://www.tourmyindia.com/blog//wp-content/uploads/2020/12/Yusmarg-Jammu-Kashmir.jpg",
          "location":
              "https://www.google.co.in/maps/place/Amber+Palace/@26.9854865,75.8513454,15z/data=!4m5!3m4!1s0x0:0x6221df6747147e2b!8m2!3d26.9854865!4d75.8513454"
        },
        {
          "name": "Gulmarg",
          "info":
              "Gulmarg has everything going for it: snowdressed mountains, greenery, lakes, pine & fir forests and different types of flowers. It is snug in a valley in the Pir Panjal Range. Its name means, the meadows of flowers, and you will come across a lot of meadows decorated with daisies. Most of all though, Gulmarg is the best skiing destination in Asia, has the highest green golf course in the world as well as the highest cable car project.",
          "images":
              "https://www.tourmyindia.com/blog//wp-content/uploads/2020/12/Gulmarg.jpg",
          "location":
              "https://www.google.co.in/maps/place/Amber+Palace/@26.9854865,75.8513454,15z/data=!4m2!3m1!1s0x0:0x6221df6747147e2b?sa=X&ved=2ahUKEwjnp4SljfjlAhVy7XMBHZF7CYwQ_BIwH3oECCkQCA"
        },
        {
          "name": "Sanasar",
          "info":
              "Sanasar is named after the villages of Sana and Sar, and can be counted among the most beautiful places to visit in Jammu and Kashmir. It is a meadow situated in Jammu, and has the appearance of a cup.You will come across coniferous forests, meadows clothed with flowers and heart winning views of the Himalayan Ranges. It’s a good place for trekkers, with plenty of trekking trails. If you are travelling with your family, there are also opportunities for camping including lighting a bonfire.",
          "images":
              "https://www.tourmyindia.com/blog//wp-content/uploads/2020/12/Sanasar-Jammu-Kashmir.jpg",
          "location":
              "https://www.google.co.in/maps/place/Hawa+Mahal/@26.9239363,75.8267438,15z/data=!4m2!3m1!1s0x0:0x860e5d531eccb20c?sa=X&ved=2ahUKEwiOlby_jfjlAhV_7XMBHZ8cAgoQ_BIwH3oECA0QCA"
        },
        {
          "name": "Doda",
          "info":
              "Doda is a district located in the eastern part of Jammu and has plenty of opportunities for sightseeing and even adventure. Those who are spiritually inclined should certainly visit Doda, since there are plenty of temples and a splendid mosque too.Adventure enthusiasts can enjoy a variety of sports like snow skiing, mountain biking, trekking and paragliding.",
          "images":
              "https://www.tourmyindia.com/blog//wp-content/uploads/2020/12/Doda-Jammu-Kashmir.jpg",
          "location":
              "https://www.google.co.in/maps/place/Albert+Hall+Museum/@26.9115755,75.8194875,15z/data=!4m2!3m1!1s0x0:0x5bb4333133c6968?sa=X&ved=2ahUKEwif6p7qjfjlAhXX6nMBHTSzBt8Q_BIwHXoECBQQCA"
        },
      ]
    },
    {
      "id": "5",
      "name": "Tamil Nadu",
      "capital": "Chennai,",
      "about":
          "Ancient temples, vibrant arts, natural wonders and a bustling culinary scene make  Chennai, the capital of Tamil Nadu, one of the most popular tourist destinations in the southern fringes of the country. Located on the Coromandel Coast, this busy metropolis was formerly called Madras. From the resplendent classical dance form of bharatnatyam to the rich flavours of its iconic cuisine and from the lustrous silk sarees traded here to the gorgeous temples and churches, Chennai is the gatekeeper of South Indian art, culture and traditions. The city is also the perfect base from which trips to other locales in Tamil Nadu can take off. ",
      "img": [
        "https://upload.wikimedia.org/wikipedia/commons/3/32/Chennai_Central.jpg",
        "https://invest-india-revamp-static-files.s3.ap-south-1.amazonaws.com/s3fs-public/2018-07/Kerala_2.png",
        "https://www.bookitforgetit.com/wp-content/uploads/2016/10/Kerala-is-a-state-in-the-southwest-region-of-India.jpg",
        "https://img.veenaworld.com/group-tours/india/kerala/klhl-i/klhl-i-bnn-1.jpg",
        "https://i2.wp.com/www.abtravelworld.com/wp-content/uploads/2019/04/Kerala-beach.jpg?fit=980%2C500&ssl=1",
        "https://www.myjewishlearning.com/wp-content/uploads/2010/07/Kerala_Backwaters.jpeg"
      ],
      "tourist": [
        {
          "name": "Marina Beach",
          "info":
              "Tired of the sweltering heat of Chennai? Let the Marina Beach be a sweet escape spot for you. Beaches in Chennai along the Bay of Bengal coast, it happens to be the longest beach in India and one of the longest in the world. Got enough time to pay a visit to this amazing place during the morning or evening? We suggest that you should not miss out on experiencing the enthralling view of the sun setting or rising from the beach. You may shop for trinkets such as imitation jewellery, shell mementos from the stalls on the beach side. Among the best places to visit in Chennai with friends, it is perfect to build sand castles or play games like beach volleyball.",
          "images":
              "https://www.fabhotels.com/blog/wp-content/uploads/2018/10/Marina-Beach.jpg",
          "location":
              "https://www.google.co.in/maps/place/Munnar,+Kerala+685612/@10.0806491,77.0466683,14z/data=!3m1!4b1!4m5!3m4!1s0x3b0799794d099a6d:0x63250e5553c7e0c!8m2!3d10.0889333!4d77.0595248"
        },
        {
          "name": "Valluvar Kottam",
          "info":
              "Those of you who love literature must have heard or read about the famous Tamil poet and saint, Thiruvalluvar. For the uninformed, Thiruvalluvar is hailed as one of the greatest Tamil scholars. Valluvar Kottam is an intricately designed chariot built in his honour. The magnificence of Valluvar Kottam can be best experienced early in the morning or when the sun is just setting. Wondering how to reach here? It is located at the intersection of Kodambakkam High Road and Village Road; taxis and buses can be taken from around the city.",
          "images":
              "https://www.fabhotels.com/blog/wp-content/uploads/2018/07/Valluvar-Kottam.jpg",
          "location":
              "https://www.google.co.in/maps/place/Alappuzha,+Kerala/data=!4m2!3m1!1s0x3b0884f1aa296b61:0xb84764552c41f85a?sa=X&ved=2ahUKEwj6uuG_nPnlAhXSzDgGHaOWA00Q8gEwJXoECBwQBA"
        },
        {
          "name": "Ashtalakshmi Temple",
          "info":
              "Regarded as an abode of Lakshmi, the Goddess of Wealth and Knowledge, Ashtalakshmi Temple is a few kilometres from Besant Beach. Constructed to worship the eight avatars of Goddess Lakshmi, the divine ambience of this temple is bound to leave you feeling relaxed. The most interesting part of this place? The waves of the ocean echo in the temple complex, which further makes it all the more peaceful. Ideal place to give rest to those worries while spiritually enlightening yourself, isn’t it?",
          "images":
              "https://www.fabhotels.com/blog/wp-content/uploads/2018/07/Ashtalakshmi-Temple-trover.jpg",
          "location":
              "https://www.google.co.in/maps/place/Wayanad,+Kerala/@11.7141243,75.8289888,10z/data=!3m1!4b1!4m5!3m4!1s0x3ba60cf91a9c5f0d:0x71dd4da2e1d3e46f!8m2!3d11.6853575!4d76.1319953"
        },
        {
          "name": "Mylapore",
          "info":
              "Want to soak in the rich and colourful culture of Chennai? Head to Mylapore, which is regarded as the cultural hub of Chennai, boasting a history going back 1500 years! Whether it is beautiful temples you are looking to visit or delicious South Indian delicacies to binge on, Mylapore has it all! All this, combined with endless options for shopping, make the neighbourhood one of the best entertainment places in Chennai.",
          "images":
              "https://www.fabhotels.com/blog/wp-content/uploads/2019/02/Spend-a-day-in-Mylapore-Unearthing-Legends-and-Folklore.jpg",
          "location":
              "https://www.google.co.in/maps/place/Kochi,+Kerala/@9.9823428,76.1608472,11z/data=!3m1!4b1!4m5!3m4!1s0x3b080d514abec6bf:0xbd582caa5844192!8m2!3d9.9312328!4d76.2673041"
        },
        {
          "name": "Kapaleeswarar Temple",
          "info":
              "The holy shrine of Lord Shiva, Kapaleeswarar Temple was built by the mighty Pallavas which was demolished by the Portuguese explorers and rebuilt during the Vijayanagara Empire. Kapaleeswarar Temple is the best specimen of the Dravidian and Vijayanagara architecture making it look absolutely marvellous!",
          "images":
              "https://www.fabhotels.com/blog/wp-content/uploads/2018/07/Kapaleeswarar-Temple.jpg",
          "location":
              "https://www.google.co.in/maps/place/Thekkady,+Kumily,+Kerala/data=!4m2!3m1!1s0x3b06f8812df2a199:0x468af17958c54ae8?sa=X&ved=2ahUKEwiwlMjtnfnlAhVzpOkKHeYdD04Q8gEwJXoECBUQBA"
        },
      ]
    },
    {
      "id": "6",
      "name": "Goa",
      "capital": "Panaji",
      "about":
          "Goa, situated on the west coast of India, is one of the most delightful states of India. Formerly a Portuguese colony, it is endowed with a variety of attractions including palm fringed beaches, miles of golden sands, lush green country-side, an incredible mosaic of cultural heritage, magnificent churches, temples, forts and monuments and a unique cultural synthesis of the east and west. With its tropical climate, Goa is a tourist destination for all seasons. Goa is a treasure trove of culture, music, dances and art forms that can be enjoyed during local festivals and celebrations. Animal lovers can visit the State’s wildlife sanctuaries It is often said that ‘Goa never stops partying’. The city is known for its vibrancy that attains its pinnacle in the annual Goa Carnival festival.",
      "img": [
        //"https://cdn1.goibibo.com/india-uttarakhand-149361554819o.jpg",
        "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/BeachFun.jpg/420px-BeachFun.jpg",
        "https://www.holidaytravel.co/uploaded_files/destination_img/2017_46592e7e82dbb7balmora.jpg",
        "https://www.holidify.com/images/compressed/flexPage_35.jpg",
        "https://www.holidify.com/images/compressed/664.jpg?v=1.1",
        "https://www.chardham-tours.com/wp-content/uploads/2018/07/uttarakhand-tour-packages.jpg"
      ],
      "tourist": [
        {
          "name": "Agonda Beach",
          "info":
              "A quiet and beautiful beach in South Goa, Agonda Beach is for those who want to spend time amidst peaceful surroundings and away from the chaos. This pristine beach in Goa stretches almost two miles and is fringed by beach shacks offering some great food and drinks.Agonda Beach is perfect for swimming and chilling. It is also great for taking a boat ride and enjoying the expanse of the sea and the beauty of nearby Butterfly and Honeymoon Beaches. A large number of shops selling clothes and accessories make Agonda Beach ideal for shopping as well",
          "images":
              "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0e/7c/44/65/far-right-end-agonda.jpg?w=1200&h=-1&s=1",
          "location":
              "https://www.google.co.in/maps/place/Rishikesh,+Uttarakhand/@30.0876602,78.2005685,12z/data=!3m1!4b1!4m5!3m4!1s0x39093e67cf93f111:0xcc78804a6f941bfe!8m2!3d30.0869281!4d78.2676116"
        },
        {
          "name": "Baga Beach",
          "info":
              "One of the most happening beaches in Goa, Baga Beach is where you will find water sports, fine dining restaurants, bars, and clubs. Situated in North Goa, Baga Beach is bordered by Calangute and Anjuna Beaches. Watersports are the major attraction of Baga Beach. Parasailing, wakeboarding, windsurfing, kite surfing, jet skiing are some of the top watersports activities to enjoy in Baga Beach. One can also go for dolphin spotting tours and island trips from the beach.Baga also boasts one of the best nightlife scenes in Goa, the famous Tito’s Lane has some of the best bars and clubs. One unique attraction at Baga Beach is an indoor snow park that has a play area, sledding area, and ice bar. For shopaholics, there is a Tibetan Market on the Baga Road.",
          "images":
              "https://www.tourmyindia.com/states/goa/image/baga-beach-banner.webp",
          "location":
              "https://www.google.co.in/maps/place/Nainital,+Uttarakhand/@29.3835928,79.4377611,14z/data=!3m1!4b1!4m5!3m4!1s0x39a0a1bc28fd9d61:0x7cae7ba916987db3!8m2!3d29.3919202!4d79.4542033"
        },
        {
          "name": "Fort Aguada",
          "info":
              "Famed as the biggest water reservoir in Asia, Aguada Fort is the crowning glory of Portuguese legacy in Goa. This fort is more than 400 years old.Fort Aguada never ceases to attract tourists with its mesmerizing beauty and rich history. You can witness the beautiful confluence of Mandovi River and Arabian Sea and an old lighthouse along with the magnificent fort.",
          "images":
              "https://www.tourmyindia.com/states/goa/image/fort-aguada-goa.webp",
          "location":
              "https://www.google.co.in/maps/place/Mussoorie,+Uttarakhand/@30.4547186,78.0414204,13z/data=!3m1!4b1!4m5!3m4!1s0x3908d0cfa61cda5b:0x197fd47d980e85b1!8m2!3d30.4597892!4d78.0643723"
        },
        {
          "name": "Chapora Fort",
          "info":
              "Located 10 km away from the town of Mapusa, bewitching and vivid, Chapora Fort in Chapora Village has remarkably withstood the ravages of time. Beauty lies in the eyes of the beholder and one only needs an eye to appreciate the beauty of this secluded ruined Fort.This fort was shown in the filming of Bollywood movie Dil chahta Hai and became very popular among youngsters as Dil Chahta hai Fort after the movie gained a lot of recognition.Native laterite stone and hilly terrains joined hands to take you back in time, when this fort used to be the pride of Portuguese rulers. Who knows about the great stories that were once created here? Who knows how many battles were once fought here? One can only imagine. Little remains of barracks, secret tunnels, officer quarters and cylindrical towers give fuel to the imagination.",
          "images":
              "https://www.tourmyindia.com/states/goa/image/chapora-fort-goa.webp",
          "location":
              "https://www.google.co.in/maps/place/Badrinath,+Uttarakhand+246422/@30.7417338,79.4852149,15z/data=!3m1!4b1!4m5!3m4!1s0x39a78e9f973108e7:0xf05a8b5e0c71473!8m2!3d30.7433085!4d79.4937634"
        },
      ]
    }
    // Add more place data here...
  ];

  final String _searchQuery = '';
  List<Map<String, dynamic>> filteredStates = [];

  @override
  void initState() {
    filteredStates = states;
    super.initState();
  }

  void searchStates(String query) {
    setState(() {
      filteredStates = states
          .where((state) =>
              state['name'].toLowerCase().contains(query.toLowerCase()) ||
              state['capital'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Info'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) => searchStates(value),
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredStates.length,
              itemBuilder: (ctx, index) {
                final state = filteredStates[index];
                return ListTile(
                  title: Text(state['name']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => StateDetails(state: state),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class StateDetails extends StatelessWidget {
  final Map<String, dynamic> state;

  const StateDetails({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(state['name']),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              state['img'][0],
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              'Capital: ${state['capital']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                //  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'About :',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    state['about'],
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Tourist Spots:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state['tourist'].length,
              itemBuilder: (ctx, index) {
                final spot = state['tourist'][index];
                return ListTile(
                  leading: Image.network(
                    spot['images'],
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                  title: Text(spot['name']),
                  subtitle: Text(spot['info']),
                  onTap: () {
                    // Open the location in Google Maps
                    // Replace this with your preferred method of opening external URLs
                    launchURL(spot['location']);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void launchURL(String url) async {
    // Replace this with your preferred method of opening external URLs
    // e.g., using url_launcher package: await launch(url);
  }
}
