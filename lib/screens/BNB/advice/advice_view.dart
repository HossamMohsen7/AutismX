
import 'package:autismx/screens/BNB/advice/social.dart';
import 'package:autismx/screens/surveys/configs/colors.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:flutter/material.dart';

import '../../age/age_view.dart';

class Advices extends StatefulWidget {
  const Advices({Key key}) : super(key: key);

  @override
  State<Advices> createState() => _AdvicesState();
}

class _AdvicesState extends State<Advices> {

  GlobalKey<ScaffoldState> Scaffoldkey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    
    Widget _Advice(int index) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        width: MediaQuery.of(context).size.width - 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(3, 3),
                  spreadRadius: 1,
                  blurRadius: 10,
                  color: Colors.grey)
            ]),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width - 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image:
                    DecorationImage(image: AssetImage("assets/images/Six.png",))),
          ),
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(
              "involve him in group and charitable activities",
              textAlign: TextAlign.center,
              style: TextStyle(
                  overflow: TextOverflow.clip,
                  fontSize: 17,
                  color: ColorManager.greyFont),
            ),
          )
        ]),
      );
    }

    return Scaffold(
      key: Scaffoldkey,
      body: SafeArea(
        child: Column(children: [
          CustomAppBar(context: context, scaffoldkey: Scaffoldkey),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Symptoms",
              style: TextStyle(
                  fontSize: 22,
                  color: ColorManager.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(3, 3),
                        spreadRadius: 1,
                        blurRadius: 10,
                        color: Colors.grey)
                  ],
                ),
                child: Column(children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>Age()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.16,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/Detailed.png"))),
                    ),
                  ),
                  const Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      "Detailed",
                      style:
                          TextStyle(color: ColorManager.greyFont, fontSize: 20),
                    ),
                  )),
                ]),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(3, 3),
                        spreadRadius: 1,
                        blurRadius: 10,
                        color: Colors.grey)
                  ],
                ),
                child: Column(children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>Social()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.16,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/social.png"),),),
                    ),
                  ),
                  const Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      "Social",
                      style:
                          TextStyle(color: ColorManager.greyFont, fontSize: 20),
                    ),
                  )),
                ]),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25),
            child: Text('Some advices will help you',
              style: TextStyle(
                  fontSize: 22,
                  color: ColorManager.blue,
                  fontWeight: FontWeight.bold),),
          ),
          Expanded(
            child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return _Advice(index);
                      },
                   
                    
                  
                ),
          ),
        ]),
      ),
      endDrawer: myDrawer(context, () {}, () {}, () {}, () {}, () {}, () {}),
    );
  }
}
