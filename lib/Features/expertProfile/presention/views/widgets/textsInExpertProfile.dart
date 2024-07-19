import 'package:flutter/material.dart';
import 'package:servi_connect/constants.dart';
import 'package:sizer/sizer.dart';

class TextsInExpertProfile extends StatelessWidget {
  TextsInExpertProfile(
      {super.key,
      required this.exprience,
      required this.address,
      required this.email,
      required this.phone});
  final String exprience;
  final String address;
  final String email;
  final String phone;
  final List<String> services = ["medicine", "family", "other"];
  final TextStyle textsUnderLabelStyle =
      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400);
  final List items = [
    {
      'labelIcon': Icons.location_city_rounded,
      'labelText': 'Address',
    },
    {
      'labelIcon': Icons.email,
      'labelText': 'email',
    },
    {'labelIcon': Icons.phone, 'labelText': 'phone'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 2.h,
        ),
        label(Icons.info_outline, 'about'),
        Text('text text text text text text',
            style: TextStyle(
                color: Colors.black54,
                height: 1.2,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400)),
        SizedBox(
          height: 4.h,
        ),
        label(Icons.badge, 'services'),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 7.w),
          child: Column(
            children: List.generate(
              services.length,
              (index) => Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: 6.sp,
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    services[index],
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ),
        Column(
          children: List.generate(
              items.length,
              (index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      label(
                          items[index]['labelIcon'], items[index]['labelText']),
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 7.w),
                        child: Text(
                          index == 0
                              ? exprience
                              : index == 1
                                  ? address
                                  : index == 2
                                      ? email
                                      : phone,
                          style: textsUnderLabelStyle,
                        ),
                      ),
                    ],
                  )),
        ),
      ],
    );
  }

  Widget label(icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16.sp,
          color: kPrimaryColor,
        ),
        SizedBox(width: 2.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: kPrimaryColor,
          ),
        )
      ],
    );
  }
}
