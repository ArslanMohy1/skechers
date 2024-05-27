class MenCatagoryModel {
  final String Heading;
  final List SubHeadings;


  MenCatagoryModel(this.Heading, this.SubHeadings,);
  static List Men = [
    MenCatagoryModel('Shop by Collection', [
      'Relax Comfort',
      'Bobs',
      'Arch Fit',
      'Elite Flex',
      'Max cushioning',
      'Air Cooled Memory Foam',
      'D\'Lites',
      'D\'Lux Fitness',
      'Dual Lite',
      'Dress Knit',
      'Work & Safety',
      'Glide-Step Flex',
      'GO GOLF',
      'GO RUN',
      'GO WALK',
      'Good Year',
      'Hyper Burst',
      'Hyper Pillars',
      'Mark Nason',
      'Relaxed Fit',
      'Skech Air',
      'Skech Lite',
      'Skech Street',
      'Slip-Ins',
      'Ultra Flex',
      'Ultra Go',
      'Uno',
      'Massage Fit',
      'Nite Owl',
      'Stretch Fit',
      'Goga Mat',
      'ON-THE-GO',
    ],),

    MenCatagoryModel('Shop by Activity',[
     "Casual",
      "Casual Sneaker's",
     "Fashion Sneaker's",
      "Golf",
      "Running",
      "Trail & Hiking",
      "Training",
      "Walking"
    ],),
    MenCatagoryModel("Shop All Men's",[
      "New Arrivals",
    "Best Sellers",
   " Men's Sale",
    ],),
    MenCatagoryModel("Shoes", [
     "Sandals",
      "Slippers",
      "Slip On Men",

    ],)
  ];
  static List Women=[
    MenCatagoryModel('Shop by Collection',  [
      'Cushioned Luxe Foam',
      'Arch Fit',
      'Elite Flex',
      'Max Cushioning',
      'Air Cooled Memory Foam',
      'BOBS',
      'Cali',
      'D\'Lites',
      'Elite Flex',
      'Glide-Step Flex',
      'GO Golf',
      'Go Run',
      'Go Walk',
      'Good Year',
      'Hyper Burst',
      'Hyper Pillars',
      'Mark Nason',
      'Relaxed Fit',
      'Skech Lite',
      'Skech Air',
      'Skecher Street',
      'Slip-Ins',
      'Ultra Flex',
      'Ultra Go',
      'Uno',
      'Massage Fit',
      'Stretch Fit',
      'ON-THE-GO',
      'Goga Mat',
      'Yoga Foam',], ),
    MenCatagoryModel('Shop by Activity',[
      "Casual",
      "Casual Sneaker's",
      "Fashion Sneaker's",
      "Golf",
      "Running",
      "Trail & Hiking",
      "Training",
      "Walking"
    ],),
    MenCatagoryModel('Shop All Women', [
     'New Arrival',
   'Best Sellers',
     "Women's Sale",
    ],),
    MenCatagoryModel("Shoes", [
      "Sandals",
      "Slippers",
      "Slip On women",

    ],)
    

  ];
  static List Kids=[
    MenCatagoryModel('Boys', [
      'Slip-Ins',
      'Max Cushioning',
      'Air Cooled Memory Foam',
      'BOBS',
      'Crocs',
      'D\'Lites',
      'Elite Flex',
      'Go Run',
      'Go Walk',
      'Relaxed Fit',
      'S Lights',
      'Skech Air',
      'Twinkle Toes',
      'Ultra Flex',
      'Uno'
    ]),
    MenCatagoryModel('Girls', [
      'Skech Tunes',
      'Running',
      'Max Cushioning',
      'Air Cooled Memory Foam',
      'BOBS',
      'Crocs',
      'D\'Lites',
      'Elite Flex',
      'Go Run',
      'Go Walk',
      'Relaxed Fit',
      'S Lights',
      'Skech Air',
      'Twinkle Toes',
      'Ultra Flex',
      'Uno'
    ]),
    MenCatagoryModel('Infants', ['Boys','Girls']),
  ];
  static List Sale=[
    MenCatagoryModel('Sale', [
      'Men',
      'Women',
      'Boy',
      'Girl',
      'Infant'
    ]),
  ];
  static List Accessories=[
    MenCatagoryModel('Socks', [
      'Men',
      'Women',
      'Girls',
      'Boys',
      'Kids',
      'Infants',
      'Unisex Socks'
    ]),
    MenCatagoryModel('Bag', ['Women',
      'Girls',
      'UniSex']),
    MenCatagoryModel('Cap', ['unisex']),
  ];
}
