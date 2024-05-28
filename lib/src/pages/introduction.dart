import 'package:app_gooday/src/components/color_style.dart';
import 'package:app_gooday/src/components/intro_page.dart';
import 'package:flutter/material.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late TabPageSelector _tabPageSelector;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    _tabPageSelector = TabPageSelector(
      controller: TabController(length: 4, vsync: this),
      color: ColorStyle.secundary,
      selectedColor: ColorStyle.primary,
      borderStyle: BorderStyle.none,
    );
  }

  @override
  Widget build(BuildContext context) {
    void onButtonPressed() {
      _pageController.nextPage(
        duration: Durations.medium4,
        curve: Curves.easeIn,
      );
    }

    return Scaffold(
      backgroundColor: ColorStyle.primary,
      appBar: AppBar(
        backgroundColor: ColorStyle.primary,
        leading: IconButton(
          onPressed: () {
            if (_pageController.page == 0) {
              Navigator.pop(context);
            } else {
              _pageController.previousPage(
                duration: Durations.medium4,
                curve: Curves.easeIn,
              );
            }
          },
          color: ColorStyle.white,
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          _tabPageSelector.controller?.index = index;
        },
        children: [
          IntroPage(
            image: Image.asset('lib/assets/intro-page-1.png'),
            tabPageSelector: _tabPageSelector,
            title: 'Viva bem',
            description:
                'Que você viva muito bem sua vida 👌👌',
            onButtonPressed: onButtonPressed,
          ),
          IntroPage(
            image: Image.asset('lib/assets/intro-page-2.png'),
            tabPageSelector: _tabPageSelector,
            title: 'Treine bem',
            description:
                'Treine bem, pois ajuda na saúde 👍👍',
            onButtonPressed: onButtonPressed,
          ),
          IntroPage(
            image: Image.asset('lib/assets/intro-page-3.png'),
            tabPageSelector: _tabPageSelector,
            title: 'Divirta-se',
            description:
                'Se divirta, pois isso te fará mais feliz 🤞🤞',
            onButtonPressed: onButtonPressed,
          ),
          IntroPage(
            image: Image.asset('lib/assets/intro-page-4.png'),
            tabPageSelector: _tabPageSelector,
            title: 'Alimente-se bem',
            description:
                'Se alimente bem, pois isso ajuda no seu dia a dia ✌️✌️',
            onButtonPressed: onButtonPressed,
          ),
        ],
      ),
    );
  }
}
