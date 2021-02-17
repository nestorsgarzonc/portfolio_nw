import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final String imageUrl;
  final String description;
  final String title;
  final String url;
  final bool isReverse;

  const ProjectCard({
    @required this.imageUrl,
    @required this.description,
    @required this.title,
    @required this.url,
    this.isReverse = false,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40),
      height: 400,
      child: Row(
        textDirection: isReverse ? TextDirection.rtl : TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            imageUrl,
            width: size.width * 0.4,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white),
            ),
            height: 500,
            width: size.width * 0.4,
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Spacer(),
                Text(description, style: TextStyle(color: Colors.black, height: 1.5)),
                Spacer(),
                Container(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => launch(url),
                    child: Text(
                      'Go to $title'.toUpperCase(),
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.black),
                      shadowColor: MaterialStateColor.resolveWith((states) => Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
