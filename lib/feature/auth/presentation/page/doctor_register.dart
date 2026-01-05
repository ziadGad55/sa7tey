import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sa7ty/core/constant/enum.dart';
import 'package:sa7ty/core/constant/specialization.dart';
import 'package:sa7ty/core/utils/colors.dart';
import 'package:sa7ty/core/utils/fonts.dart';
import 'package:sa7ty/core/widget/custombuttons.dart';
import 'package:sa7ty/core/widget/my_field.dart';

class DoctorRegister extends StatefulWidget {
  const DoctorRegister({super.key});

  @override
  State<DoctorRegister> createState() => _DoctorRegisterState();
}

class _DoctorRegisterState extends State<DoctorRegister> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String thespecialization = specialization[0];
  TextEditingController informationcontroller = TextEditingController();
  TextEditingController Addresscontroller = TextEditingController();
  TextEditingController starttimecontroller = TextEditingController();
  TextEditingController endtimecontroller = TextEditingController();
  TextEditingController phone1controller = TextEditingController();
  TextEditingController phone2controller = TextEditingController();
  String? path;
  @override
  Widget build(BuildContext context) {
    starttimecontroller.text = TimeOfDay.now().format(context);
    endtimecontroller.text = TimeOfDay.now().format(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Appcolors.primary,
          centerTitle: true,
          title: Text(
            ' اكمال بيانات الطبيب',
            style: gettilestyle(color: Appcolors.white, size: 22),
          ),
        ),
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          uplodimage();
                        },
                        child:
                            Stack(alignment: Alignment.bottomRight, children: [
                          CircleAvatar(
                            backgroundColor: Appcolors.white,
                            backgroundImage: path != null
                                ? FileImage(File(path!))
                                : AssetImage("assets/images/user 1.png"),
                            radius: 60,
                          ),
                          CircleAvatar(
                              radius: 15,
                              backgroundColor: Appcolors.white,
                              child: Icon(
                                Icons.camera_alt,
                                color: Appcolors.primary,
                              ))
                        ]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'التخصص',
                    style: getmediamstyle(weight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Appcolors.secondary,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: DropdownButton(
                      icon: Icon(Icons.expand_circle_down_outlined),
                      isExpanded: true,
                      iconEnabledColor: Appcolors.primary,
                      value: thespecialization,
                      onChanged: (String? newValue) {
                        setState(
                          () {
                            thespecialization = newValue ?? specialization[0];
                          },
                        );
                      },
                      items: specialization.map((element) {
                        return DropdownMenuItem(
                            value: element, child: Text(element));
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "نبذة تعريفية",
                    style: getmediamstyle(weight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  my_field(
                    hintText:
                        'سجل المعلومات الطبية العامة مثل تعليمك الأكاديمي و خبراتك السابقة',
                    oneline: false,
                    controller: informationcontroller,
                    type: fieldtype.inf,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'عنوان العيادة',
                    style: getmediamstyle(weight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  my_field(
                    hintText: 'العنوان',
                    controller: Addresscontroller,
                    type: fieldtype.add,
                    keyboardType: TextInputType.streetAddress,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '   ساعات العمل من',
                              style: getmediamstyle(weight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: starttimecontroller,
                              onTap: () async {
                                var picktime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now());
                                if (picktime != null) {
                                  starttimecontroller.text =
                                      picktime.format(context);
                                }
                              },
                              decoration: InputDecoration(
                                  suffixIcon: Icon(
                                Icons.access_time_sharp,
                                color: Appcolors.primary,
                              )),
                              readOnly: true,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '   الي',
                              style: getmediamstyle(weight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: endtimecontroller,
                              onTap: () async {
                                var picktime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now());
                                if (picktime != null) {
                                  endtimecontroller.text =
                                      picktime.format(context);
                                }
                              },
                              decoration: InputDecoration(
                                  suffixIcon: Icon(
                                Icons.access_time_sharp,
                                color: Appcolors.primary,
                              )),
                              readOnly: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'رقم الهاتف 1',
                    style: getmediamstyle(weight: FontWeight.bold),
                  ),
                  my_field(
                    hintText: '20xxxxxxxxxx+',
                    controller: phone1controller,
                    type: fieldtype.pho,
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'رقم الهاتف 2  ( اختياري )',
                    style: getmediamstyle(weight: FontWeight.bold),
                  ),
                  my_field(
                    hintText: '20xxxxxxxxxx+',
                    controller: phone2controller,
                    type: fieldtype.pho,
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  custombuttons(
                    onPressed: () {
                      
                    },
                    text: 'التسجيل',
                    width: double.infinity,
                    height: 55,
                    curve: 10,
                    textstyle: gettilestyle(color: Appcolors.white),
                  )
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }

  uplodimage() async {
    XFile? pickImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickImage != null) {
      setState(() {
        path = pickImage.path;
      });
    }
  }
}
