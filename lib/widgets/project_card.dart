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
    bool isScreenWide = size.width >= size.height * 0.9;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40),
      height: isScreenWide ? 400 : null,
      child: Flex(
        direction: isScreenWide ? Axis.horizontal : Axis.vertical,
        textDirection: isScreenWide ? (isReverse ? TextDirection.rtl : TextDirection.ltr) : null,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(imageUrl, width: isScreenWide ? size.width * 0.4 : size.width * 0.8),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white),
            ),
            height: isScreenWide ? 351 : 320,
            width: isScreenWide ? size.width * 0.4 : size.width * 0.85,
            padding: isScreenWide
                ? EdgeInsets.symmetric(vertical: 40, horizontal: 25)
                : EdgeInsets.all(20),
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
