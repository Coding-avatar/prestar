import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_storage/firebase_storage.dart';

class BusinessProfileScreen extends StatefulWidget {
  const BusinessProfileScreen({Key? key}) : super(key: key);

  @override
  _BusinessProfileScreenState createState() => _BusinessProfileScreenState();
}

class _BusinessProfileScreenState extends State<BusinessProfileScreen> {
  FirebaseStorage _storage = FirebaseStorage.instance;
  String _businessName = '';
  bool _isBusiness = false;
  List choices = [
    'School/University',
    'Tea Room/Coffee House',
    'Hotel/Resort',
    'Restaurant',
    'Caterer',
    'Corporate',
    'Dining',
    'Clubs',
    'E-Commerce'
  ];
  List _selectedChoices = List.empty(growable: true);
  List _businessCategories = List.empty(growable: true);
  List _businessLogos = List.empty(growable: true);
  File? _imageFile;
  final _picker = ImagePicker();
  @override
  void initState() {
    super.initState();
    _updateDetails();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              child: Text('Business Name'),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              // margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.fromBorderSide(
                  BorderSide(
                    color: Colors.indigo,
                    width: 2,
                  ),
                ),
              ),
              child: Text(_businessName),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              child: Text('Business Category/Categories'),
            ),
            MultiSelectDialogField(
              items: choices.map((e) => MultiSelectItem(e, e)).toList(),
              listType: MultiSelectListType.CHIP,
              searchable: true,
              title: Text('Business Category'),
              onConfirm: (values) {
                setState(() {
                  _selectedChoices = values;
                });
              },
              initialValue:
                  _businessCategories, //to be used later to fetch or update choices
              chipDisplay: MultiSelectChipDisplay(
                onTap: (value) {
                  setState(() {
                    _selectedChoices.remove(value);
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              child: Text('Business Logo/Logos'),
            ),
            _businessLogos.isEmpty
                ? Container()
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemCount: _businessLogos.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(bottom: 10),
                    itemBuilder: (context, index) {
                      if (index == 0)
                        return InkWell(
                          onTap: () async => _pickImageFromGallery(),
                          child: Card(
                            child: Image.asset(_businessLogos[index]),
                          ),
                        );
                      else
                        return Stack(
                          children: [
                            Card(
                              elevation: 5,
                              child: Image.network(_businessLogos[index]),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _businessLogos.remove(_businessLogos[index]);
                                });
                              },
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.delete_forever,
                                    size: 25,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                    }),
          ],
        ),
      ),
    );
  }

  void _updateDetails() {
    setState(() {
      _businessName = 'Prestar Pvt. Ltd';
      _businessCategories = ['Corporate', 'Clubs', 'E-Commerce'];
      _businessLogos = [
        'assets/images/uploadPhoto.png',
        'https://logo.clearbit.com/facebook.com',
        'https://logo.clearbit.com/google.com',
        'https://logo.clearbit.com/att.com',
        'https://logo.clearbit.com/apple.com',
        'https://logo.clearbit.com/amazon.com',
        'https://logo.clearbit.com/microsoft.com',
        'https://logo.clearbit.com/netflix.com',
        'https://logo.clearbit.com/youtube.com',
      ];
    });
  }

  Future<void> _pickImageFromGallery() async {
    var status = await Permission.camera.status;
    if (await Permission.camera.request().isGranted) {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() => this._imageFile = File(pickedFile.path));
        //TODO upload image to server
        var newLogo = await uploadPic(imagefile: _imageFile!);
        print('upload done');
        print(newLogo.toString());
        setState(() {
          _businessLogos.add(newLogo.toString());
        });
      }
    }
  }

  Future<String> uploadPic({required File imagefile}) async {
    //Create a reference to the location you want to upload to in firebase
    Reference ref = _storage.ref().child("abcd/");

    //Upload the file to firebase
    UploadTask uploadTask = ref.putFile(imagefile);

    // Waits till the file is uploaded then stores the download url
    String location = await uploadTask.snapshot.ref.getDownloadURL();

    //returns the download url
    print("download url received");
    print("location");
    return location;
  }
}
