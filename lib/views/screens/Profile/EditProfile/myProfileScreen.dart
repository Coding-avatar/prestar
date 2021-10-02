import 'package:flutter/material.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  TextEditingController _textFieldController = new TextEditingController();
  late String userName;
  late String userBio;
  late DateTime userDob;
  late String dateOfBirth;
  late String userLocation;
  List userPreferences = List.empty(growable: true);
  List<String> topics = [
    'Comedy',
    'Drama',
    'Romance',
    'Thriller',
    'Action',
    'LifeStyle'
  ];
  String dropdownValue = '';

  @override
  void initState() {
    super.initState();
    updateProfileDetails();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: screenWidth,
        height: screenHeight,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              CircleAvatar(
                radius: 75,
                backgroundImage: AssetImage("assets/images/profile2.jpg"),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Name',
                  style: TextStyle(color: Colors.black38, fontSize: 14),
                ),
                width: double.infinity,
              ),
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          userName,
                          style: TextStyle(color: Colors.black87, fontSize: 18),
                        ),
                        InkWell(
                          child: Icon(Icons.edit),
                          onTap: () => updateUserName(),
                        )
                      ],
                    ),
                    Divider()
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Date of Birth',
                  style: TextStyle(color: Colors.black38, fontSize: 14),
                ),
                width: double.infinity,
              ),
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          dateOfBirth,
                          style: TextStyle(color: Colors.black87, fontSize: 18),
                        ),
                        InkWell(
                          child: Icon(Icons.edit),
                          onTap: () => updateUserDateOfBirth(),
                        )
                      ],
                    ),
                    Divider()
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Location',
                  style: TextStyle(color: Colors.black38, fontSize: 14),
                ),
                width: double.infinity,
              ),
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          userLocation,
                          style: TextStyle(color: Colors.black87, fontSize: 18),
                        ),
                        InkWell(
                          child: Icon(Icons.edit),
                          onTap: () => updateUserLocation(),
                        )
                      ],
                    ),
                    Divider()
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Bio',
                  style: TextStyle(color: Colors.black38, fontSize: 14),
                ),
                width: double.infinity,
              ),
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          userBio,
                          softWrap: true,
                          style: TextStyle(color: Colors.black87, fontSize: 18),
                        ),
                        InkWell(
                          child: Icon(Icons.edit),
                          onTap: () => updateUserBio(),
                        )
                      ],
                    ),
                    Divider()
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Preferences',
                  style: TextStyle(color: Colors.black38, fontSize: 14),
                ),
                width: double.infinity,
              ),
              MultiSelectDialogField(
                items: topics.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                searchable: true,
                title: Text('Favorite Topics'),
                onConfirm: (values) {
                  userPreferences = values;
                },
                chipDisplay: MultiSelectChipDisplay(
                  onTap: (value) {
                    setState(() {
                      userPreferences.remove(value);
                    });
                  },
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: null,
                  child: Text('Save Changes'),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateProfileDetails() {
    setState(() {
      userName = "Rima Dutta";
      userBio = "I love myself!";
      userDob = DateTime(1997, 12, 22);
      dateOfBirth = "22/12/1997";
      userLocation = "Kolkata";
    });
  }

  updateUserName() {
    showDialog(
        context: context,
        builder: (context) {
          return new AlertDialog(
            title: Text("Edit "),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Update "),
                TextField(
                  controller: _textFieldController,
                )
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Okay"),
              )
            ],
          );
        });
  }

  updateUserBio() {
    showDialog(
        context: context,
        builder: (context) {
          return new AlertDialog(
            title: Text("Edit "),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Update "),
                TextField(
                  controller: _textFieldController,
                )
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Okay"),
              )
            ],
          );
        });
  }

  updateUserDateOfBirth() {
    ///show date picker
  }

  updateUserLocation() {
    ///show location picker
  }
}
