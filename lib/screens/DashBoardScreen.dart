import 'package:almadalla/customwidgets/CustomDrawer.dart';
import 'package:almadalla/models/UserSettingsBloc.dart';
import 'package:almadalla/screens/AlMadallaCard.dart';
import 'package:almadalla/screens/AlMadallaCardListScreen.dart';
import 'package:almadalla/screens/ContactScreen.dart';
import 'package:almadalla/screens/LoginPage.dart';
import 'package:almadalla/screens/MemberDetailsScreen.dart';
import 'package:almadalla/screens/MemberUtilizationsScreen.dart';
import 'package:almadalla/screens/ProviderSearchScreen.dart';
import 'package:almadalla/screens/SettingsScreen.dart';
import 'package:almadalla/screens/SubmitClaimsScreen.dart';
import 'package:almadalla/translation/local_keys.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
//import 'package:zendesk2/zendesk2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'NotificationDetailsScreen.dart';
import 'TrackClaimScreen.dart';
import 'ZendeskChat.dart';
import 'ZendeskWebChat.dart';
import 'rewards_list_screen.dart';
import 'wellness_list_screen.dart';

class DashBoardPage extends StatefulWidget {
  DashBoardPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  void _onSignInEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => LoginPage(title: '')),
    );
  }

  int _topFlex = 2;
  int _bottomFlex = 11;
  int _crossAxisCount = 10;
  int _noOfRows = 5;

  double _spacing = 2.0;
  int _noOfSpacesBetweenRows = 8;
  final int _correction = 20;

  List<StaggeredTile> getTileSpacings(
      context, UserSettingsBloc? userSettingsBloc) {
    //double _cellHeight = (MediaQuery.of(context).size.height*(3/4)/5)-12;
    double cellHeight = (MediaQuery.of(context).size.height *
            (_bottomFlex / (_topFlex + _bottomFlex)) /
            _noOfRows) -
        _correction;
    if (kDebugMode) {
      print("CEll height is ----> $cellHeight");
    }
    List<StaggeredTile> cardTiles;

    if (userSettingsBloc != null &&
        userSettingsBloc.getUserProfile() != null &&
        userSettingsBloc.getUserProfile()!.isEnayaMember) {
      cardTiles = <StaggeredTile>[
        StaggeredTile.extent(6, cellHeight),
        StaggeredTile.extent(4, cellHeight),
        StaggeredTile.extent(4, cellHeight),
        StaggeredTile.extent(6, cellHeight),
        StaggeredTile.extent(6, cellHeight),
        StaggeredTile.extent(4, cellHeight),
        StaggeredTile.extent(4, cellHeight),
        StaggeredTile.extent(6, cellHeight),
        StaggeredTile.extent(6, cellHeight),
        StaggeredTile.extent(4, cellHeight),
      ];
    } else {
      cardTiles = <StaggeredTile>[
        StaggeredTile.extent(6, cellHeight),
        StaggeredTile.extent(4, cellHeight),
        StaggeredTile.extent(4, cellHeight),
        StaggeredTile.extent(6, cellHeight),
        StaggeredTile.extent(6, cellHeight),
        //StaggeredTile.extent(10, _cellHeight),
        StaggeredTile.extent(4, cellHeight),
        StaggeredTile.extent(10, cellHeight),
        StaggeredTile.extent(6, cellHeight),
        StaggeredTile.extent(4, cellHeight),
      ];
    }

    return cardTiles;
  }

  List<Widget> getTiles(context, UserSettingsBloc? userSettingsBloc) {
    List<Widget> cardTiles;
    if (userSettingsBloc != null &&
        userSettingsBloc.getUserProfile() != null &&
        userSettingsBloc.getUserProfile()!.isEnayaMember) {
      cardTiles = [
        almadallahCard(),
        memberDetails(),
        providerSearch(),
        memberUtilization(),
        trackClaims(),
        submitClaims(),
        wellnessVideosAndDocs(),
        myMadallahRewards(),
        contactUS(),
        settings(),
      ];
    } else {
      cardTiles = [
        almadallahCard(),
        memberDetails(),
        providerSearch(),
        memberUtilization(),
        trackClaims(),
        submitClaims(),
        //wellnessVideosAndDocs(),
        myMadallahRewards(),
        contactUS(),
        settings(),
      ];
    }

    return cardTiles;
  }

  Material MyItems(String icon, String heading) {
    return Material(
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: Color(0xFFb7956c),
          child: Align(
            alignment: Alignment.center,
            child: Container(
                height: 40.0,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icon',
                      width: 150.0,
                      height: 50.0,
                    ),
                    Text(heading),
                  ],
                )),
          )),
    );
  }

  UserSettingsBloc? userSettingsBloc;
  @override
  Widget build(BuildContext context) {
    userSettingsBloc = Provider.of<UserSettingsBloc>(context, listen: false);
    return WillPopScope(
        onWillPop: () => _onWillPop(),
        child: Scaffold(
          backgroundColor: Color(0xFFeeede7),
          appBar: AppBar(
            centerTitle: true,
            title: Image.asset(
              'assets/logo.png',
              width: 50.0,
              height: 50.0,
            ),
            // Text(
            //   widget.title,
            //   textAlign: TextAlign.center,
            //   style: TextStyle(color: Colors.black),
            // ),
            backgroundColor: Color(0xFFeeede7),
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            /*leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.black87,
                onPressed: () {
                  //_onChangePasswordEnd(context);
                })*/
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: IconButton(
                  icon: Icon(Icons.notifications_outlined),
                  onPressed: () {
                    print("Hereeeee---");
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NotificationDetailsScreen(
                              title: "",
                              loginData: userSettingsBloc!.getLoginData(),
                            )));
                  },
                ),
              )
            ],
          ),
          drawer: CustomDrawer(),
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    image: AssetImage("assets/login.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    /*Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: GestureDetector(
                                        onTap:
                                            () {}, // handle your image tap here
                                        child: IconButton(
                                          icon: Icon(Icons.arrow_back_ios),
                                          color: Colors.black,
                                          onPressed: () {
                                            _onSignInEnd(context);
                                          },

                                          // leading: Icon(Icons.arrow_back_ios,color: Colors.white,
                                          // ),
                                        ))),
                                Text(
                                  "DashBoard",
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.black),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Stack(children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.arrow_back_ios),
                                        onPressed: () {},
                                      ),

                                      // ),
                                    ])),
                              ]),

                          //),
                        ]),
                  ),
                ),*/
                    Expanded(
                      flex: _topFlex,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: EdgeInsets.only(left: 15, top: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 15, right: 15, top: 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          LocaleKeys.hello.tr(),
                                          style: const TextStyle(
                                              fontSize: 25.0,
                                              color: Colors.black87),
                                        ),
                                        Text(
                                          //"John Doe",

                                          userSettingsBloc!.getUserProfile() !=
                                                  null
                                              ? userSettingsBloc!
                                                      .getUserProfile()!
                                                      .name ??
                                                  'No data'
                                              : 'No data',
                                          style: const TextStyle(
                                              fontSize: 30.0,
                                              color: Color(0xFF515151),
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Image(
                                      image: (userSettingsBloc!
                                                      .getUserProfile() !=
                                                  null &&
                                              userSettingsBloc!
                                                      .getUserProfile()!
                                                      .gender !=
                                                  null)
                                          ? (userSettingsBloc!
                                                      .getUserProfile()!
                                                      .gender!
                                                      .toUpperCase() ==
                                                  'MALE'
                                              ? AssetImage(
                                                  'assets/${LocaleKeys.maleImage.tr()}')
                                              : AssetImage(
                                                  'assets/${LocaleKeys.femaleImage.tr()}'))
                                          : AssetImage(
                                              'assets/${LocaleKeys.personImage.tr()}')),
                                )
                              ],
                            )),
                      ),
                    ),
                    Expanded(
                      flex: _bottomFlex,
                      child: Container(
                        //color: Colors.blue,
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 15, right: 15, top: 0.0),
                          child: Container(
                            //height: 500,
                            child: StaggeredGridView.count(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                crossAxisCount: _crossAxisCount,
                                mainAxisSpacing: _spacing,
                                crossAxisSpacing: _spacing,
                                staggeredTiles: getTileSpacings(
                                    context, userSettingsBloc), //_cardTile,
                                children: getTiles(context, userSettingsBloc)),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ),
          /*floatingActionButton: FloatingActionButton(
            heroTag: 'customChat',
            child: Icon(
              FontAwesomeIcons.comments,
              color: Colors.white,
            ),
            backgroundColor: new Color(0xFF70b0c2), //Colors.white,//
            //onPressed: () => zendesk(false, context), // mobile access
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ZendeskWebChat(title: "")));
            })*/ // web access
        ));
  }

  Widget memberUtilization() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (_) => MemberUtilizationPage(
                    title: '',
                    loginData: userSettingsBloc!.getLoginData(),
                  )),
        );
      },
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          //#c5a56a
          color: Color(0xFFc5a56a),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
                //height: 40.0,
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/member-utilization.png',
                    width: 40.0,
                    height: 40.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10, top: 5),
                  child: Text(LocaleKeys.member_utilization.tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF2a2421),
                      )),
                ),
              ],
            )),
          )),
    );
  }

  Widget memberDetails() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (_) => MemberDetailsPage(
                  title: '', loginData: userSettingsBloc!.getLoginData())),
        );
      },
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: Color(0xFFc5a56a),
          child: Align(
            alignment: Alignment.center,
            child: Container(
                //height: 40.0,
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/member-details.png',
                    width: 40.0,
                    height: 40.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10, top: 5),
                  child: Text(LocaleKeys.member_details.tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF2a2421),
                      )),
                ),
              ],
            )),
          )),
    );
  }

  Widget providerSearch() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (_) => ProviderSearchPage(
                  title: '', loginData: userSettingsBloc!.getLoginData())),
        );
      },
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: Color(0xFFc5a56a),
          child: Align(
            alignment: Alignment.center,
            child: Container(
                //height: 40.0,
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/provider-search.png',
                    width: 40.0,
                    height: 40.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10, top: 5),
                  child: Text(LocaleKeys.provider_search.tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF2a2421),
                      )),
                ),
              ],
            )),
          )),
    );
  }

  Widget almadallahCard() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (_) => AlMadallaCardListScreen(
                  title: '', loginData: userSettingsBloc!.getLoginData())),
        );
      },
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: Color(0xFFc5a56a),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/card.png',
                    width: 40.0,
                    height: 40.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10, top: 5),
                  child: Text(LocaleKeys.al_madallah_card.tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF2a2421),
                      )),
                ),
              ],
            ),
          )),
    );
  }

  Widget submitClaims() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (_) => SubmitClaimsPage(
                    title: '',
                    loginData: userSettingsBloc!.getLoginData(),
                  )),
        );
      },
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: Color(0xFFc5a56a),
          child: Align(
            alignment: Alignment.center,
            child: Container(
                //height: 40.0,
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/submit.png',
                    width: 40.0,
                    height: 40.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10, top: 5),
                  child: Text(LocaleKeys.submit_claims.tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF2a2421),
                      )),
                ),
              ],
            )),
          )),
    );
  }

  Widget trackClaims() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (_) => TrackClaimsPage(
                    title: '',
                    loginData: userSettingsBloc!.getLoginData(),
                  )),
        );
      },
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: Color(0xFFc5a56a),
          child: Align(
            alignment: Alignment.center,
            child: Container(
                //height: 40.0,
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/track.png',
                    width: 40.0,
                    height: 40.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10, top: 5),
                  child: Text(LocaleKeys.track_claims.tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF2a2421),
                      )),
                ),
              ],
            )),
          )),
    );
  }

  Widget settings() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (_) => SettingsPage(
                  title: '', loginData: userSettingsBloc!.getLoginData())),
        );
      },
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: Color(0xFFc5a56a),
          child: Align(
            alignment: Alignment.center,
            child: Container(
                //height: 40.0,
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/settings.png',
                    width: 40.0,
                    height: 40.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10, top: 5),
                  child: Text(LocaleKeys.settings.tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF2a2421),
                      )),
                ),
              ],
            )),
          )),
    );
  }

  Widget contactUS() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (_) => ContactPage(
                    title: '',
                  )),
        );
      },
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: Color(0xFFc5a56a),
          child: Align(
            alignment: Alignment.center,
            child: Container(
                //height: 40.0,
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/contact.png',
                    width: 40.0,
                    height: 40.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10, top: 5),
                  child: Text(LocaleKeys.contact_us.tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF2a2421),
                      )),
                ),
              ],
            )),
          )),
    );
  }

  Widget wellnessVideosAndDocs() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (_) => WellnessListScreen(
                  title: '', loginData: userSettingsBloc!.getLoginData())),
        );
      },
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: Color(0xFFc5a56a),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/wellness.png',
                    width: 50.0,
                    height: 50.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10, top: 5),
                  child: Text(LocaleKeys.enayaWellness.tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF2a2421),
                      )),
                ),
              ],
            ),
          )),
    );
  }

  Widget myMadallahRewards() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (_) => RewardsListScreen(
                  title: '', loginData: userSettingsBloc!.getLoginData())),
        );
      },
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: Color(0xFFc5a56a),
          child: Align(
            alignment: Alignment.center,
            child: Container(
                //height: 40.0,
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/rewards.png',
                    width: 50.0,
                    height: 50.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10, top: 5),
                  child: Text(LocaleKeys.mymadallahrewards.tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF2a2421),
                      )),
                ),
              ],
            )),
          )),
    );
  }

  /*void zendesk(bool isNativeChat, BuildContext context) async {
    String accountKey = 'A0AR1RleLRFaXB6SdfcbsVl65Oct0XMp';
    String appId = '334995813126242305';

    String name = 'Al Madalla Chat Agent';
    String email = 'chat@almadalla.com';
    String phoneNumber = '+916282358076';

    Zendesk2Chat z = Zendesk2Chat.instance;

    await z.logger(true);

    await z.init(accountKey, appId, iosThemeColor: Colors.yellow);

    await z.setVisitorInfo(
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      tags: ['app', 'zendesk2_plugin'],
    );
    await z.customize(
      departmentFieldStatus: PRE_CHAT_FIELD_STATUS.HIDDEN,
      emailFieldStatus: PRE_CHAT_FIELD_STATUS.HIDDEN,
      nameFieldStatus: PRE_CHAT_FIELD_STATUS.HIDDEN,
      phoneFieldStatus: PRE_CHAT_FIELD_STATUS.HIDDEN,
      transcriptChatEnabled: true,
      agentAvailability: false,
      endChatEnabled: true,
      offlineForms: true,
      preChatForm: true,
      transcript: true,
    );

    if (isNativeChat) {
      await z.startChat(
        toolbarTitle: 'Talk to us',
        backButtonLabel: 'Back',
        botLabel: 'bip bop boting',
      );
    } else {
      await Zendesk2Chat.instance.startChatProviders();

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ZendeskChat()));
    }
  }*/

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: Text("Are you sure you want to logout?"),
            actions: <Widget>[
              TextButton(
                child: Text("No"),
                onPressed: () => {Navigator.pop(context, false)},
              ),
              TextButton(
                child: Text("Yes"),
                onPressed: () => {SystemNavigator.pop()},
              ),
            ],
          ),
        )) ??
        false;
  }
}
