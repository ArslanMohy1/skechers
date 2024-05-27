import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skechers/model/profile_model.dart';
import 'package:skechers/view/utils/db_helper.dart';
import 'package:skechers/view/widgets/custom_botton.dart';
import 'dart:io';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    // Load profile data when the screen initializes
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final profile = await _dbHelper.getProfile();
    if (profile != null) {
      setState(() {
        _nameController.text = profile.name;
        _emailController.text = profile.email;
        _phoneController.text = profile.phoneNumber;
        _addressController.text = profile.address;
        _imageFile = profile.imagePath != null ? File(profile.imagePath!) : null;
      });
    }
  }

  Future<void> _pickImage() async {
    try {
      final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _imageFile = File(pickedFile.path);
        }
      });
    } catch (e) {
      print("Image picker error: $e");
    }
  }

  void _saveProfile(BuildContext context) async {
    final profile = ProfileModel(
      id: 1, // Assign an id if needed
      name: _nameController.text,
      email: _emailController.text,
      phoneNumber: _phoneController.text,
      address: _addressController.text,
      imagePath: _imageFile?.path,
    );

    // Check if profile with ID 1 already exists
    final existingProfile = await _dbHelper.getProfile();
    if (existingProfile != null) {
      // If profile exists, update it
      await _dbHelper.updateProfile(profile);
    } else {
      // If profile doesn't exist, insert it
      await _dbHelper.insertProfile(profile);
    }

    // Show a dialog box after saving
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Profile information updated successfully'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: Get.height*0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: (){
                  Get.back();
                }, icon: Icon(CupertinoIcons.back)),
                Text(
                  'Profile',
                  style: GoogleFonts.inter(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                ),

              ],
            ),

            Center(
              child: GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                    image: DecorationImage(
                      image: _imageFile != null
                          ? FileImage(_imageFile!)
                          : AssetImage('assets/Userimage.png') as ImageProvider,
                      fit: BoxFit.cover,
                    ),

                  ),
                  child: _imageFile == null ? Icon(Icons.camera_alt, color: Colors.white, size: 50) : null,
                ),
              ),
            ),
            SizedBox(height: 20),
            buildTextField('Name', _nameController),
            SizedBox(height: 10),
            buildTextField('Email', _emailController),
            SizedBox(height: 10),
            buildTextField('Phone Number', _phoneController),
            SizedBox(height: 10),
            buildTextField('Address', _addressController),
            SizedBox(height: Get.height * 0.1),
            CustomButton(onTap:(){
              _saveProfile(context);
            },title: 'Update information',),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(color: Colors.black),
    );
  }
}
