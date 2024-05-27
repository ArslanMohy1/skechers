class CatagoryModel{
  final String image;
  final String name;

  CatagoryModel(this.image, this.name);
  static List catagory=[
   CatagoryModel( 'assets/catagories/new.png', 'new'),
    CatagoryModel( 'assets/catagories/men.png', 'men'),
    CatagoryModel( 'assets/catagories/women.png', 'women'),
    CatagoryModel( 'assets/catagories/kids.png', 'kids'),
    CatagoryModel( 'assets/catagories/sale.png', 'sale'),
    CatagoryModel( 'assets/catagories/accessories.png', 'accessories'),

  ];
}