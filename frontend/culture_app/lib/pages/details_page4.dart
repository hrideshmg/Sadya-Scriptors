import 'package:culture_app/pages/quiz4.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:culture_app/custom/custom_icons.dart';
import 'package:flutter/widgets.dart';

class DetailsPage4 extends StatefulWidget {
  @override
  _DetailsPage4State createState() => _DetailsPage4State();
}

class _DetailsPage4State extends State<DetailsPage4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: InkWell(
        onDoubleTap: () {
          _showBottomSheet();
        },
        child: Stack(fit: StackFit.expand, children: [
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              "assets/images/diwali_inside_img.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Diwali',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        letterSpacing: 1.1,
                        color: Colors.white,
                        fontSize: 50,
                        fontFamily: "Sans-Regular")),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.schedule,
                      color: Colors.white70,
                      size: 25,
                    ),
                    SizedBox(width: 5),
                    Text('142 DAYS',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: "Sans-Regular")),
                    SizedBox(width: 20),
                    SizedBox(width: 5),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    SizedBox(width: 5),
                    Flexible(
                        child: Text(
                      "Diwali, also known as ‘Deepavali’ (a row of lamps), is one of the most fervently celebrated festivals of India. Diwali is often called the ‘Festival of Lights’, and is celebrated by lighting lamps, and bursting crackers and fireworks. It is a festival which commemorates the victorious return of Lord Rama to Ayodhya after saving his wife Sita from the demon king Ravana. This religious festival represents the triumph of good over evil and light over darkness.",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                    child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "More Information",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                )),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildImage(String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset(
          imagePath,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Card(
          margin: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            ),
          ),
          child: ListView(
            padding: EdgeInsets.all(20),
            shrinkWrap: true,
            children: <Widget>[
              Text('Vishu',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      letterSpacing: 1.1,
                      color: Colors.black87,
                      fontSize: 30,
                      fontFamily: "Sans-Semi-Bold")),
              SizedBox(height: 20),
              Text(
                "Books to refer",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/images/diwali_book1.jpg",
                              width: 200,
                              height: 200,
                            )),
                        SizedBox(),
                        Image.asset(
                          "assets/images/diwali_book2.jpg",
                          width: 200,
                          height: 200,
                        ),
                      ],  
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildBottomSheetButton(Icons.chat_bubble, '24'),
                  _buildBottomSheetButton(Icons.favorite, '65'),
                  _buildBottomSheetButton(Icons.star_border, '17'),
                  _buildBottomSheetButton(Icons.whatshot, '80'),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 80, 82, 83),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Color(0xFF1565c0)),
                    ),
                  ),
                ),
                onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    QuizScreen4()
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, bottom: 10, top: 10),
                  child: Center(
                    child: Text('Go for a Quest',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFFffffff),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: "Sans-Regular")),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomSheetButton(IconData icon, String text) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(
            icon,
            color: Color(0xFF37474f),
            size: 25,
          ),
          onPressed: () {},
        ),
        Text(text,
            style: TextStyle(
                color: Color(0xFF37474f),
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: "Sans-Regular")),
      ],
    );
  }

  Widget _buildUserAvatar(String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        imagePath,
        height: 60,
        width: 60,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildLocationCard() {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      color: Color(0xaaf5f5f5),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              child: Icon(
                Icons.location_on,
                color: Color(0xFFb39ddb),
                size: 30,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFf3e5f5),
              ),
            ),
            SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('From',
                    style: TextStyle(
                        color: Color(0xFF757575),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontFamily: "Sans-Regular")),
                SizedBox(height: 5),
                Text('Beijing',
                    style: TextStyle(
                        color: Color(0xFF212121),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: "Sans-Regular")),
              ],
            ),
            SizedBox(width: 80),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('To',
                    style: TextStyle(
                        color: Color(0xFF757575),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontFamily: "Sans-Regular")),
                SizedBox(height: 5),
                Text('Maldives',
                    style: TextStyle(
                        color: Color(0xFF212121),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: "Sans-Regular")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
