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
  TextEditingController userNameFieldController = new TextEditingController();
  TextEditingController userBioFieldController = new TextEditingController();
  TextEditingController userDobFieldController = new TextEditingController();
  TextEditingController userLocationFieldController =
      new TextEditingController();
  String dropdownValue = '';

  // List<String> choices = ['Entertainment', 'Comedy', 'Action', 'one', 'tow'];
  // List _selectedChoices = List.empty(growable: true);
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
      body: Container(
        width: screenWidth,
        height: screenHeight,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            CircleAvatar(
              radius: 75,
              backgroundImage: AssetImage("assets/images/profile2.jpg"),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text('Name'),
              width: double.infinity,
            ),
            // TextField(
            //   controller: userNameFieldController,
            //   decoration: InputDecoration(
            //     hintText: 'Your Name',
            //     suffixIcon: IconButton(
            //       icon: Icon(Icons.edit),
            //       onPressed: null,
            //     ),
            //   ),
            //   enabled: false,
            // ),
            // Container(
            //   margin: EdgeInsets.only(top: 10),
            //   child: Text('Gender'),
            //   width: double.infinity,
            // ),
            // DropdownButton<String>(
            //   value: dropdownValue,
            //   icon: const Icon(Icons.arrow_downward),
            //   iconSize: 24, isExpanded: true, isDense: false,
            //   elevation: 16,
            //   style: const TextStyle(color: Colors.black87),
            //   // underline: Container(
            //   //   height: 2,
            //   //   color: Colors.deepPurpleAccent,
            //   // ),
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       dropdownValue = newValue!;
            //     });
            //   },
            //   items: <String>['Male', 'Female', 'Other']
            //       .map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Expanded(child: Text(value)),
            //     );
            //   }).toList(),
            // ),
            // Container(
            //   margin: EdgeInsets.only(top: 10),
            //   child: Text('Bio'),
            //   width: double.infinity,
            // ),
            // TextField(
            //   controller: userBioFieldController,
            //   decoration: InputDecoration(
            //     hintText: 'Bio',
            //     suffixIcon: IconButton(
            //       icon: Icon(Icons.edit),
            //       onPressed: null,
            //     ),
            //   ),
            //   maxLines: 2,
            //   enabled: false,
            //   maxLength: 120,
            // ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text('Date of Birth'),
              width: double.infinity,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: TextField(
                    controller: userDobFieldController,
                    decoration: InputDecoration(
                      hintText: 'Date of Birth',
                      hintStyle: TextStyle(),
                    ),
                    enabled: false,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => print('hello'),
                )
              ],
            ),
            // MultiSelectDialogField(
            //   items: choices.map((e) => MultiSelectItem(e, e)).toList(),
            //   listType: MultiSelectListType.CHIP,
            //   onConfirm: (values) {
            //     _selectedChoices = values;
            //   },
            // ),
            // MultiSelectChipDisplay(
            //   items:
            //       _selectedChoices.map((e) => MultiSelectItem(e, e)).toList(),
            //   onTap: (value) {
            //     setState(() {
            //       _selectedChoices.remove(value);
            //     });
            //   },
            // ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text('Location'),
              width: double.infinity,
            ),
            TextField(
              controller: userLocationFieldController,
              decoration: InputDecoration(
                label: Text('Location'),
                suffixIcon: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: null,
                ),
              ),
              enabled: false,
            ),
          ],
        ),
      ),
    );
  }

  void updateProfileDetails() {
    setState(() {
      userNameFieldController.text = "Rima Dutta";
      userBioFieldController.text =
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard";
      userLocationFieldController.text = "Kolkata";
      userDobFieldController.text = "22/12/1997";
      dropdownValue = 'Female';
    });
  }
}
