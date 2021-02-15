import 'package:flutter/material.dart';

class FifteenBanner extends StatefulWidget {
  @override
  _FifteenBannerState createState() => _FifteenBannerState();
}

class _FifteenBannerState extends State<FifteenBanner> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: Text("15日天气预报"),
        ),
        Container(
          height: 275,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return FifteenItem();
            },
            itemCount: 16,
          ),
        ),
        Divider(height: 1),
      ],
    );
  }
}

class FifteenItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Text("周一"),
          SizedBox(height: 8),
          Text("2-14"),
          SizedBox(height: 8),
          Text("50%", style: TextStyle(color: Colors.blue)),
          SizedBox(height: 8),
          Icon(Icons.wb_sunny_rounded),
          SizedBox(height: 8),
          Text("晴"),
          SizedBox(height: 8),
          Text("26°"),
          SizedBox(height: 4),
          Text("16°"),
          SizedBox(height: 8),
          Icon(Icons.cloud_rounded),
          SizedBox(height: 8),
          Text("多云"),
        ],
      ),
    );
  }
}
