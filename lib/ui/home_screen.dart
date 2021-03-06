import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

import 'package:repointment/data/client.dart';
import 'package:repointment/utils/create_material_color.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomeView> {
  final Client _client = Client(
    email: faker.internet.freeEmail(),
    name: "${faker.person.firstName()} ${faker.person.firstName()}",
    cell: faker.phoneNumber.toString(),
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    MaterialColor searchbg =
        createMaterialColor(const Color.fromARGB(255, 245, 245, 244));

    // Todo: Replace later with data from DB
    List<Widget> children = List.generate(
      5,
      (index) {
        return SizedBox(
          width: 300,
          height: 200,
          child: Card(
            elevation: 3,
            color: Colors.orangeAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: Colors.grey.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Center(
              child: Text(
                faker.job.title(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  leadingDistribution: TextLeadingDistribution.even,
                ),
              ),
            ),
          ),
        );
      },
    );

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        actions: [
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(right: 10.0),
              child: const Icon(
                Icons.notifications_rounded,
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(right: 14),
              width: 36.0,
              height: 36.0,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 12.0,
                child: ClipRRect(
                  child: Image.asset(
                      "assets/images/profile-orange.png"), // Todo: Replace with fetched image
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20),
              child: Text(
                'Hi ${_client.name}',
                style: const TextStyle(
                  fontSize: 25,
                  color: Color(0xff363636),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, left: 20),
              child: const Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xff363636),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25, left: 20, right: 20),
              decoration: BoxDecoration(
                  color: searchbg,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                        // ignore: use_full_hex_values_for_flutter_colors
                        color: Color(0x140000000),
                        offset: Offset(0, 10),
                        blurRadius: 15,
                        spreadRadius: 0)
                  ]),
              height: 60,
              width: size.width,
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: const TextField(
                        maxLines: 1,
                        autofocus: false,
                        style: TextStyle(
                          color: Color(0xff107163),
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Search"),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: const Text(
                "Jobs Done",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                margin: const EdgeInsets.all(4.0),
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: CardCarousel(children: children)),
          ],
        ),
      ),
    );
  }
}

class CardCarousel extends StatefulWidget {
  const CardCarousel({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  State<CardCarousel> createState() => _CardCarouselState();
}

class _CardCarouselState extends State<CardCarousel> {
  late PageController _pageController;
  var activePage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: widget.children.length,
        pageSnapping: true,
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            activePage = page;
          });
        },
        itemBuilder: (context, pagePosition) {
          return Container(
            margin: const EdgeInsets.all(10),
            child: widget.children[pagePosition],
          );
        });
  }
}
