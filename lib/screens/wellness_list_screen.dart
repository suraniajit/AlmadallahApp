import 'dart:convert';
import 'dart:io';
import 'package:almadalla/Util/string_extension.dart';
import 'package:almadalla/apiaccess/RestDatasource.dart';
import 'package:almadalla/models/DownloadFileModel.dart';
import 'package:almadalla/models/LoginData.dart';
import 'package:almadalla/screens/rewards_details_screen.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:almadalla/translation/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../models/UserSettingsBloc.dart';
import '../models/mymadallah_benefits_model.dart';
import 'LanguageBloc.dart';
import 'wellness_details_pdf_screen.dart';
import 'wellness_details_video_screen.dart';

class WellnessListScreen extends StatefulWidget {
  const WellnessListScreen(
      {Key? key, required this.title, required this.loginData})
      : super(key: key);

  final String title;
  final LoginData? loginData;
  @override
  State<WellnessListScreen> createState() => _WellnessListScreenState();
}

class _WellnessListScreenState extends State<WellnessListScreen> {
  void _onBackButtonTap(context) {
    /*Navigator.of(context).push(
      MaterialPageRoute(
          builder: (_) => DashBoardPage(
                title: '',
              )),
    );*/

    Navigator.of(context).pop();
  }

  bool isSearchProgress = false;
  int _selectedIndex = 0;
  Future<List<MyMadallahBenefitsModel>?>? myMadallahBenefitsModelList;
  File? filePath;

  Future _createFileFromString(String? resp, String? fileName) async {
    final encodedStr = resp;
    Uint8List bytes = base64.decode(encodedStr!);
    //Directory? tempDir = await DownloadsPathProvider.downloadsDirectory;
    Directory? tempDir = Platform.isIOS
        ? await getApplicationDocumentsDirectory()
        : await DownloadsPathProvider.downloadsDirectory;
    String tempPath = tempDir!.path;
    filePath = File('$tempPath/$fileName');

    try {
      if (!Platform.isIOS) {
        var status = await Permission.storage.status;
        if (!status.isGranted) {
          await Permission.storage.request();
        }
      }

      await filePath!.writeAsBytes(bytes);
      if (kDebugMode) {
        print("----------filepath-----------${filePath!.path}");
      }
    } on FileSystemException catch (err) {
      throw Exception(err.message);
    } on Exception catch (err) {
      throw Exception(err.toString());
    } catch (err) {
      throw Exception(err.toString());
    }
    return filePath!.path;
  }

  @override
  void initState() {
    languageBloc = Provider.of<LanguageBloc>(context, listen: false);
    userSettingsBloc = Provider.of<UserSettingsBloc>(context, listen: false);
    myMadallahBenefitsModelList = RestDatasource().getMyMadallahBenefitsList(
        widget.loginData,
        2,
        languageBloc!.getLanguage(),
        userSettingsBloc!.getUserProfile()!.memberKey);
    super.initState();
  }

  _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
      isSearchProgress = true;
    });
  }

  UserSettingsBloc? userSettingsBloc;
  LanguageBloc? languageBloc;

  @override
  Widget build(BuildContext context) {
    userSettingsBloc = Provider.of<UserSettingsBloc>(context, listen: false);

    return AbsorbPointer(
      absorbing: isSearchProgress,
      child: Scaffold(
          backgroundColor: const Color(0xFFeeede7),
          appBar: AppBar(
              title: Text(widget.title),
              backgroundColor: const Color(0xFFeeede7),
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.black),
              actions: const <Widget>[],
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Colors.black87,
                  onPressed: () {
                    _onBackButtonTap(context);
                  })),
          body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                // borderRadius: BorderRadius.all(Radius.circular(100.0)),
                image: const DecorationImage(
                  image: AssetImage("assets/login.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(children: [
                Center(
                  child: Text(
                    LocaleKeys.enayaWellness.tr(),
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Expanded(
                    // flex: 17,
                    child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, top: 20.0, right: 10.0, bottom: 10),
                  child: FutureBuilder<List<MyMadallahBenefitsModel>?>(
                    future: myMadallahBenefitsModelList, // async work
                    builder: (BuildContext context,
                        AsyncSnapshot<List<MyMadallahBenefitsModel>?>
                            snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const Center(
                              child: CupertinoActivityIndicator());
                        default:
                          if (snapshot.hasError) {
                            return Text(
                              LocaleKeys.try_again.tr(),
                            );
                          } else {
                            return getRewardsListWidget(snapshot.data);
                          }
                      }
                    },
                  ),
                )),
              ]))),
    );
  }

  Widget getMyMadallahRewardsRowWidget(
      MyMadallahBenefitsModel myMadallahRewardsModel) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 1.0, right: 1),
                child: SizedBox(
                  width: 100,
                  height: 80,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    child: myMadallahRewardsModel.image!.isNotEmpty
                        ? /*Image.network('${myMadallahRewardsModel.image}',
                            fit: BoxFit.cover)*/
                        Image.memory(
                            base64Decode(myMadallahRewardsModel.image!),
                            fit: BoxFit.cover)
                        : Image.asset(
                            'assets/icons/defaults/default_food_thumb.jpg',
                            fit: BoxFit.cover),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25),
                  child: SizedBox(
                    height: 80,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        // myMadallahRewardsModel.benefitTitle!.camelCase(),
                        myMadallahRewardsModel.benefitTitle!,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
                child: VerticalDivider(
                  color: Colors.grey,
                  thickness: 1.5,
                  indent: 0,
                  endIndent: 0,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: myMadallahRewardsModel.docType == 'pdf'
                      ? Image.asset('assets/pdf.png',
                          fit: BoxFit.cover,
                          width: 30,
                          height: 30,
                          color: const Color(0xFFb7956c))
                      : Image.asset('assets/play.png',
                          fit: BoxFit.cover,
                          width: 30,
                          height: 30,
                          color: const Color(0xFFb7956c)))
            ]),
      ),
    );
  }

  Widget getRewardsListWidget(
      List<MyMadallahBenefitsModel>? myMadallahRewardsModelList) {
    return SingleChildScrollView(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(children: [
                  ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: myMadallahRewardsModelList!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            myMadallahRewardsModelList[index].docType == 'pdf'
                                ? Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            WellnessDetailsPdfScreen(
                                                title: '',
                                                loginData: widget.loginData,
                                                rewardsList:
                                                    myMadallahRewardsModelList,
                                                index: index)),
                                  )
                                : Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            WellnessDetailsVideoScreen(
                                                title: '',
                                                loginData: widget.loginData,
                                                benefitsList:
                                                    myMadallahRewardsModelList,
                                                index: index)),
                                  );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: getMyMadallahRewardsRowWidget(
                                myMadallahRewardsModelList[index]),
                          ),
                        );
                      }),
                ])
              ],
            )));
  }
}
