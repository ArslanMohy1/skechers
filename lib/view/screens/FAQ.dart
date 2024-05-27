import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HelpFAQDialog extends StatefulWidget {
  @override
  _HelpFAQDialogState createState() => _HelpFAQDialogState();
}

class _HelpFAQDialogState extends State<HelpFAQDialog> with SingleTickerProviderStateMixin {
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
                'Help/FAQ',
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
                'Help or frequently asked questions about Orders, Returns, Payment, Product info, store Info, and policies.',
                style: GoogleFonts.inter(),
              ),
              SizedBox(height: 10),
              Text(
                'How do I clean my shoes?',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0B2948),
                  ),
                ),
              ),
              Text(
                'Machine Washable Shoes: Any style with the "Machine Washable" icon shown on the product box can be safely machine washed on the gentle cycle and air-dried; we suggest placing them in a pillowcase or laundry bag before washing in machine. Please wash shoes one at a time to avoid discoloration. Do not place shoes in dryer. For shoes with Skechers Memory Foam™ insoles, allow shoes and insoles to air dry for 10 to 12 hours to ensure the insoles are fully dry. Apply a protectant such as Skechers Water Proofer Spray to protect the shoes from water and stains.\n\n'
                    'Shoes Not Marked as Machine Washable: To maintain the quality of your purchase of our shoes, we do not recommend machine washing. We suggest the following steps for any minor cleaning to our shoes:\n\n'
                    'Remove excess dirt from the upper and outsole by using a small brush or towel.\n\n'
                    'Create a soapy mixture by combining warm water and a small amount (a few drops) laundry detergent.\n\n'
                    'Dip the brush or cloth into the soapy mixture. Wipe down the affected area. Apply a small amount of clean, warm water with the brush or cloth and brush/wipe off the excess soap.\n\n'
                    'Allow shoes to air dry.\n\n'
                    'Leather Shoes: Apply a protectant such as Skechers Water Proofer Spray to protect the shoes from water and stains before wearing in wet conditions. Use a leather cleaning lotion or spray such as Skechers Athletic Cleanser to clean. Apply a leather lotion or oil periodically to keep the leather supple. Do not machine wash leather shoes.\n\n'
                    'Light-Up Shoes: Machine washing light-up shoes is not advised as it may damage the lights. Clean with mild soap, warm water, and a soft cloth.\n\n'
                    'Keeping Shoes Fresh: Apply a deodorizing spray such as Skechers Odor Eliminator Spray to keep shoes fresh and odor-free.',
                style: GoogleFonts.inter(),
              ),
              SizedBox(height: 10),
              Text(
                'I have a quality concern with my Skechers shoes, what can you do to help?',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0B2948),
                  ),
                ),
              ),
              Text(
                'At Shoestreet we want you to feel confident standing behind our products, and we understand that an important part of that is developing quality products that you would expect from our company.\n\n'
                    'If you have a quality concern with your recently purchased shoes they may be eligible for replacement having a manufacturing defect.\n\n'
                    'Typically, we suggest working with the original place of purchase towards a replacement or credit. Usually they are able to assist on the spot and send any defective items to our Quality Assurance Department.\n\n'
                    'If you purchased items from Shoestreet, it will only assist with the online team and not in branch.\n\n'
                    'If your item is eligible, please mail it to us for inspection at skechers@nashwagroup.com\n\n'
                    'PLEASE READ BEFORE CONTACTING:\n\n'
                    'Items considered excessively worn by quality assurance will not be eligible for replacement.\n\n'
                    'Only manufacturing defects would be entertained, no wear and tear would be considered eligible for exchange.\n\n'
                    'Purchase from other stores cannot be refunded unless purchased directly from Shoestreet.\n\n'
                    'For your protection, we advise that you ship your package via a traceable method. Shoestreet cannot be responsible for merchandise lost in transit.\n\n'
                    'Once received at our facility; it can take 5-7 business days to clear inspection which would be a total processing time of 2 weeks to receive a replacement.\n\n'
                    'Incomplete information provided with your item may delay the processing period.\n\n'
                    '**If for any reason the replacement is not approved, a member of our team will contact you.',
                style: GoogleFonts.inter(),
              ),
              SizedBox(height: 10),
              Text(
                'How long will it take to get my order?',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0B2948),
                  ),
                ),
              ),
              Text(
                'Shoestreet.pk orders are processed and shipped out from our warehouse within 2-3 business days. Orders placed on the weekend and select holidays begin processing on the next business day.',
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
