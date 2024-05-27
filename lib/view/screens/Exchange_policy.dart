import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExchangeReturnPolicyDialog extends StatefulWidget {
  @override
  _ExchangeReturnPolicyDialogState createState() => _ExchangeReturnPolicyDialogState();
}

class _ExchangeReturnPolicyDialogState extends State<ExchangeReturnPolicyDialog> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: AlertDialog(
        contentPadding: EdgeInsets.all(10.0),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Exchange / Return Policy',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xff0B2948),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'When it comes to catering to our customers, we ensure that maximum customer satisfaction is achieved.\n\n'
                    'Shoestreet does not offer any refunds. Customers can exchange the sizes if available in the same article. The brand would offer exchanges only in the following cases:',
                style: GoogleFonts.inter(),
              ),
              SizedBox(height: 10),
              Text(
                'A wrong size or product being delivered.',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0B2948),
                  ),
                ),
              ),
              Text(
                'Item delivered was damaged.',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0B2948),
                  ),
                ),
              ),
              Text(
                'Accessories will not be exchanged, unless the company delivered the wrong order.',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0B2948),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Any claims for the above must be sent to Shoestreet after receiving the order, after which it will be reviewed by ShoeStreet.\n\n'
                    'Please note that the products, Box and tags should be in the original state to be eligible for an exchange. We will get back to you within 48 hours of the request being sent.\n\n'
                    'Due to the differences in color monitors/screens and lighting used during photoshoots, the exact color or texture of the final item may slightly vary from what is seen on screen, therefore products cannot be exchanged for this reason.\n\n'
                    'Please note, no exchanges or store credit of any kind is offered for items bought on sale.',
                style: GoogleFonts.inter(),
              ),
              SizedBox(height: 10),
              Text(
                'Procedure for Exchange',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0B2948),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Products purchased directly from ShoesStreet.com are only eligible for an exchange.\n\n'
                    'If the product is in an unused condition, it can be exchanged within 15 days from the date of delivery with the original bill, product packing, and barcode intact.\n\n'
                    'Exchange Voucher will be issued via Email/SMS/WhatsApp, with the same amount/value of your exchanged product, which can be redeemed on Checkout from ShoeStreet.\n\n'
                    'Rs.500/- Delivery charges would be applied for exchange products.',
                style: GoogleFonts.inter(),
              ),
              SizedBox(height: 10),
              Text(
                'Procedure for Claim',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0B2948),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Only manufacturing claims would be entertained and no Wear & Tear cases would be accepted.\n\n'
                    'For manufacturing defects/Damaged products, products can be exchanged within 45 days from the date of delivery with supporting images of the article, box, and invoice with the detailed description of the issue.\n\n'
                    'Please email to skechers@nashwagroup.com to raise a dispute.\n\n'
                    'Shoestreet Team will look at each dispute on an individual basis and will make every effort to be fair to both parties.\n\n'
                    'We will respond quickly with instructions for how to return items from your order.',
                style: GoogleFonts.inter(),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}