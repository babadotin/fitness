import 'package:flutter/material.dart';
import 'package:fitness/SignUp%20&%20LogIn/signup_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({
    super.key,
    this.screenIndex,
    this.iconAnimationController,
    this.callBackIndex,
  });

  final AnimationController? iconAnimationController;
  final DrawerIndex? screenIndex;
  final Function(DrawerIndex)? callBackIndex;

  @override
  MenuPageState createState() => MenuPageState();
}

class MenuPageState extends State<MenuPage> {
  List<DrawerList>? drawerList;

  @override
  void initState() {
    super.initState();
    setDrawerListArray();
  }

  void setDrawerListArray() {
    drawerList = <DrawerList>[
      DrawerList(
        index: DrawerIndex.home,
        labelName: 'Home',
        icon: const Icon(Icons.home),
      ),
      DrawerList(
        index: DrawerIndex.help,
        labelName: 'Help',
        isAssetsImage: true,
        imageName: 'assets/images/supportIcon.png',
      ),
      DrawerList(
        index: DrawerIndex.feedback,
        labelName: 'FeedBack',
        icon: const Icon(Icons.help),
      ),
      DrawerList(
        index: DrawerIndex.invite,
        labelName: 'Invite Friend',
        icon: const Icon(Icons.group),
      ),
      DrawerList(
        index: DrawerIndex.share,
        labelName: 'Rate the app',
        icon: const Icon(Icons.share),
      ),
      DrawerList(
        index: DrawerIndex.about,
        labelName: 'About Us',
        icon: const Icon(Icons.info),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7EBE1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 40.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  if (widget.iconAnimationController != null)
                    AnimatedBuilder(
                      animation: widget.iconAnimationController!,
                      builder: (BuildContext context, Widget? child) {
                        return ScaleTransition(
                          scale: AlwaysStoppedAnimation<double>(1.0 -
                              (widget.iconAnimationController!.value) * 0.2),
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation<double>(
                              Tween<double>(begin: 0.0, end: 24.0)
                                      .animate(CurvedAnimation(
                                          parent:
                                              widget.iconAnimationController!,
                                          curve: Curves.fastOutSlowIn))
                                      .value /
                                  360,
                            ),
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      offset: Offset(2.0, 4.0), blurRadius: 8),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(60.0)),
                                child:
                                    Image.asset('assets/images/userImage.png'),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8, left: 4),
                    child: Text(
                      'Chris Hemsworth',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const Divider(
            height: 1,
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(0.0),
              itemCount: drawerList?.length,
              itemBuilder: (BuildContext context, int index) {
                return inkwell(drawerList![index]);
              },
            ),
          ),
          const Divider(
            height: 1,
          ),
          Column(
            children: <Widget>[
              ListTile(
                title: const Text(
                  'Sign Out',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.left,
                ),
                trailing: const Icon(
                  Icons.power_settings_new,
                  color: Colors.red,
                ),
                onTap: onSignOut,
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom,
              )
            ],
          ),
        ],
      ),
    );
  }

  void onSignOut() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignupPage(),
      ),
    );
  }

  Widget inkwell(DrawerList listData) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey.withOpacity(0.1),
        highlightColor: Colors.transparent,
        onTap: () {
          navigationtoScreen(listData.index!);
        },
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 6.0,
                    height: 46.0,
                    decoration: BoxDecoration(
                      color: widget.screenIndex == listData.index
                          ? Colors.blue
                          : Colors.transparent,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  if (listData.isAssetsImage)
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.asset(listData.imageName),
                    )
                  else
                    Icon(listData.icon?.icon),
                  const SizedBox(width: 8.0),
                  Text(
                    listData.labelName,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            if (widget.screenIndex == listData.index &&
                widget.iconAnimationController != null)
              AnimatedBuilder(
                animation: widget.iconAnimationController!,
                builder: (BuildContext context, Widget? child) {
                  return Transform(
                    transform: Matrix4.translationValues(
                        (MediaQuery.of(context).size.width * 0.75 - 64) *
                            (1.0 - widget.iconAnimationController!.value),
                        0.0,
                        0.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.75 - 64,
                        height: 46,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.2),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(28),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(28),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  Future<void> navigationtoScreen(DrawerIndex indexScreen) async {
    widget.callBackIndex?.call(indexScreen);
  }
}

enum DrawerIndex {
  home,
  feedback,
  help,
  share,
  about,
  invite,
  testing,
}

class DrawerList {
  DrawerList({
    this.isAssetsImage = false,
    this.labelName = '',
    this.icon,
    this.index,
    this.imageName = '',
  });

  String labelName;
  Icon? icon;
  bool isAssetsImage;
  String imageName;
  DrawerIndex? index;
}
