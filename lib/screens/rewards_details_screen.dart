import 'dart:convert';
import 'dart:io';
import 'package:almadalla/Util/string_extension.dart';
import 'package:almadalla/apiaccess/RestDatasource.dart';
import 'package:almadalla/models/DownloadFileModel.dart';
import 'package:almadalla/models/LoginData.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:almadalla/translation/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

import '../Util/Utils.dart';
import '../models/mymadallah_benefits_model.dart';

class RewardsDetailsScreen extends StatefulWidget {
  const RewardsDetailsScreen({
    Key? key,
    required this.title,
    required this.loginData,
    required this.rewardsList,
    required this.index,
  }) : super(key: key);

  final String title;
  final LoginData? loginData;
  final List<MyMadallahBenefitsModel> rewardsList;
  final int index;
  @override
  State<RewardsDetailsScreen> createState() => _RewardsDetailsScreenState();
}

class _RewardsDetailsScreenState extends State<RewardsDetailsScreen> {
  void _onBackButtonTap(context) {
    Navigator.of(context).pop();
  }

  bool isSearchProgress = false;
  File? filePath;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    LocaleKeys.mymadallahrewards.tr(),
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 20.0, right: 10.0, bottom: 10),
                    child: getMyMadallahRewardDetailsWidget(
                        widget.rewardsList, widget.index),
                  ),
                )
              ]))),
    );
  }

  Widget getMyMadallahRewardDetailsWidget(
      List<MyMadallahBenefitsModel>? myMadallahRewardsModelList, int index) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        //height: MediaQuery.of(context).size.height * .8,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: getMyMadallahRewardWidget(
              myMadallahRewardsModelList![index],
            )));
  }

  Widget getMyMadallahRewardWidget(
      MyMadallahBenefitsModel myMadallahRewardsModel) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.only(left: 0.0, right: 0),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
                child: myMadallahRewardsModel.image!.isNotEmpty
                    ? Image.memory(base64Decode(myMadallahRewardsModel.image!),
                        fit: BoxFit.cover)
                    : Image.asset(
                        'assets/icons/defaults/default_food_thumb.jpg',
                        fit: BoxFit.cover),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 25.0, bottom: 5, left: 30.0, right: 30),
              child: Text(
                //myMadallahRewardsModel.benefitTitle!.camelCase(),
                myMadallahRewardsModel.benefitTitle!,
                softWrap: false,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 25.0, bottom: 5, left: 30.0, right: 30),
                child: SingleChildScrollView(
                  child: Text(
                    myMadallahRewardsModel.benefitDescription ??
                        //'No description sdsdfsdfsdfasdasd asdad asdasda das das dasd asd asd asd ad asd dsf sdf sdfsd f sdf sdf sdf sd f sd f sdf sdf sdf sdf sdfsdfsdf sdf sd fs   uuuuuuuuuuuuuuuuuuuuuuuuuu sdsdfsdfsdfasdasd asdad asdasda das das dasd asd asd asd ad asd dsf sdf sdfsd f sdf sdf sdf sd f sd f sdf sdf sdf sdf sdfsdfsdf sdf sd fs   uuuuuuuuuuuuuuuuuuuuuuuuuu sdsdfsdfsdfasdasd asdad asdasda das das dasd asd asd asd ad asd dsf sdf sdfsd f sdf sdf sdf sd f sd f sdf sdf sdf sdf sdfsdfsdf sdf sd fs   uuuuuuuuuuuuuuuuuuuuuuuuuu sdsdfsdfsdfasdasd asdad asdasda das das dasd asd asd asd ad asd dsf sdf sdfsd f sdf sdf sdf sd f sd f sdf sdf sdf sdf sdfsdfsdf sdf sd fs   uuuuuuuuuuuuuuuuuuuuuuuuuu sdsdfsdfsdfasdasd asdad asdasda das das dasd asd asd asd ad asd dsf sdf sdfsd f sdf sdf sdf sd f sd f sdf sdf sdf sdf sdfsdfsdf sdf sd fs   uuuuuuuuuuuuuuuuuuuuuuuuuu sdsdfsdfsdfasdasd asdad asdasda das das dasd asd asd asd ad asd dsf sdf sdfsd f sdf sdf sdf sd f sd f sdf sdf sdf sdf sdfsdfsdf sdf sd fs   xxxxxx',
                        'No description',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Nunito',
                    ),
                  ),
                ),
              )),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 25.0, bottom: 5, left: 30.0, right: 30),
                child: Text(
                  LocaleKeys.language.tr() == 'arabic'
                      ? '${LocaleKeys.offer_validity.tr()} : ${Utils.getDateFormattedArabic(myMadallahRewardsModel.benefitFrom)} to ${Utils.getDateFormattedArabic(myMadallahRewardsModel.benefitTill)}'
                      : '${LocaleKeys.offer_validity.tr()} : ${Utils.getDateFormatted(myMadallahRewardsModel.benefitFrom)} to ${Utils.getDateFormatted(myMadallahRewardsModel.benefitTill)}',
                  // 'No description sdsdfsdfsdfasdasd asdad asdasda das das dasd asd asd asd ad asd dsf sdf sdfsd f sdf sdf sdf sd f sd f sdf sdf sdf sdf sdfsdfsdf sdf sd fs   uuuuuuuuuuuuuuuuuuuuuuuuuu',
                  // 'No description',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nunito',
                  ),
                ),
              )),
          Builder(
            builder: (BuildContext context) {
              return AbsorbPointer(
                absorbing: !(myMadallahRewardsModel.document != null &&
                    myMadallahRewardsModel.document!.isNotEmpty),
                child: InkWell(
                    onTap: () async {
                      _onShareFromFilePath(context, myMadallahRewardsModel);
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    child: Container(
                      width: 130,
                      //height: 50,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: (myMadallahRewardsModel.document != null &&
                                  myMadallahRewardsModel.document!.isNotEmpty)
                              ? const Color(0xFFb89669)
                              : const Color.fromARGB(255, 235, 225, 212),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: (myMadallahRewardsModel.document != null &&
                                myMadallahRewardsModel.document!.isNotEmpty)
                            ? const Color(0xFFb89669)
                            : const Color.fromARGB(255, 235, 225, 212),
                      ),
                      margin: const EdgeInsets.only(
                          top: 20.0, left: 10.0, right: 10.0, bottom: 30.0),
                      child: Center(
                        child: Text(
                          LocaleKeys.share.tr(),
                          style: const TextStyle(
                              fontSize: 17, color: Colors.white),
                        ),
                      ),
                    )),
              );
            },
          )
        ]);
  }

  Future _createFileFromString(
      String? resp, String? fileName, String? fileType) async {
    final encodedStr = resp;
    Uint8List bytes = base64.decode(encodedStr!);
    //Directory? tempDir = await DownloadsPathProvider.downloadsDirectory;
    Directory? tempDir = Platform.isIOS
        ? await getApplicationDocumentsDirectory()
        //: await DownloadsPathProvider.downloadsDirectory;
        : await getTemporaryDirectory();
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

  void _onShareFromFilePath(BuildContext context,
      MyMadallahBenefitsModel myMadallahRewardsModel) async {
    final box = context.findRenderObject() as RenderBox?;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    ShareResult shareResult;
    if (myMadallahRewardsModel.document != null &&
        myMadallahRewardsModel.document!.isNotEmpty) {
      String filePath = await _createFileFromString(
          myMadallahRewardsModel.document,
          myMadallahRewardsModel.docName,
          myMadallahRewardsModel.docType);
      final files = <XFile>[];
      /*for (var i = 0; i < imagePaths.length; i++) {
        files.add(XFile(imagePaths[i], name: imageNames[i]));
      }*/
      files.add(XFile(filePath, name: myMadallahRewardsModel.docName));
      shareResult = await Share.shareXFiles(files,
          text:
              "", //myMadallahRewardsModel.benefitTitle,  //file + text share not working in iOS whatsapp
          subject: "",
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    } else {
      shareResult = await Share.shareWithResult("",
          subject: "",
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    }
    //scaffoldMessenger.showSnackBar(getResultSnackBar(shareResult));
  }

  void _onShareFromURL(BuildContext context,
      MyMadallahBenefitsModel myMadallahRewardsModel) async {
    // A builder is used to retrieve the context immediately
    // surrounding the ElevatedButton.
    //
    // The context's `findRenderObject` returns the first
    // RenderObject in its descendent tree when it's not
    // a RenderObjectWidget. The ElevatedButton's RenderObject
    // has its position and size after it's built.
    final box = context.findRenderObject() as RenderBox?;

    if (myMadallahRewardsModel.docLink!.isNotEmpty) {
      final files = <XFile>[];
      /*for (var i = 0; i < imagePaths.length; i++) {
        files.add(XFile(imagePaths[i], name: imageNames[i]));
      }*/

      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
        //add more permission to request here.
      ].request();

      String savename = '';
      String savePath = '';

      if (statuses[Permission.storage]!.isGranted) {
        var dir = await DownloadsPathProvider.downloadsDirectory;
        if (dir != null) {
          //savename = "image_dnl.png";
          savename = "${myMadallahRewardsModel.benefitTitle!}.pdf";
          savePath = dir.path + "/$savename";
          if (kDebugMode) {
            print(savePath);
          }
          //output:  /storage/emulated/0/Download/banner.png

          try {
            await Dio().download(
                //'https://th.bing.com/th/id/OIP.iSu2RcCcdm78xbxNDJMJSgHaEo?pid=ImgDet&rs=1',
                //'http://rayanlabs.com/harris/F5%20Corporate%20Profile.pdf',
                myMadallahRewardsModel.docLink!,
                savePath, onReceiveProgress: (received, total) {
              if (total != -1) {
                if (kDebugMode) {
                  print((received / total * 100).toStringAsFixed(0) + "%");
                }
                //you can build progressbar feature too
              }
            });
            if (kDebugMode) {
              print("File is saved to download folder.");
            }
          } on DioError catch (e) {
            if (kDebugMode) {
              print(e.message);
            }
          }
        }
      } else {
        if (kDebugMode) {
          print("No permission to read and write.");
        }
      }
      files.add(XFile(savePath, name: savename));
      await Share.shareXFiles(files,
          text: myMadallahRewardsModel.benefitTitle,
          subject: "",
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    } else {
      await Share.share(myMadallahRewardsModel.benefitTitle!,
          subject: "",
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    }
  }

  void _onShareXFileFromAssets(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final data = await rootBundle.load('assets/flutter_logo.png');
    final buffer = data.buffer;
    final shareResult = await Share.shareXFiles(
      [
        XFile.fromData(
          buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
          name: 'flutter_logo.png',
          mimeType: 'image/png',
        ),
      ],
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );

    scaffoldMessenger.showSnackBar(getResultSnackBar(shareResult));
  }

  SnackBar getResultSnackBar(ShareResult result) {
    return SnackBar(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Share result: ${result.status}"),
          if (result.status == ShareResultStatus.success)
            Text("Shared to: ${result.raw}")
        ],
      ),
    );
  }
}
