import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:maulik/main.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(top: 22, left: 10, right: 10, bottom: 20),
                child: Center(
                  child: Text(
                    'Choose a language\n you want to learn',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff323232),
                    ),
                  ),
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: learningLanguages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                        tileColor: primaryColor,
                        shape: index == 0
                            ? const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              )
                            : RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                        // leading: const Icon(Icons.list),
                        trailing: SvgPicture.asset('assets/icons/arrow.svg'),
                        title: Text(
                          learningLanguages[index],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Divider(
                        height: 1,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const List<String> learningLanguages = [
  'चेपाङ',
  'थारु',
  'बोटे दराइ',
  'मगर',
  'गुरुङ',
  'कुसुन्डा',
  'राउटे',
  'नेपाल भाषा',
  'माझि',
  'कुरुक्स',
];
