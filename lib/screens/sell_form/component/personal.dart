import 'package:first/components/custom_suffix_icon.dart';
import 'package:first/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../../../preference/pref_utils.dart';
import '../../../routes/app_route.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class personal extends StatefulWidget {
  const personal({super.key});

  @override
  State<personal> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<personal> {
  String gender = 'male',
      dob = '',
      fName = '',
      lName = '',
      contact = '',
      email = '',
      userType = '',
      address = '',
      propertyname = '',
      propertytype = '',
      propertydescription = '',
      propertyaddress = '',
      area = '',
      bhk = '',
      propertyaddresslink = '',
      price ='',
      available = 'sell';

  File? imageFile;
  List<XFile> multiImageFiles = [];
  List<File> _images = [];
  ImagePicker imagePicker = ImagePicker();

  Future<void> pickImageFromGallery() async {
    final XFile? tempFile =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (tempFile != null) {
      var file = File(tempFile.path);

      setState(() {
        imageFile = file;
      });
    }
  }

  Future<void> pickMultiImageFromGallery() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();

    if (selectedImages != null ) {
      multiImageFiles!.addAll(selectedImages);
      setState(() {

      });
    }

  }

  List<String> selectedValues = [];
  List<String> options = [
    "Parking area",
    "Garden",
    "Temple",
    "Club house",
    "Spa",
    "Fitness area",
    "Party area",
    "Swimming pool",
    "Indoor game area",
  ];


  final _formKey = GlobalKey<FormState>();

  void updateGenderSelection(String selection) {
    setState(() {
      gender = selection;
    });
  }

  void updateavabilitySelection(String selected) {
    setState(() {
      available = selected;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            buildNameFormField(),
            SizedBox(
              height: 16,
            ),
            buildEmailFormField(),
            SizedBox(
              height: 16,
            ),
            buildContactFormField(),
            SizedBox(
              height: 16,
            ),
            buildGenderSelectionWidget(),
            SizedBox(
              height: 16,
            ),
            buildUserTypeFormField(),
            SizedBox(
              height: 16,
            ),
            buildAddressFormField(),
            SizedBox(
              height: 8,
            ),
            const Text(
              "Enter Details About Property",
              style: TextStyle(fontSize: 20,
                  letterSpacing: 1,
                  decoration: TextDecoration.underline),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16,
            ),
            buildpropertyname(),
            SizedBox(
              height: 16,
            ),
            buildpropertytype(),
            SizedBox(
              height: 16,
            ),
            Text("Select Image Of Property", style: TextStyle(fontSize: 18)),
            SizedBox(
              height: 16,
            ),
            buildpropertyimageField(),
            SizedBox(
              height: 16,
            ),
            Text("Select Multiple Image Of Property",
                style: TextStyle(fontSize: 18)),
            SizedBox(
              height: 16,
            ),
            buildmultipleimageField(),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 16,
            ),
            builddescription(),
            SizedBox(
              height: 16,
            ),
            buildpropertyaddress(),
            SizedBox(
              height: 16,
            ),
            buildpropertyarealink(),
            SizedBox(
              height: 16,
            ),
            buildpropertyarea(),
            SizedBox(
              height: 16,
            ),
            buildpropertybhk(),
            SizedBox(
              height: 16,
            ),
            buildpropertyprice(),
            SizedBox(
              height: 16,
            ),
            buildpropertyavability(),
            SizedBox(
              height: 16,
            ),
            buildpropertyextrafeaturebutton(),
            SizedBox(
              height: 16,
            ),
            buildSignUpButtonWidget(),
          ],
        ),
      ),
    );
  }

  buildNameFormField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'First Name';
              } else {
                return null;
              }
            },
            onSaved: (newValue) {
              fName = newValue.toString();
            },
            decoration: InputDecoration(
              labelText: "First Name",
              hintText: 'First Name',
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Last Name';
              } else {
                return null;
              }
            },
            onSaved: (newValue) {
              lName = newValue.toString();
            },
            decoration: InputDecoration(
              labelText: "Last Name",
              hintText: 'Last Name',
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
          ),
        )
      ],
    );
  }

  buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || !Utils.isValidEmail(value)) {
          return 'Enter valid email address';
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        email = newValue.toString();
      },
      decoration: InputDecoration(
          labelText: "Email",
          hintText: 'Email address',
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: CustomSuffixIcon('assets/icons/Mail.svg')),
    );
  }

  buildContactFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: (value) {
        if (value == null || !Utils.isValidContact(value)) {
          return 'Enter valid contact';
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        contact = newValue.toString();
      },
      decoration: InputDecoration(
        labelText: "Contact",
        hintText: 'Contact',
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: CustomSuffixIcon('assets/icons/Call.svg'),
      ),
    );
  }

  buildGenderSelectionWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          Text('Gender'),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 'male',
                  groupValue: gender,
                  onChanged: (value) {
                    updateGenderSelection(value.toString());
                  },
                ),
                Text('Male'),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 'female',
                  groupValue: gender,
                  onChanged: (value) {
                    updateGenderSelection(value.toString());
                  },
                ),
                Text('female'),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 'other',
                  groupValue: gender,
                  onChanged: (value) {
                    updateGenderSelection(value.toString());
                  },
                ),
                Text('Others'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildUserTypeFormField() {
    return DropdownButtonFormField(
      iconEnabledColor: Colors.black45,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Select user type';
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        userType = newValue.toString();
      },
      decoration: InputDecoration(
          labelText: "User Type",
          hintText: 'Select User Type',
          floatingLabelBehavior: FloatingLabelBehavior.auto),
      items: [
        DropdownMenuItem(
          value: 'Owner',
          child: Text('Owner'),
        ),
        DropdownMenuItem(
          value: 'Broker',
          child: Text('Broker'),
        )
      ],
      onChanged: (value) {
        print(value);
      },
    );
  }

  buildAddressFormField() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: 3,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter address';
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        address = newValue.toString();
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: 'Address',
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }


  buildSignUpButtonWidget() {
    return MaterialButton(
      color: Colors.green,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      onPressed: () {
        // Validate returns true if the form is valid, or false otherwise.
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          print('''
            first name : $fName
            last name : $lName
            email : $email
            contact : $contact
            user type : $userType
            gender : $gender
            address : $address
            propertyname : $propertyname
            propertytype : $propertytype
            propertydescription : $propertydescription
            propertyaddress : $propertyaddress
            area : $area
            bhk : $bhk
            avability : $available
            selecteditem : $selectedValues
            addresslink : $propertyaddresslink
            price : $price
            ''');

          // store this data to database or server
          PrefUtils.updateLoginStatus(true).then((value) {
            if (value) {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoute.sellScreen, (route) => false);
            }
          });
        }
      },
      child: Text(
        'Submit',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  buildpropertyname() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'property Name';
              } else {
                return null;
              }
            },
            onSaved: (newValue) {
              propertyname = newValue.toString();
            },
            decoration: InputDecoration(
              labelText: "Property Name",
              hintText: 'Enter Property Name',
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
          ),
        ),

      ],
    );
  }

  buildpropertytype() {
    return DropdownButtonFormField(
      iconEnabledColor: Colors.black45,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Select property type';
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        propertytype = newValue.toString();
      },
      decoration: InputDecoration(
          labelText: "Property Type",
          hintText: 'Select Property Type',
          floatingLabelBehavior: FloatingLabelBehavior.auto),
      items: [
        DropdownMenuItem(
          value: 'Apartment',
          child: Text('Apartment'),
        ),
        DropdownMenuItem(
          value: 'Tenament',
          child: Text('Tenament'),
        ),
        DropdownMenuItem(
          value: 'Bungalow',
          child: Text('Bungalow'),
        ),
        DropdownMenuItem(
          value: 'Villa',
          child: Text('Villa'),
        ),
        DropdownMenuItem(
          value: 'Commercial office',
          child: Text('Commercial office'),
        ),
        DropdownMenuItem(
          value: 'Shop',
          child: Text('Shop'),
        ),
        DropdownMenuItem(
          value: 'Land',
          child: Text('Land'),
        ),
        DropdownMenuItem(
          value: 'Showroom',
          child: Text('Showroom'),
        ),
        DropdownMenuItem(
          value: 'Mainson',
          child: Text('Mainson'),
        ),
      ],
      onChanged: (value) {
        print(value);
      },
    );
  }

  builddescription() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: 3,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'property description';
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        propertydescription = newValue.toString();
      },
      decoration: InputDecoration(
        labelText: "Property Description",
        hintText: 'Enter Description Name',
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  buildpropertyaddress() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: TextFormField(
            maxLines: 3,
            keyboardType: TextInputType.multiline,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'property address';
              } else {
                return null;
              }
            },
            onSaved: (newValue) {
              propertyaddress = newValue.toString();
            },
            decoration: InputDecoration(
              labelText: "Property Address",
              hintText: 'Enter Address Name',
              alignLabelWithHint: true,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
          ),
        ),

      ],
    );
  }

  buildpropertyarea() {
    return TextFormField(
      keyboardType: TextInputType.text,
      // inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
      validator: (value) {
        if (value == null || !Utils.isValidarea(value)) {
          return 'Enter Property Area';
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        area = newValue.toString();
      },
      decoration: InputDecoration(
        labelText: "Area",
        hintText: 'Enter Area',
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: CustomSuffixIcon('assets/icons/Call.svg'),
      ),
    );
  }

  buildpropertybhk() {
    return DropdownButtonFormField(
      iconEnabledColor: Colors.black45,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Select BHK';
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        bhk = newValue.toString();
      },
      decoration: InputDecoration(
          labelText: "BHK",
          hintText: 'Select BHK',
          floatingLabelBehavior: FloatingLabelBehavior.auto),
      items: [
        DropdownMenuItem(
          value: '0',
          child: Text('0'),
        ),
        DropdownMenuItem(
          value: '1',
          child: Text('1'),
        ),
        DropdownMenuItem(
          value: '2',
          child: Text('2'),
        ),
        DropdownMenuItem(
          value: '3',
          child: Text('3'),
        ), DropdownMenuItem(
          value: '4',
          child: Text('4'),
        ),
        DropdownMenuItem(
          value: 'more than 5',
          child: Text('more than 5'),
        )
      ],
      onChanged: (value) {
        print(value);
      },
    );
  }

  buildpropertyavability() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          Text('Property For'),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 'sell',
                  groupValue: available,
                  onChanged: (value) {
                    updateavabilitySelection(value.toString());
                  },
                ),
                Text('Sell'),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 'rent',
                  groupValue: available,
                  onChanged: (value) {
                    updateavabilitySelection(value.toString());
                  },
                ),
                Text('Rent'),
              ],
            ),
          ),
        ],
      ),
    );
  }


  void _onButtonPressed() async {
    List<String>? result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text('Select Options'),
              content: Column(
                children: options.map((String option) {
                  return CheckboxListTile(
                    title: Text(option),
                    value: selectedValues.contains(option),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value != null) {
                          if (value) {
                            selectedValues.add(option);
                          } else {
                            selectedValues.remove(option);
                          }
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Close the dialog and return the selected values
                    Navigator.of(context).pop(selectedValues);
                  },
                  child: Text('Submit'),
                ),
              ],
            );
          },
        );
      },
    );

    // Handle the selected values returned from the dialog
    if (result != null) {
      setState(() {
        selectedValues = result;
      });
    }
  }

  buildpropertyextrafeaturebutton() {
    return Column(
      children: [
        ElevatedButton(
            onPressed: _onButtonPressed, child: Text('Select Extra Feature')),
        Divider(height: 30,),
        Wrap(children: selectedValues.map((e) => Chip(label: Text(e))
        ).toList(),
        )

      ],
    );
  }

  buildpropertyimageField() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            pickImageFromGallery();
          },
          child: CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(.30),
            radius: 60,
            backgroundImage: imageFile != null
                ? FileImage(imageFile!)
                : AssetImage('assets/images/user.png') as ImageProvider,
          ),
        )
      ],
    );
  }

  buildmultipleimageField() {
    return Column(
      children: [
       ElevatedButton(onPressed: pickMultiImageFromGallery, child: Text('add')),
    SizedBox(height: 8,),
        GridView.builder(scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.all(8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: multiImageFiles.length,
            itemBuilder: (BuildContext context,int index) {
              return Image.file(File(multiImageFiles![index].path),fit: BoxFit.cover,);
            }
        ),
      ],
    );
  }

  buildpropertyarealink() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.url,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'property address link';
              } else {
                return null;
              }
            },
            onSaved: (newValue) {
              propertyaddresslink = newValue.toString();
            },
            decoration: InputDecoration(
              labelText: "Property Address link",
              hintText: 'Enter Address link',
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
          ),
        ),

      ],
    );
  }

  buildpropertyprice() {
    return TextFormField(
      keyboardType: TextInputType.number,
      // inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
      validator: (value) {
        if (value == null || !Utils.isValidarea(value)) {
          return 'Enter Property price';
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        price = newValue.toString();
      },
      decoration: InputDecoration(
        labelText: "Price",
        hintText: 'Enter Price',
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: CustomSuffixIcon('assets/icons/Call.svg'),
      ),
    );
  }

}

