import 'package:autismx/screens/profile/profile_view.dart';
import 'package:autismx/screens/surveys/configs/colors.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';



import 'package:smooth_star_rating/smooth_star_rating.dart';

class CenterLayout extends StatefulWidget {
  @override
  State<CenterLayout> createState() => _CenterLayoutState();
}

var searchController = TextEditingController();

class _CenterLayoutState extends State<CenterLayout> {
  PageController pc;
  final List<String> _images = [
    "assets/images/center 1.png",
    "assets/images/center 2.png",
    "assets/images/center3.png",
  ];
    GlobalKey<ScaffoldState> Scaffoldkey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    key: Scaffoldkey,
      body: Column(
        children: [
          SafeArea(child: fullAppbar(context: context,scaffoldkey: Scaffoldkey)),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: defaultFormField(
              controller: searchController,
              type: TextInputType.text,
              validate: (String value) {
                if (value.isEmpty) {
                  return 'search must not be empty';
                }
                return null;
              },
              label: 'Search',
              prefix: Icons.search,
            ),
          ),
          // i did the search bar the ugly way
          // still we will modify it as we will make it actual search when we add the list of centers from API
      Expanded(child: SingleChildScrollView(
        child: Column(
          children: [
            
          // here is the main container that will bd duplicated many times as the API tell us how many
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width / 1.5,
              color: Colors.black12,
              child: Column(
                children: [
                  SizedBox(
                    height:  MediaQuery.of(context).size.height * 0.43,
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Stack(
                      children: [
                        Container(
                            
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: Image.asset(
                              "assets/images/centerbg.png",
                              fit: BoxFit.fill,
                            )),
                        CarouselSlider.builder(
                          itemCount: _images.length,
                          options: CarouselOptions(
                              initialPage: 0,
                              autoPlay: true,
                              height:
                                  MediaQuery.of(context).size.height * 0.35),
                          itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                               
                                borderRadius: BorderRadius.circular(15)),
                            height: MediaQuery.of(context).size.height * 0.35,
             
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    child: Image.asset(
                                      _images[index],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            width: 50,
                            height: 70,
                            bottom: 0,
                            left: 50,
                            child: Image.asset("assets/images/c1.png")),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Autismo',
                    style: TextStyle(
                        color: ColorManager.blueFont,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //the information i leave it that way so when we apply the API we will know each one
                  const Text(
                    'Location',
                    style: TextStyle(
                        color: ColorManager.blueFont,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Mobile Phone',
                    style: TextStyle(
                        color: ColorManager.blueFont,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // the rating when we apply the stateManagement we will use we will save it in Share preference
                  SmoothStarRating(
                    rating: 0,
                    isReadOnly: false,
                    size: 30,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    starCount: 5,
                    allowHalfRating: true,
                    spacing: 2.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
          
        ),
      ),
        ],
      ),
       endDrawer: myDrawer(context, () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreen(),
            ),
          );
        }, () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CenterLayout(),
            ),
          );
        }, () {}, () {}, () {}, () {}),
    );
  }
}