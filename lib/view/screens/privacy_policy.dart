import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyDialog extends StatefulWidget {
  @override
  _PrivacyPolicyDialogState createState() => _PrivacyPolicyDialogState();
}

class _PrivacyPolicyDialogState extends State<PrivacyPolicyDialog> with SingleTickerProviderStateMixin {
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
                'Privacy Policy',
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
                'We Respect The Privacy Rights Of Our Online Visitors And Recognize The Importance Of Protecting Your Personal Information. We Have Adopted A Corporate Wide Privacy Policy That Guides How We Collect, Store, And Use The Information That You Provide Us With. The Following Information Is Provided By ShoeStreet To Enable Our Online Visitors To Be Fully Informed Of Our Privacy Policies by www.shoestreet.pk, You Are Accepting And Consenting To The Practices Described In This Privacy Policy And The Terms And Conditions.',
                style: GoogleFonts.inter(),
              ),
              SizedBox(height: 10),
              Text(
                'WHAT PERSONAL INFORMATION DO WE COLLECT FROM YOU AND HOW?',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0B2948),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'ShoeStreet Collects Personal Information In Several Ways When You Place An Order Or Register For A Service Offered By ShoeStreet. By Registering, You Are Consenting To The Collection Of Your Personal Data. If An Order Is Placed With Us, We Need To Hold Personal Information Including Your Name, Email Address, Phone Numbers, Home Address, Shipping And Credit/Debit Card Billing Address (Es) So That We Can Process And Fulfill Your Order. Saved Card Details Will Never Be Shared With Third Parties And Will Only Be Used To Process Your Order, Using Our Payment Service Provider’s Systems.',
                style: GoogleFonts.inter(),
              ),
              SizedBox(height: 10),
              Text(
                'HOW THIS INFORMATION MAY BE USED, INCLUDING ANYONE IT MIGHT BE SHARED WITH?',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0B2948),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'ShoeStreet May Use Your Personal Information For The Processing Of Orders, Payments, And To Provide You With A Personalized Shopping Experience. We Will Also Use Your Details To Fulfill And Deliver Your Orders And Manage Your Account. Personal Information That You Provide May Be Disclosed To A Credit Reference Or Fraud Prevention Agency, Which May Keep A Record Of That Information. We May Also Use Your Personal Information To Send You Marketing Updates But Only Ever In Accordance With Your Preferences (As Detailed In The Next Section). We Do Not Sell Your Details To Third Party Marketing Companies. We Do Collate Information About Site Traffic, Sales, Wish List, And Other Commercial Information Which We May Pass On To Third Parties But This Information Does Not Include Any Information Which Can Identify You Personally. Finally, We May Use Your Personal Information For Our Internal Marketing And Demographic Studies, Together With Non-Personal Data To Monitor Customer Patterns So We Can Consistently Improve Our Site Design To Better Meet Our Visitors’ Needs.',
                style: GoogleFonts.inter(),
              ),
              SizedBox(height: 10),
              Text(
                'MARKETING OPT-IN AND OPT-OUT PROVISION',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0B2948),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'When You Register, You Will Be Given The Option To Opt-Out Of Subscribing To Our Regular Update Service Which We Will Send You:\n\n'
                    'Email Alerts For New Products, Features, Enhancements, Special Offers, Upgrade Opportunities, Contests, Events Of Interest, And One-Off Marketing Promotions.\n\n'
                    'Direct Mail Alerts For New Products, Features, Enhancements, Special Offers, Upgrade Opportunities, Contests, Events Of Interest, And One-Off Marketing Promotions. We Do Not Sell Or Otherwise Pass Your Details To Third Parties For Marketing Purposes. Marketing Communications At All Times, '
                    'We Will Offer You The Opportunity To Unsubscribe Out Of Any Service Or Update To Which You Have Subscribed, If You Change Your Mind. Any E-Mail We Send You Will Contain An Easy Automated Unsubscribe Link So That You Can Opt-Out Of That Particular Mail Shot. Simply Follow The Indications In The E-Mail. Alternatively You Can Change Your Email Preferences Or Opt Out Of All Emails By Logging Into My Account. To Opt Out Of Direct Mail Service Or Updates, Please Contact ShoeStreet Customer Care Representative On 0346 484 0000 Or By Email At skechers@nashwagroup.com',
                style: GoogleFonts.inter(),
              ),
              SizedBox(height: 10),
              Text(
                'HOW YOU CAN ACCESS AND, IF NECESSARY, CHANGE THE PERSONAL INFORMATION MAINTAINS',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0B2948),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'If For Any Reason You Are Concerned That The Personal Information Held By ShoeStreet Is Not Correct, Please Visit The Website And After Logging Into The Site Using The “Sign In” Menu On The Home Page, Your Personal Information Will Be Made Available For Review And Change In The “My Account” Section. Only You Or, Upon Your Request, The Customer Care Department, May Access Your Personal Data From The Website Using Your Password And User ID. Information May Be Changed Online Within Account Details, Address Book, And My Email Preferences. You Can Change Or Delete Saved Credit/Debit Card Details Each Time You Make A Purchase. You Will Also Be Able To Delete Saved Credit/Debit Card Details By Adding Or Editing A Shipping/Billing Address. If You Change Your Billing Or Shipping Address While Your Order Is Still Being Processed, The Order Will Be Re-Processed Through Security Validation Checks. If You Prefer, You May Contact Us By Email At skechers@nashwagroup.com  And We Will Amend Your Personal Details.',
                style: GoogleFonts.inter(),
              ),
              SizedBox(height: 10),
              Text(
                'SAFEGUARDING YOUR PERSONALLY IDENTIFIABLE INFORMATION',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0B2948),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'We Will Take Reasonable Steps To Maintain Appropriate Safeguards To Ensure The Security, Integrity And Privacy Of The Information You Have Provided Us With. When You Place An Order Or Access Your Account Information, We Use A Secure Socket Layer (SSL) Encryption Which Encrypts Your Information Before It Is Sent To Us, To Protect It From Unauthorized Use. In Addition, We Will Take Reasonable Steps To Ensure That Third Party Business Partners’ To Whom We Transfer Any Data Will Provide Sufficient Protection Of That Personal Information.',
                style: GoogleFonts.inter(),
              ),
              SizedBox(height: 10),
              Text(
                'WHERE AND HOW TO ASK QUESTIONS OR FILE COMPLAINTS',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0B2948),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'If You Require Further Information About Our Privacy Policy, Please Go To The Help Section Of The Web Site Where FAQ’s Are Answered. If You Require More Information Please Go To The Contact Us Section Of The Web Site And Send An Email To The Relevant ShoeStreet Department.',
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