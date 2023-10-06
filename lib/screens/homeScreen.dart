// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maulik/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedValue = 'Population';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(top: 22, left: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        radius: 22,
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/notification.svg',
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Explore Language",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        DropdownButton<String>(
                          iconEnabledColor: primaryColor,
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          //    icon: SvgPicture.asset('assets/icons/dropdown.svg'),
                          value: _selectedValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedValue = newValue!;
                            });
                          },
                          //   TODO: map nagari euta euta garyera onchange parameter ma function pass garaunma milxa hai!

                          items: <String>['Population', 'Popularity']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            );
                          }).toList(),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 15.0,
                    children: List.generate(language.length, (index) {
                      return Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: language[index].culture_image),
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  language[index].title,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  'Total: ${language[index].title}+ Spekaers',
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                      color: const Color(0xffffd3d399).withOpacity(0.6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: Row(
                          children: [
                            Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: const Image(
                                  image: AssetImage(
                                    'assets/images/hotel.jpg',
                                  ),
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "50% Flat Discount",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 22),
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/location.svg'),
                                          const Text(
                                            'New baneshowr, KTM',
                                            style: TextStyle(
                                                color: Color(0xff6E6E6E),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0, left: 30),
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: Text('Book Now'),
                                        )),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}

class Languages {
  const Languages(
      {required this.title, required this.culture_image, required this.count});
  final String title;
  final ImageProvider culture_image;
  final String count;
}

const List<Languages> language = <Languages>[
  Languages(
      title: 'Newar',
      culture_image: AssetImage('assets/images/profile.png'),
      count: '200k'),
  Languages(
      title: 'Magar',
      culture_image: AssetImage('assets/images/profile.png'),
      count: '200k'),
  Languages(
      title: 'Gurung',
      culture_image: AssetImage('assets/images/profile.png'),
      count: '200k'),
  Languages(
      title: 'Rai',
      culture_image: AssetImage('assets/images/profile.png'),
      count: '200k'),
  Languages(
      title: 'Chepang',
      culture_image: AssetImage('assets/images/profile.png'),
      count: '200k'),
  Languages(
      title: 'Nepali',
      culture_image: AssetImage('assets/images/profile.png'),
      count: '200k'),
  Languages(
      title: 'Nepali',
      culture_image: AssetImage('assets/images/profile.png'),
      count: '200k'),
  Languages(
      title: 'Nepali',
      culture_image: AssetImage('assets/images/profile.png'),
      count: '200k'),
];
