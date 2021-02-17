import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_nw/widgets/glass_box.dart';
import 'package:portfolio_nw/widgets/project_card.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sebastian Garzon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlassBox(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              const SizedBox(height: 20),
              CVButton(),
              const SizedBox(height: 80),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Work experience:',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  ProjectCard(
                    description: """
I worked building new user experiences using Dart and Flutter, clean architecture, handling errors, implementing new features proposed by the product team, propose UI/UX improvements, and helping to incorporate good practices using the effective Dart.

I start working from 08/2020
""",
                    url: 'https://puntopay.co/',
                    title: 'Puntopay',
                    imageUrl:
                        'https://play-lh.googleusercontent.com/40zc0r7yEI5W6ptpWMDvCVbgQVxAeLagsi6yo8MoLxsJxPL59m9pOs0Zal12VFMA64Y=w1060-h959-rw',
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Projects:',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  ProjectCard(
                    url: 'https://github.com/nestorsgarzonc/Waffly',
                    isReverse: true,
                    title: 'Waffly',
                    imageUrl:
                        'https://raw.githubusercontent.com/nestorsgarzonc/Waffly/master/screenshots/Screenshot_2020-10-08-18-33-48-416_com.example.ed_project.jpg',
                    description:
                        "Waffly: is a marketplace of skills in which users can request services such as cleaning a house or software development.\nThis project was developed Flutter.",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CVButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: () => launch(
          'https://drive.google.com/file/d/1Xfqw2SzGptfElTUnYQOcVD6xa7fs9o3G/view?usp=sharing',
        ),
        child: Text(
          'Download CV',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
          shadowColor: MaterialStateColor.resolveWith((states) => Colors.grey),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hi!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60)),
              const SizedBox(height: 15),
              Text(
                'I\'m Sebastián Garzón',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('I\'m ', style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 40,
                    child: RotateAnimatedTextKit(
                      text: [
                        'Mobile',
                        'Machine Learning',
                        'Backend',
                        'Flutter',
                        'Python',
                        'NodeJS',
                      ],
                      textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                      repeatForever: true,
                    ),
                  ),
                  Text(' developer', style: TextStyle(fontSize: 20)),
                ],
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10000),
            child: Image.network(
              'https://avatars.githubusercontent.com/u/40438456?s=400&u=ab054dea1cd8fb08d127a190aff586bd21d98432&v=4',
              height: 250,
            ),
          ),
        ],
      ),
    );
  }
}
