import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/navigation/app_router.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      lazyLoad: false,
      routes: const [
        EmptyTab(),
        CatalogTab(),
        CartTab(),
        EmptyTab(),
        EmptyTab()
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return CupertinoTabBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.border_all_rounded),
                  Text(
                    'Витрина',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.search),
                  Text(
                    'Каталог',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.shopping_bag_outlined),
                  Text(
                    'Корзина',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.favorite_border),
                  Text(
                    'Избранное',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person_outlined),
                  Text(
                    'Профиль',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
