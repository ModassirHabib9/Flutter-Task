import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/Widgets/color_resource.dart';

class Home_Screen_nine9 extends StatefulWidget {
  @override
  _Home_Screen_nine9State createState() => _Home_Screen_nine9State();
}

class _Home_Screen_nine9State extends State<Home_Screen_nine9> {
  bool showAvg = false;
  final List<List<double>> charts = [
    [0.4, 4, 7, 90]
  ];

  static final List<String> chartDropdownItems = [
    'Last 7 days',
    'Last month',
    'Last year'
  ];
  String actualDropdown = chartDropdownItems[0];
  int actualChart = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            shape: BoxShape.rectangle,
                            color: ColorResources.ORANGE),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/svg_logo.svg',
                            height: 20.0,
                            width: 25.0,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                      ),
                      const Text("    MEPA"),
                    ],
                  ),
                ],
              ),
              _buildTile(
                Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const <Widget>[
                                Text('Views',
                                    style: TextStyle(color: Colors.black)),
                                Text('273',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 34.0)),
                              ],
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 4.0)),
                        Sparkline(
                          data: charts[actualChart],
                          lineWidth: 2.0,
                          fillMode: FillMode.below,
                          useCubicSmoothing: true,
                          cubicSmoothingFactor: 0.2,
                          fillGradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.orange, Colors.orange.shade100],
                          ),
                          fillColor: Colors.orange.withOpacity(0.4),
                          lineColor: Colors.orange,
                        ),
                        SizedBox(height: 20),
                        Divider(height: 5, color: Colors.black),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text('Visitor(Clicks)',
                                style: TextStyle(color: Colors.black)),
                            Text('34',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 34.0)),
                          ],
                        ),
                        Column(
                          children: [
                            StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection("chart")
                                    .snapshots(),
                                builder: (context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  var chart;
                                  for (int i = 0;
                                      i < snapshot.data!.docs.length;
                                      i++) {
                                    chart = double.parse(
                                        snapshot.data!.docs[i]['data']);
                                  }
                                  return snapshot.data != null
                                      ? Column(
                                          children: [
                                            TextButton(
                                                onPressed: () {
                                                  print("object $chart");
                                                },
                                                child: Text("klsakl")),
                                            Sparkline(
                                              // data: <double>[09, 3, 5, 90],

                                              data: <double>[chart],
                                              lineWidth: 2.0,
                                              fillMode: FillMode.below,
                                              useCubicSmoothing: true,
                                              cubicSmoothingFactor: 0.2,
                                              fillGradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Colors.indigo,
                                                  Colors.indigo.shade100
                                                ],
                                              ),
                                              fillColor: Colors.indigo
                                                  .withOpacity(0.4),
                                              lineColor: Colors.indigo,
                                            ),
                                          ],
                                        )
                                      : Container();
                                }),
                          ],
                        )
                      ],
                    )),
                onTap: () {},
              ),
              SizedBox(height: 20),
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.all(8),
                            child: const Text(
                              "Post New Ad",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            )),
                        Container(
                          margin: EdgeInsets.all(8),
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.50,
                          child: const Text(
                              "Lorem ipsum dolor sit amet, cons ecetur adipiscing elit. Nam dapibus ac libero id "),
                        ),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          shape: BoxShape.rectangle,
                          color: Color(0xFFFFCC81)),
                      child: const Center(
                        child: Icon(
                          Icons.speaker_phone,
                          size: 33,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTile(Widget child, {required Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: InkWell(
            // Do onTap() if it isn't null, otherwise do print()
            // ignore: unnecessary_null_comparison
            onTap: onTap != null
                ? () => onTap()
                : () {
                    print('Not set yet');
                  },
            child: child));
  }
}
