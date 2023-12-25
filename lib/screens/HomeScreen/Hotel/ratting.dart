import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RattingScreen extends StatefulWidget {
  const RattingScreen({Key? key, this.documentId,this.name,this.photoProfile}) : super(key: key);
  final String? documentId;
  final String? name, photoProfile;

  @override
  State<RattingScreen> createState() => _RattingScreenState();
}

class _RattingScreenState extends State<RattingScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  IconData? _selectedIcon;
  String? rating;
  bool _isVertical = false;
  double? _rating;
  TextEditingController questions = TextEditingController();

  _check() async {
    SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    prefs.setString(widget.documentId ?? '' + "Rating", "2");
  }
  void addData() {

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'reviewTitle',
          style: TextStyle(fontFamily: "Sofia", color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 20.0, left: 20.0, top: 15.0),
        child: ListView(
          children: <Widget>[
            Form(
              key: _form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'giveYourRatting',
                    style: TextStyle(
                        fontFamily: "Sofia",
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  RatingBar.builder(
                    initialRating: 5,
                    itemBuilder: (context, index) => Icon(
                      _selectedIcon ?? Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 50.0,
                    unratedColor: Colors.amber.withAlpha(50),
                    direction: _isVertical ? Axis.vertical : Axis.horizontal,
                    onRatingUpdate: (rating) {
                      setState(() {
                        _rating = rating;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: TextFormField(
                      // ignore: missing_return
                      validator: (input) {
                        if (input?.isEmpty ?? false ) {
                          return 'pleaseInputYourReview';
                        }
                      },
                      maxLines: 6,
                      onSaved: (input) => rating = input,
                      controller: questions,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      style: TextStyle(
                          fontFamily: "WorkSansSemiBold",
                          fontSize: 16.0,
                          color: Colors.black),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 0.5,
                                color: Colors.black12.withOpacity(0.01))),
                        contentPadding: EdgeInsets.all(13.0),
                        hintText: 'inputYourReview',
                        hintStyle:
                        TextStyle(fontFamily: "Sans", fontSize: 15.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70.0,
                  ),
                  InkWell(
                    onTap: () async {
                      SharedPreferences prefs;
                      prefs = await SharedPreferences.getInstance();
                      _check();

                      final formState = _form.currentState;
                      if (prefs.getString(widget.documentId ?? '' + "Rating") ==
                          null) {
                        if (formState?.validate() ?? false) {
                          formState?.save();
                          setState(() {});

                          addData();
                        }
                      } else {
                        setState(() {});
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                    'error'),
                                content: Text('youCantReviewTwoTimes'),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('close'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            });
                      }
                    },
                    child: Container(
                      height: 52.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius:
                          BorderRadius.all(Radius.circular(40.0))),
                      child: Center(
                        child: Text(
                          'inputData',
                          style: TextStyle(
                              fontFamily: "Sofia",
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
