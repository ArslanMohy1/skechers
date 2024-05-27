import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skechers/view/screens/product_detail.dart';
import 'package:skechers/view/utils/constant.dart';

class ProductPage extends StatefulWidget {
  final List productList;
  final String name;

  const ProductPage({Key? key, required this.productList, required this.name})
      : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List filteredList = [];
  String dropdownValue = 'Sort by Price'; // Default sort value

  @override
  void initState() {
    super.initState();
    filteredList = List.from(widget.productList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Get.height * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(CupertinoIcons.back, color: Color(kcolor)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.name,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(kcolor)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Row(
              children: [
                DropdownButton<String>(
                  value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      sortProducts(newValue);
                    });
                  },
                  items: <String>[
                    'Sort by Price',
                    'Sort by Name',
                    'Sort Title A-Z',
                    'Sort Title Z-A',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    _showFilterBottomSheet(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Row(
                      children: [
                        Icon(Icons.filter_list, size: 20, color: Color(kcolor)),
                        Text("Filter", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(height: Get.height*0.8,
            width: Get.width*0.9,
            child: GridView.builder(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,

              itemCount: filteredList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 0.85,
              ),
              itemBuilder: (BuildContext context, int index) {
                return buildProductItem(filteredList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProductItem(product) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetail(
              name: product.name,
              price: product.price,
              image: product.image,
              desCription: product.detail,
            ),
          ),
        );
      },
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Card(
              elevation: 2.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(product.image),
              ),
            ),
          ),
          Column(
            children: [
              Text(product.name, style: TextStyle(fontSize: 12),maxLines: 1,),
              Text(product.price.toString() + "\$"),
            ],
          ),
        ],
      ),
    );
  }

  void sortProducts(String criteria) {
    setState(() {
      if (criteria == 'Sort by Price') {
        filteredList.sort((a, b) => a.price.compareTo(b.price));
      } else if (criteria == 'Sort by Name') {
        filteredList.sort((a, b) => a.name.compareTo(b.name));
      } else if (criteria == 'Sort Title A-Z') {
        filteredList.sort((a, b) => a.name.compareTo(b.name));
      } else if (criteria == 'Sort Title Z-A') {
        filteredList.sort((a, b) => b.name.compareTo(a.name));
      }
    });
  }
  void _showFilterBottomSheet(BuildContext context) {
    double _priceRangeMin = 0;
    double _priceRangeMax = 1000;

    TextEditingController minPriceController = TextEditingController(text: _priceRangeMin.toString());
    TextEditingController maxPriceController = TextEditingController(text: _priceRangeMax.toString());

    List<String> _sizes = [
      '1', '1.5', '2.0', '2.5', '3.0', '3.5', '4.0', '4.5', '5.0', '5.5',
      '6.0', '6.5', '7.0', '7.5', '8.0', '8.5', '9.0', '9.5', '10.0', '10.5',
      '11.0', '11.5', '12.0', '12.5', '13.0', '13.5', '14.0'
    ];
    String _selectedSize = _sizes.first;

    List<Color> _colors = [Colors.red, Colors.green, Colors.blue, Colors.yellow, Colors.black, Colors.white];
    Color _selectedColor = _colors.first;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Multi Filters',
                      style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 20, color: Color(kcolor)),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Size:',
                      style: GoogleFonts.inter(fontSize: 16, color: Color(kcolor)),
                    ),
                    DropdownButtonFormField<String>(
                      value: _selectedSize,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedSize = newValue!;
                        });
                      },
                      items: _sizes.map((String size) {
                        return DropdownMenuItem<String>(
                          value: size,
                          child: Text(size),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        border: InputBorder.none, // This removes the underline
                      ),
                    ),
                    SizedBox(height: 20),
                    Text('Price Range:', style: GoogleFonts.inter(fontSize: 16, color: Color(kcolor))),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: minPriceController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(labelText: 'Min Price'),
                            onChanged: (value) {
                              double? minPrice = double.tryParse(value);
                              if (minPrice != null) {
                                setState(() {
                                  _priceRangeMin = minPrice;
                                });
                              }
                            },
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: TextField(
                            controller: maxPriceController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(labelText: 'Max Price'),
                            onChanged: (value) {
                              double? maxPrice = double.tryParse(value);
                              if (maxPrice != null) {
                                setState(() {
                                  _priceRangeMax = maxPrice;
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text('Price Range: \$${_priceRangeMin.toInt()} - \$${_priceRangeMax.toInt()}', style: GoogleFonts.inter(fontSize: 16, color: Color(kcolor))),
                    RangeSlider(
                      activeColor: Color(kcolor),
                      inactiveColor: Colors.grey,
                      values: RangeValues(_priceRangeMin, _priceRangeMax),
                      min: 0,
                      max: 1000,
                      onChanged: (RangeValues values) {
                        setState(() {
                          _priceRangeMin = values.start;
                          _priceRangeMax = values.end;
                          minPriceController.text = _priceRangeMin.toInt().toString();
                          maxPriceController.text = _priceRangeMax.toInt().toString();
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Color:',
                      style: GoogleFonts.inter(fontSize: 16, color: Color(kcolor)),
                    ),
                    Wrap(
                      spacing: 10,
                      children: _colors.map((Color color) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedColor = color;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: _selectedColor == color ? Colors.black : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            height: 20,
                            width: 20,
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: Get.width * 0.9,
                      child: MaterialButton(
                        color: Color(kcolor),
                        onPressed: () {
                          // Apply filtering logic here
                          // For example:
                          // filterProducts(size: _selectedSize, minPrice: _priceRangeMin, maxPrice: _priceRangeMax, color: _selectedColor);
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Apply Filters',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

}
