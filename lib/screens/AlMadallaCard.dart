import 'dart:convert';
import 'dart:typed_data';
import 'package:almadalla/Util/Utils.dart';
import 'package:almadalla/apiaccess/RestDatasource.dart';
import 'package:almadalla/models/AlMadallaMemberModel.dart';
import 'package:almadalla/models/LoginData.dart';
import 'package:almadalla/models/UserSettingsBloc.dart';
import 'package:almadalla/translation/local_keys.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import '../apiaccess/Session.dart';
import '../models/Constants.dart';
// import 'LanguageBloc.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'dart:math' as Math;
import 'package:http/http.dart' as http;
import 'package:vector_math/vector_math.dart';

// This screen shoul dnot change direction, hence not used easy_localization @Harris

class AlMadallaCard extends StatefulWidget {
  AlMadallaCard({
    Key? key,
    required this.title, required this.alMadallaCardFuture,
    // required this.loginData,
    // required this.alMadallaCardModelFuture
  }):super(key: key);
  final String title;
  AlMadallaMemberModel? alMadallaCardFuture;
  @override
  _AlMadallaCardState createState() => _AlMadallaCardState();
}
class _AlMadallaCardState extends State<AlMadallaCard> with SingleTickerProviderStateMixin {
  // var title;
  // try
  // _AlMadallaCardState({Key? key,
  //   required this.title,
  //   required this.alMadallaCardFuture,
  //   // required this.loginData,
  //   // required this.alMadallaCardModelFuture
  // }):super(key: key);
  // end try
  final con = FlipCardController();
  UserSettingsBloc? userSettingsBloc;

  Session networkSession = new Session();
  String itemCount = "null";
  String itemCount1 = "null";
  bool _loaded = false;


  void initState() {
    print('previousmemberdetails => ${widget.alMadallaCardFuture}');
    userSettingsBloc = Provider.of<UserSettingsBloc>(context, listen: false);
    (() async {
      var alMadallaCardModel;
      http.Response response = await networkSession.get(
        url: Constants.MemberCardImageUrl +"/"+ (widget.alMadallaCardFuture!.memberKey.toString()),
        authorization:  userSettingsBloc!.getLoginData()!.authorization.toString(),
      );
      print('ajit => ${Constants.MemberCardImageUrl + "/"+(widget.alMadallaCardFuture!.memberKey.toString())}');
      print('getAlmaddaCard Response => ${response.body}');
      if (mounted) {
        setState(() {
          var data = response.body;
          var jsonResponse = jsonDecode(data);
          itemCount = jsonResponse['CardImage_Front'];
          itemCount1 = jsonResponse['CardImage_Back'];
          print('image_fetch_time => ${Image.memory(Base64Decoder().convert(jsonResponse['CardImage_Front']))}');
        });
      }
    })();
    super.initState();

  }

  void _onChangePasswordEnd(context) {
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Color(0xFFeeede7),
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xff000000)),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Color(0xff000000),
              onPressed: () {

                _onChangePasswordEnd(context);
              })
      ),

      body: Container(
        // physics: NeverScrollableScrollPhysics(),
        // margin: const EdgeInsets.symmetric(vertical: 20),
        child: Container(
          // color: Color(0xff000000),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            // borderRadius: BorderRadius.all(Radius.circular(100.0)),
            image: DecorationImage(
              image: AssetImage("assets/login.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding (
            padding: const EdgeInsets.only(
                left: 10.0, top: 10.0, right: 10.0, bottom: 10),
            child: RotatedBox(
              quarterTurns: 3,
              child: Container(
                // width: MediaQuery.of(context).size.width ,
                // height: MediaQuery.of(context).size.height * 0.5,
                child: FlipCard(
                    rotateSide: RotateSide.right,
                    onTapFlipping: false,
                    axis: FlipAxis.horizontal,
                    controller: con,
                    frontWidget: Stack(
                      children: <Widget>[
                        Container(
                            decoration: new BoxDecoration(color: Color(0xffffff)),
                            alignment: Alignment.center,
                            // height: MediaQuery.of(context).size.height,
                            // width: MediaQuery.of(context).size.width,
                            child: _displayMedia(itemCount, context)
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: new IconButton(
                            onPressed: () {
                              con.flipcard();
                            },
                            icon: Icon(Icons.flip_camera_android),),
                        )
                      ],
                    ),
                    backWidget: Stack(
                      children: <Widget>[
                        Container(
                            decoration: new BoxDecoration(color: Color(0xffffff)),
                            alignment: Alignment.center,
                            // height: 240,
                            child: _displayMedia(itemCount1, context)
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: new IconButton(
                            onPressed: () {
                              con.flipcard();
                            },
                            icon: Icon(Icons.flip_camera_android),),
                        )
                      ],
                    )

                  // Container(
                  //   // height: MediaQuery.of(context).size.height,
                  //   // width: MediaQuery.of(context).size.width,
                  //   // alignment: Alignment.topCenter,
                  //     transformAlignment: Alignment.centerLeft,
                  //     // MediaQuery
                  //     //     .of(context)
                  //     //     .size
                  //     //     .height,
                  //
                  //
                  //
                  //     child: _displayMedia(itemCount1, context)
                  // ),
                  // child:TextDecoration.combine(decorations=decor)
                ),
              ),
            ),
          ),

        ),
      ),
    );
    // }


  }


}

Widget _displayMedia(String itemCount, BuildContext context) {
  if(itemCount == "null") {
    return new Container();
  }else {
    Uint8List bytes = Base64Decoder().convert(itemCount);
    return  new Image.memory(
      bytes,
      // height: MediaQuery.of(context).size.height * 0.5,
      // width: MediaQuery.of(context).size.width,
      fit: BoxFit.fitWidth,
    );

  }
}

/*
//start backup of image loading code
Widget _displayMedia(String itemCount, BuildContext context) {
  if(itemCount == "null") {
    return new Container();
  }else {
    Uint8List bytes = Base64Decoder().convert(itemCount);
    return new Image.memory(
      bytes,
      // height: MediaQuery.of(context).size.height * 0.5,
      // width: MediaQuery.of(context).size.width,
      fit: BoxFit.fill,
    );
  }
}
//end coding of display media
 */











/*
class _AlMadallaCardState extends State<AlMadallaCard> {
 // Future<AlMadallaMemberModel?>? alMadallaCardFuture;
  void initState() {
    // alMadallaCardFuture =
    //     RestDatasource().getAlMadallaMemberDetailsListCard(widget.loginData) ;

    super.initState();
  }
  bool value = false;
  void _onChangePasswordEnd(context) {
    Navigator.of(context).pop();
  }

  UserSettingsBloc? userSettingsBloc;
  LanguageBloc? bloc;
  @override
  Widget build(BuildContext context) {
    userSettingsBloc = Provider.of<UserSettingsBloc>(context, listen: false);
    bloc = Provider.of<LanguageBloc>(context);

    String? val=Utils.getLanguage();
    print("Utils.getLanguage() --> $val");
    if(val =="arabic"){
      value =true;
    }else{
      value =false;
    }

    return  Scaffold(
        backgroundColor: Color(0xFFeeede7),
        appBar: AppBar(
            title: Text(widget.title),
            backgroundColor: Color(0xFFeeede7),
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            leading:  value ==true? IconButton(
                alignment: Alignment.centerRight,
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.black87,
                onPressed: () {
                  _onChangePasswordEnd(context);
                }):IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.black87,
                onPressed: () {
                  _onChangePasswordEnd(context);
                })
        ),
        //drawer: CustomDrawer(),
        body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                // borderRadius: BorderRadius.all(Radius.circular(100.0)),
                image: DecorationImage(
                  image: AssetImage("assets/login.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child:

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child:   value ==true? Text(
                      "بطاقة المظلة",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ):Text(
                      "Almadallah Card",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ),
                  InkWell(
                      onTap: () {},
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, top: 15.0, right: 15.0),
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: Container(
                                width: MediaQuery.of(context).size.height * .7,
                                //height: 100,
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: ClipPath(
                                            clipper: ShapeBorderClipper(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                              topRight: Radius.circular(15.0),
                                              topLeft: Radius.circular(15.0),
                                            ))),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                ),

                                                child: Align(
                                                  alignment:
                                                      Alignment.topLeft,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(2.0),
                                                    child: Image(
                                                        image: AssetImage(
                                                            'assets/logo.png')),
                                                  ),
                                                ),

                                            ),
                                          ),
                                        ),
                                    getCardDataWidget(widget.alMadallaCardFuture),
                                        Expanded(
                                          flex: 2,
                                          child: Center(
                                            child: Text(
                                              "Note: Pre-approval required for: Dental, Maternity, Optical, Inpatient and Hearing Aids\nToll Free Number: 80043444",
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Color(0xFFb7956c)),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        )
                                      ],
                                    ))),
                          ))),
                ],
              ),
            )));
  }
  var cardKeys = Map<int, GlobalKey<FlipCardState>>();
  late GlobalKey<FlipCardState> lastFlipped;
  Widget getCardDataWidget(AlMadallaMemberModel? alMadallaCardModel) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Expanded(
        flex: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex : 4,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex : 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Payer:",
                            style:GoogleFonts.poppins(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Name:",
                            style: GoogleFonts.poppins(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "DOB:",
                            style: GoogleFonts.poppins(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Card No:",
                            style: GoogleFonts.poppins(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Emirates ID:",
                            style: GoogleFonts.poppins(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Employee ID:",
                            style:GoogleFonts.poppins(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex : 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              //"Rak Insurance",
                              alMadallaCardModel != null
                                  ? alMadallaCardModel.payer ?? 'No data'
                                  : 'No data',
                              style: GoogleFonts.poppins(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              //"Sheikh Ali Khan",
                              //alMadallaCardModel!.nameEnglish ?? 'No data',
                              alMadallaCardModel != null
                                  ? alMadallaCardModel.nameEnglish ?? 'No data'
                                  : 'No data',
                              style:GoogleFonts.poppins(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              //"01-Jan-1983",
                              //alMadallaCardModel.dob ?? 'No data',
                              alMadallaCardModel != null
                                  ? Utils.getDateFormatted(
                                      alMadallaCardModel.dob)
                                  : 'No data',
                              style: GoogleFonts.poppins(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              //"1267256",
                              //alMadallaCardModel.cardNo ?? 'No data',
                              alMadallaCardModel != null
                                  ? alMadallaCardModel.cardNo ?? 'No data'
                                  : 'No data',
                              style:GoogleFonts.poppins(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              //"784199300000006",
                              //alMadallaCardModel.emiratesIDNo ?? 'No data',
                              alMadallaCardModel != null
                                  ? alMadallaCardModel.emiratesIDNo ?? 'No data'
                                  : 'No data',
                              style:GoogleFonts.poppins(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              //"ACT-EID003",
                              //alMadallaCardModel.employeeID ?? 'No data',
                              alMadallaCardModel != null
                                  ? alMadallaCardModel.employeeID ?? 'No data'
                                  : 'No data',
                              style: GoogleFonts.poppins(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex : 3,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex : 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Policy No:",
                              style: GoogleFonts.poppins(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "Category:",
                              style: GoogleFonts.poppins(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "Network:",
                              style: GoogleFonts.poppins(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w700,),
                            ),
                            Text(
                              "Effective Date:",
                              style: GoogleFonts.poppins(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w700,

                              ),
                            ),
                            Text(
                              "Expiry Date:",
                              style:GoogleFonts.poppins(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "",
                              style:GoogleFonts.poppins(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                            ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex : 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              //"IF1001EA",
                              alMadallaCardModel != null
                                  ? alMadallaCardModel.policyNo ?? 'No data'
                                  : 'No data',
                              style: GoogleFonts.poppins(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              //"Category A",
                              alMadallaCardModel != null
                                  ? alMadallaCardModel.category ?? 'No data'
                                  : 'No data',
                              style:GoogleFonts.poppins(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              //"GN+",
                              alMadallaCardModel != null
                                  ? alMadallaCardModel.network ?? 'No data'
                                  : 'No data',
                              style: GoogleFonts.poppins(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              //"01-Jan-2021",
                              alMadallaCardModel != null
                                  ? Utils.getDateFormatted(
                                      alMadallaCardModel.policyStartDate)
                                  : 'No data',
                              style: GoogleFonts.poppins(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              //"31-May-2021",
                              alMadallaCardModel != null
                                  ? Utils.getDateFormatted(
                                      alMadallaCardModel.policyEndDate)
                                  : 'No data',
                              style:GoogleFonts.poppins(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "",
                              style:GoogleFonts.poppins(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )));
  }
}*/
