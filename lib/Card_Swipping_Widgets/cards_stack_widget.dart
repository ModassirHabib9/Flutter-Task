import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Card_Swipping_Widgets/action_button_widget.dart';
import 'package:untitled/Card_Swipping_Widgets/drag_widget.dart';
import 'package:untitled/Model/profile.dart';
import '../Screens/home/home_screen.dart';

class CardsStackWidget extends StatefulWidget {
  const CardsStackWidget({Key? key}) : super(key: key);

  @override
  State<CardsStackWidget> createState() => _CardsStackWidgetState();
}

class _CardsStackWidgetState extends State<CardsStackWidget>
    with SingleTickerProviderStateMixin {
  ValueNotifier<Swipe> swipeNotifier = ValueNotifier(Swipe.none);
  late final AnimationController _animationController;
  // imageUrl;
  List<Profile> draggableItems = [
    Profile(
        name: "userlist.length",
        distance: 'Ads Title(Lorem Ipsum dolor set)',
        imageAsset: "assets/banner.png"),
    Profile(
        name: 'Company Name',
        distance: 'Ads Title(Lorem Ipsum dolor set)',
        imageAsset: 'assets/banner2.png'),
    Profile(
        name: 'Company Name',
        distance: 'Ads Title(Lorem Ipsum dolor set) ',
        imageAsset: 'assets/banner.png'),
    Profile(
        name: 'Company Name',
        distance: 'Ads Title(Lorem Ipsum dolor set)',
        imageAsset: 'assets/banner2.png'),
    Profile(
        name: 'Company Name',
        distance: 'Ads Title(Lorem Ipsum dolor set)',
        imageAsset: 'assets/banner.png'),
  ];
  getData() async {
    try {
      userlist.clear();
      await FirebaseFirestore.instance.collection("User").get().then((value) {
        value.docs.forEach((element) {
          UserData userData = UserData(
              imageUrl: element["imgUrl"],
              title: element["authorName"],
              subtitle: element["title"]);
          userlist.add(userData);
          // imageUrl = userData.imageUrl;
          print("userData");
          print(userData);
          print(userData.title);
          // imageUrl = userData.imageUrl;
        });
      });
    } catch (e) {}
  }

  @override
  void initState() {
    getData();
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        draggableItems.removeLast();
        _animationController.reset();

        swipeNotifier.value = Swipe.none;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ValueListenableBuilder(
            valueListenable: swipeNotifier,
            builder: (context, swipe, _) => Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: List.generate(draggableItems.length, (index) {
                if (index == draggableItems.length - 1) {
                  return PositionedTransition(
                    rect: RelativeRectTween(
                      begin: RelativeRect.fromSize(
                          const Rect.fromLTWH(0, 0, 580, 340),
                          const Size(580, 340)),
                      end: RelativeRect.fromSize(
                          Rect.fromLTWH(
                              swipe != Swipe.none
                                  ? swipe == Swipe.left
                                      ? -300
                                      : 300
                                  : 0,
                              0,
                              580,
                              340),
                          const Size(580, 340)),
                    ).animate(CurvedAnimation(
                      parent: _animationController,
                      curve: Curves.easeInOut,
                    )),
                    child: RotationTransition(
                        turns: Tween<double>(
                                begin: 0,
                                end: swipe != Swipe.none
                                    ? swipe == Swipe.left
                                        ? -0.1 * 0.3
                                        : 0.1 * 0.3
                                    : 0.0)
                            .animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve:
                                const Interval(0, 0.4, curve: Curves.easeInOut),
                          ),
                        ),
                        child: DragWidget(
                          profile: draggableItems[index],
                          index: index,
                          swipeNotifier: swipeNotifier,
                          isLastCard: true,
                        )),
                  );
                } else {
                  return DragWidget(
                    profile: draggableItems[index],
                    index: index,
                    swipeNotifier: swipeNotifier,
                  );
                }
              }),
            ),
          ),
        ),
        Positioned(
          bottom: 60,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 46.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ActionButtonWidget(
                  onPressed: () {
                    swipeNotifier.value = Swipe.left;
                    _animationController.forward();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(width: 20),
                ActionButtonWidget(
                  onPressed: () {
                    swipeNotifier.value = Swipe.right;
                    _animationController.forward();
                  },
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          child: DragTarget<int>(
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return IgnorePointer(
                child: Container(
                  height: 700.0,
                  width: 80.0,
                  color: Colors.transparent,
                ),
              );
            },
            onAccept: (int index) {
              setState(() {
                draggableItems.removeAt(index);
              });
            },
          ),
        ),
        Positioned(
          right: 0,
          child: DragTarget<int>(
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return IgnorePointer(
                child: Container(
                  height: 700.0,
                  width: 80.0,
                  color: Colors.transparent,
                ),
              );
            },
            onAccept: (int index) {
              setState(() {
                draggableItems.removeAt(index);
              });
            },
          ),
        ),
      ],
    );
  }
}

List<UserData> userlist = [];

class UserData {
  String imageUrl;
  String title;
  String subtitle;
  UserData(
      {required this.imageUrl, required this.title, required this.subtitle});
}

// class Text2 extends StatefulWidget {
//   const Text2({Key? key}) : super(key: key);
//
//   @override
//   State<Text2> createState() => _Text2State();
// }
//
// class _Text2State extends State<Text2> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text("${userlist[i].title}"),
//     );
//   }
// }
