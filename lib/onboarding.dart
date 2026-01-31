import 'package:evently/app_theme.dart';
import 'package:evently/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  static String routeName = '/onboarding';

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  List<String> imageNames = ['being-creative', 'hot-trending', 'manager-desk', 'social-media'];
  List<String> titles = ['Personalize Your Experience', 'Stay Updated', 'Manage Easily', 'Connect Socially'];
  List<String> subtitles = [
    'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.',
    'Get real-time updates on upcoming events and never miss out.',
    'Organize and manage your events effortlessly in one place.',
    'Share your event experiences and connect with others.'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: .center,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Container(
                    width: 32,
                    height: 32,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Light.inputs,
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (currentIndex > 0) {
                            currentIndex--;
                          }
                        });
                      },
                      icon: Icon(Icons.arrow_back_ios_new),
                      color: Light.mainColor,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  Image.asset(
                    'assets/images/evently.png',
                    width: 142,
                    height: 27,
                  ),

                  ElevatedButton(
                    onPressed: () {Navigator.of(context).pushNamed(HomeScreen.routeName);},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Light.inputs,
                      foregroundColor: Light.mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Skip'),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: PageView.builder(
                    onPageChanged: (index) => setState(() {
                      currentIndex = index;
                    }),
                    itemCount: imageNames.length,
                    itemBuilder: (_, index) {
                      return SvgPicture.asset(
                        'assets/icons/${imageNames[currentIndex]}.svg',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width,
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: AnimatedSmoothIndicator(    
                  activeIndex: currentIndex,    
                  count: imageNames.length,    
                  effect: ExpandingDotsEffect(
                    dotWidth:  8,    
                    dotHeight:  8,
                    dotColor:  Light.disable,    
                    activeDotColor:  Light.mainColor,
                  ), 
                ),
              ),  
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text('${titles[currentIndex]}'),
                    SizedBox(height: 8),
                    Text('${subtitles[currentIndex]}'),
                    SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text('Language'),
                        Container(
                          child: Row(
                            children: [
                              ElevatedButton(onPressed: () {}, child: Text('English')),
                              SizedBox(width: 8,),
                              ElevatedButton(onPressed: () {}, child: Text('Arabic')),
                            ],
                          )),
                        
                      ],
                    ),
                    SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text('Theme'),
                        Container(
                          child: Row(
                            children: [
                              ElevatedButton(onPressed: () {}, child: Text('Light')),
                              SizedBox(width: 8,),
                              ElevatedButton(onPressed: () {}, child: Text('Dark')),
                            ],
                          )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => setState(() {
                  if (currentIndex < imageNames.length - 1) {
                    currentIndex++;
                  }
                }),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width, 48),
                  backgroundColor: Light.mainColor,
                  foregroundColor: Light.background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
