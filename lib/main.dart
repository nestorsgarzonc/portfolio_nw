import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_nw/widgets/glass_box.dart';
import 'package:portfolio_nw/widgets/project_card.dart';
import 'package:portfolio_nw/widgets/social_icons.dart';
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
    final size = MediaQuery.of(context).size;
    bool isScreenWide = size.width >= size.height * 0.9;
    return Scaffold(
      body: GlassBox(
        child: SingleChildScrollView(
          padding: isScreenWide
              ? EdgeInsets.symmetric(vertical: 40, horizontal: 80)
              : EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: isScreenWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Header(),
              const SizedBox(height: 60),
              FadeInLeft(child: CVButton()),
              SocialIcons(),
              const SizedBox(height: 40),
              Text(
                'About me:',
                style: TextStyle(fontSize: isScreenWide ? 40 : 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                  '''Colombian software developer with 1+ years working with mobile apps with Flutter, implementing CI/CD, using SCRUM.
Also, I worked with ExpressJS and FastAPI building a REST API, MongoDB, and MongoDB Atlas for database and Postgresql, AWS EC2, and AWS RDS to deploy an ML project. Tensorflow to build Deep learning models, SKLearn for ML models.'''),
              SizedBox(height: isScreenWide ? 80 : 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Work experience:',
                    style: TextStyle(fontSize: isScreenWide ? 40 : 30, fontWeight: FontWeight.bold),
                  ),
                  ProjectCard(
                    description: """
I worked building new user experiences using Dart and Flutter, clean architecture, handling errors, implementing new features proposed by the product team, propose UI/UX improvements, and helping to incorporate good practices using the effective Dart.

I start working from 08/2020.
""",
                    url: 'https://puntopay.co/',
                    title: 'Puntopay',
                    imageUrl:
                        'https://play-lh.googleusercontent.com/0hpx32h965k8Bch6aOoNe7WUYT2_aozE9gg6q2jbB1NXwC7npiwzciq3o-cOITpOXJI=s180-rw',
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Projects:',
                    style: TextStyle(fontSize: isScreenWide ? 40 : 30, fontWeight: FontWeight.bold),
                  ),
                  ProjectCard(
                    url: 'https://github.com/nestorsgarzonc/Waffly',
                    isReverse: true,
                    title: 'Waffly',
                    imageUrl:
                        'https://raw.githubusercontent.com/nestorsgarzonc/Waffly/master/screenshots/Screenshot_2020-10-08-18-33-48-416_com.example.ed_project.jpg',
                    description:
                        "Waffly is a marketplace of skills in which users can request services such as cleaning a house or software development.\nThis project was developed Flutter.",
                  ),
                  ProjectCard(
                    url: 'https://www.youtube.com/watch?v=vTlqkqSemNM',
                    isReverse: false,
                    title: 'Cybertruck',
                    imageUrl:
                        'https://raw.githubusercontent.com/nestorsgarzonc/cybertruck_flutter/master/image1.png',
                    description:
                        'I build a Cybertruck in Flutter from scratch using custompainter.\nFlutter pen of the week.\nThis project was mencioned in Flutter explained channel saying: "we love the most how precisely and accurate he recreated the Cybertruck" in the minute 4:10.',
                  ),
                  ProjectCard(
                    url: 'https://github.com/nestorsgarzonc/Off_Corss_Front_End',
                    isReverse: true,
                    title: 'OffCorss frontend',
                    imageUrl:
                        'https://raw.githubusercontent.com/nestorsgarzonc/Off_Corss_Front_End/master/Captura%20de%20pantalla%202021-02-17%20171918.png',
                    description:
                        "Identify customer behavior in stores:\nFor the DS4A course with my team, we built a system that allows us to identify customer behavior in stores using computer vision. This project was made using CV2, Deep SORT, YOLO, and a user interface with Dash.\nThe algorithm allows us to find the paths of the people in the store and providing better selling opportunities.",
                  ),
                  ProjectCard(
                    url:
                        'https://github.com/nestorsgarzonc/Data-Science-Proyects/blob/master/malaria_detection.ipynb',
                    isReverse: false,
                    title: 'Malaria detection',
                    imageUrl:
                        'https://raw.githubusercontent.com/nestorsgarzonc/Data-Science-Proyects/master/Captura%20de%20pantalla%202021-02-17%20172530.png',
                    description:
                        "I build a malaria classifier with convolutional neural networks using tensorflow.",
                  ),
                  ProjectCard(
                    url: 'https://github.com/nestorsgarzonc/waffly_rest_api',
                    isReverse: true,
                    title: 'Waffly backend',
                    imageUrl:
                        'https://raw.githubusercontent.com/nestorsgarzonc/waffly_rest_api/master/Captura%20de%20pantalla%202021-02-17%20173146.png',
                    description:
                        "Backend for Waffly app built in Express and NodeJS, using MongoDB as NoSQL database",
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
          'https://drive.google.com/file/d/15UuJLjHu6nZLb5JOmI0svAvacR2gLApD/view?usp=sharing',
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
    final size = MediaQuery.of(context).size;
    bool isScreenWide = size.width >= size.height * 0.9;

    return Container(
      child: Flex(
        direction: isScreenWide ? Axis.horizontal : Axis.vertical,
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
                      textStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                      repeatForever: true,
                    ),
                  ),
                  Text(' developer.', style: TextStyle(fontSize: 25)),
                ],
              ),
            ],
          ),
          if (!isScreenWide) const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(10000),
            child: Image.network(
              'https://raw.githubusercontent.com/nestorsgarzonc/portfolio_nw/master/IMG-20200209-WA0009.jpg',
              height: 250,
              width: 250,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
