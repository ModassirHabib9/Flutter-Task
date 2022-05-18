import 'package:flutter/material.dart';
import 'package:untitled/Widgets/text_field.dart';

class Advertiser_Tab extends StatefulWidget {
  @override
  _Advertiser_TabState createState() => _Advertiser_TabState();
}

class _Advertiser_TabState extends State<Advertiser_Tab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              /*mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,*/
              children: [
                SizedBox(height: 40),
                Hide_TextField(
                  hint: "Email",
                  width: double.infinity,
                  onChange: () {},
                  kry: TextInputType.name,
                  suffixIcon: const Icon(Icons.arrow_forward_ios),
                  prefixIcon: const Icon(Icons.email),
                  // controller: controller,
                  // decoration: decoration
                ),
                const SizedBox(height: 10),
                Hide_TextField(
                  hint: "Location",
                  width: double.infinity,
                  onChange: () {},
                  kry: TextInputType.name,
                  suffixIcon: const Icon(Icons.arrow_forward_ios),
                  prefixIcon: const Icon(Icons.location_on_rounded),
                  // controller: controller,
                  // decoration: decoration
                ),
                const SizedBox(height: 10),
                Hide_TextField(
                  hint: "About",
                  width: double.infinity,
                  onChange: () {},
                  kry: TextInputType.name,
                  suffixIcon: const Icon(Icons.arrow_forward_ios),
                  prefixIcon: const Icon(Icons.watch_later),
                  // controller: controller,
                  // decoration: decoration
                ),
                const SizedBox(height: 10),
                Hide_TextField(
                  hint: "Rate this App",
                  width: double.infinity,
                  onChange: () {},
                  kry: TextInputType.name,
                  suffixIcon: const Icon(Icons.arrow_forward_ios),
                  prefixIcon: const Icon(Icons.star_rate),
                  // controller: controller,
                  // decoration: decoration
                ),
                const SizedBox(height: 10),
                Hide_TextField(
                  hint: "Logout",
                  width: double.infinity,
                  onChange: () {},
                  kry: TextInputType.name,
                  suffixIcon: const Icon(Icons.arrow_forward_ios),
                  prefixIcon: const Icon(Icons.logout),
                  // controller: controller,
                  // decoration: decoration
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
