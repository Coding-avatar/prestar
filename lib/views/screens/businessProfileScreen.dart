import 'package:flutter/material.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

class BusinessProfileScreen extends StatefulWidget {
  const BusinessProfileScreen({Key? key}) : super(key: key);

  @override
  _BusinessProfileScreenState createState() => _BusinessProfileScreenState();
}

class _BusinessProfileScreenState extends State<BusinessProfileScreen> {
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
              initialValue: [], //to be used later to fetch or update choices
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
                        crossAxisCount: _gridCrossAxisCount()),
                    itemCount: _businessLogos.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(bottom: 10),
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        child: Image.network(_businessLogos[index]),
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

  int _gridCrossAxisCount() {
    if (_businessLogos.length == 1)
      return 1;
    else if (_businessLogos.length == 2)
      return 1;
    else
      return 4;
  }
}
