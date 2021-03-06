import 'package:flutter/material.dart';
import 'package:newsapp/src/pages/tab1_page.dart';
import 'package:newsapp/src/pages/tab2_page.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavigationModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
        
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);


    return BottomNavigationBar(
      currentIndex: navigationModel.currentPage,
      onTap: (i) =>navigationModel.currentPage = i,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          title: Text('For You')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          title: Text('News')
        ),
      ],
    );
  }
}

class _Pages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);
    return PageView(
      controller: navigationModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        TabOnePage(),
        Tab2Page()
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier{

  int _currentPage = 0;
  PageController _pageController = new PageController(
    initialPage: 0
  );

  int get currentPage => this._currentPage;
  set currentPage(int value) {
    this._currentPage = value;
    _pageController.animateToPage(value, duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  } 

  PageController get pageController => this._pageController;


}