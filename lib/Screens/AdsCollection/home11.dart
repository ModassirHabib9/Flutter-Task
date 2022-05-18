/*
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class TinderHomePage extends StatefulWidget {
  static String tag = '/TinderHomePage';

  @override
  _TinderHomePageState createState() => _TinderHomePageState();
}

class _TinderHomePageState extends State<TinderHomePage> {
  bool isActive = false;

  //  Use this to trigger swap. (i.e to swipe the card to left or right)
  CardController controller = CardController();

  //  List is used to show data in the card.
  List<UserDetails> user = [
    UserDetails(
        name: 'Barkha Singh',
        image: 'https://wallpapercave.com/wp/wp4636827.jpg',
        age: 20,
        city: 'Navsari'),
    UserDetails(
        name: 'Mithali Parkar',
        image:
            'https://2.bp.blogspot.com/-_mKKdFGGd-Y/WxEULk2hqxI/AAAAAAAAOFo/pirHeoRRakArw4aFJzkWUVmygr86V69bACLcBGAs/s1600/actress-mithila-palkar-photos-18.jpg',
        age: 27,
        city: 'Mumbai'),
    UserDetails(
        name: 'Ayush Mehra ',
        image:
            'https://i2.wp.com/wikifamouspeople.com/wp-content/uploads/2019/02/Ayush-Mehra.jpg?resize=1060%2C794&ssl=1',
        age: 27,
        city: 'Mumbai'),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: isActive == false
          ? Container(
              height: size.height,
              child: TinderSwapCard(
                // orientation where you want to show the stack
                orientation: AmassOrientation.RIGHT,
                // total number of cards
                totalNum: user.length,
                // from which index you want to show the card
                currentIndex: 1,
                // no of stacks you want to show in background
                stackNum: 3,
                // set the max and min width
                maxWidth: size.width * .9,
                maxHeight: size.height * 0.8,
                minWidth: size.width * 0.8,
                minHeight: size.height * 0.7,
                cardController: controller,
                // Restrict the stack from swiping downside if its false
                swipeDown: false,
                // Restrict the stack from swiping upside if its false
                swipeUp: false,
                swipeUpdateCallback:
                    (DragUpdateDetails details, Alignment align) {
                  //  Get swiping card's alignment.
                  print(details.localPosition);
                  if (align.x < 0) {
                    //  Card is LEFT swiping.
                  } else if (align.x > 0) {
                    //  Card is RIGHT swiping
                  }
                },
                swipeCompleteCallback:
                    (CardSwipeOrientation orientation, int index) {
                  // Get orientation & index of swiped card!
                  if ((index + 1) == user.length) {
                    setState(() {
                      isActive = true;
                    });
                  }
                },
                cardBuilder: (BuildContext context, int index) {
                  // Customize you card as per your need
                  return Stack(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                  image: FadeInImage(
                                    placeholder: Image.asset(
                                            'images/LikeButton/image/grey.jpg')
                                        .image,
                                    image:
                                        Image.network(user[index].image!).image,
                                  ).image,
                                  fit: BoxFit.cover),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(user[index].name!,
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white)),
                                    Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Text(user[index].age.toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white)))
                                  ],
                                ),
                              ),
                              Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(user[index].city!,
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white))),
                            ],
                          )),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: InkWell(
                          onTap: () {
                            controller.triggerLeft();
                          },
                          child: Container(
                              height: 65,
                              width: 75,
                              decoration: BoxDecoration(
                                  color: Colors.red, shape: BoxShape.circle),
                              margin: EdgeInsets.only(bottom: 100, left: 80),
                              child: Icon(Icons.clear,
                                  color: Colors.white, size: 50)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            controller.triggerRight();
                          },
                          child: Container(
                            height: 65,
                            width: 75,
                            decoration: BoxDecoration(
                                color: Colors.green, shape: BoxShape.circle),
                            margin: EdgeInsets.only(bottom: 100, right: 80),
                            child: Icon(Icons.check,
                                color: Colors.white, size: 40),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ))
          : Container(
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: const <Widget>[
                  // Lottie.asset('images/Tinder/images/empty.json'),
                  SizedBox(height: 30),
                  Text('No Data Found',
                      style: TextStyle(fontSize: 24, color: Color(0xFF757575))),
                ],
              ),
            ),
      floatingActionButton: isActive == true
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  isActive = false;
                });
              },
              child: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
            )
          : SizedBox(),
    );
  }
}

class UserDetails {
  String? name;
  String? image;
  int? age;
  String? city;

  UserDetails({
    this.name,
    this.image,
    this.age,
    this.city,
  });
}

List<Size> _cardSizes = [];
List<Alignment> _cardAligns = [];

enum TriggerDirection { none, right, left, up, down }

/// A Tinder-Like Widget.
class TinderSwapCard extends StatefulWidget {
  CardBuilder _cardBuilder;
  int _totalNum;
  int _stackNum;
  int _animDuration;
  int _currentIndex = 0;
  double _swipeEdge;
  double _swipeEdgeVertical;
  bool _swipeUp;
  bool _swipeDown;
  bool _allowVerticalMovement;
  CardSwipeCompleteCallback swipeCompleteCallback;
  CardDragUpdateCallback swipeUpdateCallback;
  CardController cardController;

  @override
  _TinderSwapCardState createState() => _TinderSwapCardState();

  /// Constructor requires Card Widget Builder [cardBuilder] & your card count [totalNum]
  /// , option includes: stack orientation [orientation], number of card display in same time [stackNum]
  /// , [swipeEdge] is the edge to determine action(recover or swipe) when you release your swiping card
  /// it is the value of alignment, 0.0 means middle, so it need bigger than zero.
  /// , and size control params;
  TinderSwapCard(
      {Key? key,
      @required CardBuilder? cardBuilder,
      @required int? totalNum,
      AmassOrientation orientation = AmassOrientation.BOTTOM,
      int stackNum = 3,
      int animDuration = 800,
      int currentIndex = 0,
      double swipeEdge = 3.0,
      double swipeEdgeVertical = 8.0,
      bool swipeUp = false,
      bool swipeDown = false,
      double? maxWidth,
      double? maxHeight,
      double? minWidth,
      double? minHeight,
      bool allowVerticalMovement = true,
      required this.cardController,
      required this.swipeCompleteCallback,
      required this.swipeUpdateCallback})
      : this._cardBuilder = cardBuilder!,
        this._totalNum = totalNum!,
        assert(stackNum > 1),
        this._stackNum = stackNum,
        this._animDuration = animDuration,
        assert(swipeEdge > 0),
        this._swipeEdge = swipeEdge,
        assert(swipeEdgeVertical > 0),
        this._swipeEdgeVertical = swipeEdgeVertical,
        this._swipeUp = swipeUp,
        this._swipeDown = swipeDown,
        assert(maxWidth! > minWidth! && maxHeight! > minHeight!),
        this._allowVerticalMovement = allowVerticalMovement,
        super(key: key) {
    double widthGap = maxWidth! - minWidth!;
    double heightGap = maxHeight! - minHeight!;

    currentIndex = _currentIndex;
    _cardAligns = [];
    _cardSizes = [];

    for (int i = 0; i < _stackNum; i++) {
      _cardSizes.add(new Size(minWidth + (widthGap / _stackNum) * i,
          minHeight + (heightGap / _stackNum) * i));

      switch (orientation) {
        case AmassOrientation.BOTTOM:
          _cardAligns.add(
              new Alignment(0.0, (0.5 / (_stackNum - 1)) * (stackNum - i)));
          break;
        case AmassOrientation.TOP:
          _cardAligns.add(
              new Alignment(0.0, (-0.5 / (_stackNum - 1)) * (stackNum - i)));
          break;
        case AmassOrientation.LEFT:
          _cardAligns.add(
              new Alignment((-0.5 / (_stackNum - 1)) * (stackNum - i), 0.0));
          break;
        case AmassOrientation.RIGHT:
          _cardAligns.add(
              new Alignment((0.5 / (_stackNum - 1)) * (stackNum - i), 0.0));
          break;
      }
    }
  }
}

class _TinderSwapCardState extends State<TinderSwapCard>
    with TickerProviderStateMixin {
  Alignment? frontCardAlign;
  AnimationController? _animationController;
  int? _currentFront;
  static TriggerDirection? _trigger;

  Widget _buildCard(BuildContext context, int realIndex) {
    if (realIndex < 0) {
      return Container();
    }
    int index = realIndex - _currentFront!;
    widget._currentIndex = realIndex - _currentFront!;

    if (index == widget._stackNum - 1) {
      return Align(
        // alignment: _animationController!.status== AnimationStatus.forward
        //     ? frontCardAlign = CardAnimation
        //     .frontCardAlign(
        //     _animationController!,
        //     frontCardAlign!,
        //     _cardAligns[widget._stackNum - 1],
        //     widget._swipeEdge,
        //     widget._swipeUp,
        //     widget._swipeDown)
        //     .value
        //     : frontCardAlign,
        child: Transform.rotate(
            angle: (pi / 180.0) *
                (_animationController!.status == AnimationStatus.forward
                    ? CardAnimation.frontCardRota(
                            _animationController!, frontCardAlign!.x)
                        .value
                    : frontCardAlign!.x),
            child: SizedBox.fromSize(
              size: _cardSizes[index],
              child: widget._cardBuilder(
                  context, widget._totalNum - realIndex - 1),
            )),
      );
    }

    return Align(
      alignment: _animationController!.status == AnimationStatus.forward &&
              (frontCardAlign!.x > 3.0 ||
                  frontCardAlign!.x < -3.0 ||
                  frontCardAlign!.y > 3 ||
                  frontCardAlign!.y < -3)
          ? CardAnimation.backCardAlign(_animationController!,
                  _cardAligns[index], _cardAligns[index + 1])
              .value
          : _cardAligns[index],
      child: SizedBox.fromSize(
        size: _animationController!.status == AnimationStatus.forward &&
                (frontCardAlign!.x > 3.0 ||
                    frontCardAlign!.x < -3.0 ||
                    frontCardAlign!.y > 3 ||
                    frontCardAlign!.y < -3)
            ? CardAnimation.backCardSize(_animationController!,
                    _cardSizes[index], _cardSizes[index + 1])
                .value
            : _cardSizes[index],
        child: widget._cardBuilder(context, widget._totalNum - realIndex - 1),
      ),
    );
  }

  List<Widget> _buildCards(BuildContext context) {
    List<Widget> cards = [];
    for (int i = _currentFront!; i < _currentFront! + widget._stackNum; i++) {
      cards.add(_buildCard(context, i));
    }

    cards.add(SizedBox.expand(
      child: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          setState(() {
            if (widget._allowVerticalMovement == true) {
              frontCardAlign = Alignment(
                  frontCardAlign!.x +
                      details.delta.dx * 20 / MediaQuery.of(context).size.width,
                  frontCardAlign!.y +
                      details.delta.dy *
                          30 /
                          MediaQuery.of(context).size.height);
            } else {
              frontCardAlign = Alignment(
                  frontCardAlign!.x +
                      details.delta.dx * 20 / MediaQuery.of(context).size.width,
                  0);

              if (widget.swipeUpdateCallback != null) {
                widget.swipeUpdateCallback(details, frontCardAlign!);
              }
            }

            if (widget.swipeUpdateCallback != null) {
              widget.swipeUpdateCallback(details, frontCardAlign!);
            }
          });
        },
        onPanEnd: (DragEndDetails details) {
          animateCards(TriggerDirection.none);
        },
      ),
    ));
    return cards;
  }

  animateCards(TriggerDirection trigger) {
    if (_animationController!.isAnimating ||
        _currentFront! + widget._stackNum == 0) {
      return;
    }
    _trigger = trigger;
    _animationController!.stop();
    _animationController!.value = 0.0;
    _animationController!.forward();
  }

  void triggerSwap(TriggerDirection trigger) {
    animateCards(trigger);
  }

  // support for asynchronous data events
  @override
  void didUpdateWidget(covariant TinderSwapCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget._totalNum != oldWidget._totalNum) {
      _initState();
    }
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initState();
  }

  void _initState() {
    _currentFront = widget._totalNum - widget._stackNum;
    widget._currentIndex = widget._totalNum - widget._stackNum;

    frontCardAlign = _cardAligns[_cardAligns.length - 1];
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: widget._animDuration));
    _animationController!.addListener(() => setState(() {}));
    _animationController!.addStatusListener((AnimationStatus status) {
      int index = widget._totalNum - widget._stackNum - _currentFront!;
      widget._currentIndex = index;
      if (status == AnimationStatus.completed) {
        CardSwipeOrientation orientation;
        if (frontCardAlign!.x < -widget._swipeEdge)
          orientation = CardSwipeOrientation.LEFT;
        else if (frontCardAlign!.x > widget._swipeEdge)
          orientation = CardSwipeOrientation.RIGHT;
        else if (frontCardAlign!.y < -widget._swipeEdgeVertical)
          orientation = CardSwipeOrientation.UP;
        else if (frontCardAlign!.y > widget._swipeEdgeVertical)
          orientation = CardSwipeOrientation.DOWN;
        else {
          frontCardAlign = _cardAligns[widget._stackNum - 1];
          orientation = CardSwipeOrientation.RECOVER;
        }
        if (widget.swipeCompleteCallback != null)
          widget.swipeCompleteCallback(orientation, widget._currentIndex);
        if (orientation != CardSwipeOrientation.RECOVER) changeCardOrder();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.cardController.addListener((trigger) => triggerSwap(trigger));

    return Stack(children: _buildCards(context));
  }

  changeCardOrder() {
    setState(() {
      _currentFront = _currentFront! + 1;
      frontCardAlign = _cardAligns[widget._stackNum - 1];
    });
  }
}

typedef Widget CardBuilder(BuildContext context, int index);

enum CardSwipeOrientation { LEFT, RIGHT, RECOVER, UP, DOWN }

/// swipe card to [CardSwipeOrientation.LEFT] or [CardSwipeOrientation.RIGHT]
/// , [CardSwipeOrientation.RECOVER] means back to start.
typedef CardSwipeCompleteCallback = void Function(
    CardSwipeOrientation orientation, int index);

/// [DragUpdateDetails] of swiping card.
typedef CardDragUpdateCallback = void Function(
    DragUpdateDetails details, Alignment align);

enum AmassOrientation { TOP, BOTTOM, LEFT, RIGHT }

class CardAnimation {
  static Animation<Alignment> frontCardAlign(
      AnimationController controller,
      Alignment beginAlign,
      Alignment baseAlign,
      double swipeEdge,
      bool swipeUp,
      bool swipeDown) {
    double endX, endY;

    if (_TinderSwapCardState._trigger == TriggerDirection.none) {
      endX = beginAlign.x > 0
          ? (beginAlign.x > swipeEdge ? beginAlign.x + 10.0 : baseAlign.x)
          : (beginAlign.x < -swipeEdge ? beginAlign.x - 10.0 : baseAlign.x);
      endY = beginAlign.x > 3.0 || beginAlign.x < -swipeEdge
          ? beginAlign.y
          : baseAlign.y;

      if (swipeUp || swipeDown) {
        if (beginAlign.y < 0) {
          if (swipeUp)
            endY =
                beginAlign.y < -swipeEdge ? beginAlign.y - 10.0 : baseAlign.y;
        } else if (beginAlign.y > 0) {
          if (swipeDown)
            endY = beginAlign.y > swipeEdge ? beginAlign.y + 10.0 : baseAlign.y;
        }
      }
    } else if (_TinderSwapCardState._trigger == TriggerDirection.left) {
      endX = beginAlign.x - swipeEdge;
      endY = beginAlign.y + 0.5;
    }
    */
/* Trigger Swipe Up or Down */ /*

    else if (_TinderSwapCardState._trigger == TriggerDirection.up ||
        _TinderSwapCardState._trigger == TriggerDirection.down) {
      var beginY =
          _TinderSwapCardState._trigger == TriggerDirection.up ? -10 : 10;

      endY = beginY < -swipeEdge ? beginY - 10.0 : baseAlign.y;

      endX = beginAlign.x > 0
          ? (beginAlign.x > swipeEdge ? beginAlign.x + 10.0 : baseAlign.x)
          : (beginAlign.x < -swipeEdge ? beginAlign.x - 10.0 : baseAlign.x);
    } else {
      endX = beginAlign.x + swipeEdge;
      endY = beginAlign.y + 0.5;
    }
    return new AlignmentTween(begin: beginAlign, end: new Alignment(endX, endY))
        .animate(
            new CurvedAnimation(parent: controller, curve: Curves.easeOut));
  }

  static Animation<double> frontCardRota(
      AnimationController controller, double beginRot) {
    return new Tween(begin: beginRot, end: 0.0).animate(
        new CurvedAnimation(parent: controller, curve: Curves.easeOut));
  }

  static Animation<Size?> backCardSize(
      AnimationController controller, Size beginSize, Size endSize) {
    return SizeTween(begin: beginSize, end: endSize)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
  }

  static Animation<Alignment> backCardAlign(AnimationController controller,
      Alignment beginAlign, Alignment endAlign) {
    return new AlignmentTween(begin: beginAlign, end: endAlign).animate(
        new CurvedAnimation(parent: controller, curve: Curves.easeOut));
  }
}

typedef TriggerListener = void Function(TriggerDirection? trigger);

class CardController {
  TriggerListener? _listener;

  void triggerLeft() {
    if (_listener != null) {
      _listener!(TriggerDirection.left);
    }
  }

  void triggerRight() {
    if (_listener != null) {
      _listener!(TriggerDirection.right);
    }
  }

  void triggerUp() {
    if (_listener != null) {
      _listener!(TriggerDirection.up);
    }
  }

  void triggerDown() {
    if (_listener != null) {
      _listener!(TriggerDirection.down);
    }
  }

  void addListener(listener) {
    _listener = listener;
  }

  void removeListener() {
    _listener = null!;
  }
}
*/
