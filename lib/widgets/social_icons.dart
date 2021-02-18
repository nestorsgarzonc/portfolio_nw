import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isScreenWide = size.width >= size.height * 0.9;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Row(
        mainAxisAlignment: isScreenWide ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          IconButton(
            icon: FaIcon(Icons.email, size: 40),
            onPressed: () => launch('mailto:nestorsgarzonc@gmail.com'),
          ),
          const SizedBox(width: 15),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.linkedin, size: 40),
            onPressed: () => launch('https://www.linkedin.com/in/sebastiangarzonc/'),
          ),
          const SizedBox(width: 15),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.twitter, size: 40),
            onPressed: () => launch('https://twitter.com/nestorsgarzonc'),
          ),
          const SizedBox(width: 15),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.instagram, size: 40),
            onPressed: () => launch('https://www.instagram.com/segc_nw/'),
          ),
        ],
      ),
    );
  }
}
