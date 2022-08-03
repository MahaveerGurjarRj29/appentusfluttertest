import 'package:appentusfluttertest/constants.dart';
import 'package:appentusfluttertest/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import '../common_comp.dart';
import '../modal/home_model.dart';
import '../services/services.dart';

class MyHomePage extends StatefulWidget {
  //MyHomePage({required Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool? isHomeDataLoading;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    isHomeDataLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(250, 33, 147, 176),
                Color.fromARGB(150, 109, 213, 237),
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        title: const Text(
          "Appentus",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 3),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          //width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(250, 33, 147, 176),
                Color.fromARGB(150, 109, 213, 237),
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: FutureBuilder<List<HomeModel>>(
            future: Services.fetchHomeData(),
            builder: (context, snapshot) {
              return snapshot.connectionState == ConnectionState.done
                  ? snapshot.hasData
                      ? CommanCode.homeGrid(snapshot, gridClicked)
                      : CommanCode.retryButton(fetch)
                  : CommanCode.circularProgress();
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        showUnselectedLabels: true,
        iconSize: MediaQuery.of(context).size.height * 0.05,
        backgroundColor: Colors.lightBlue,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (value) {
          _currentIndex = value;
          // Respond to item press.
          if (_currentIndex == 1) {
            print("calling profile page");
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => ProfileScreen()));
          } else {
            setState(() {});
          }
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  setLoading(bool loading) {
    setState(() {
      isHomeDataLoading = loading;
    });
  }

  fetch() {
    setLoading(true);
  }
}

gridClicked(BuildContext context, HomeModel homeModel) {
  // Grid Click
}
