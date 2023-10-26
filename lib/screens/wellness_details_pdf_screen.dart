import 'dart:async';
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
//import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
//import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:video_player/video_player.dart';

import '../Util/Utils.dart';
import '../customwidgets/controls_overlay.dart';
import '../models/mymadallah_benefits_model.dart';

class WellnessDetailsPdfScreen extends StatefulWidget {
  const WellnessDetailsPdfScreen({
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
  State<WellnessDetailsPdfScreen> createState() =>
      _WellnessDetailsPdfScreenState();
}

class _WellnessDetailsPdfScreenState extends State<WellnessDetailsPdfScreen> {
  /*final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();*/
  PdfController? pdfController;
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  Future<File?>? filePathFuture;
  void _onBackButtonTap(context) {
    Navigator.of(context).pop();
  }

  bool isSearchProgress = false;
  File? filePath;

  @override
  void initState() {
    filePathFuture = _createFileFromString(
        widget.rewardsList[widget.index].document,
        widget.rewardsList[widget.index].docName,
        widget.rewardsList[widget.index].docType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isSearchProgress,
      child: Scaffold(
          backgroundColor: const Color(0xFFeeede7),
          appBar: AppBar(
              title: Text(
                widget.rewardsList[widget.index].benefitTitle!,
                style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
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
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, top: 20.0, right: 10.0, bottom: 10),
                child: getMyMadallahRewardDetailsWidget(
                    widget.rewardsList, widget.index),
              ))),
    );
  }

  Widget getMyMadallahRewardDetailsWidget(
      List<MyMadallahBenefitsModel>? myMadallahRewardsModelList, int index) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 8,
              child: getMyMadallahRewardWidget(
                myMadallahRewardsModelList![index],
              ),
            ),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 40.0, bottom: 0, left: 30.0, right: 30),
                  child: SingleChildScrollView(
                    child: Text(
                      myMadallahRewardsModelList[index].benefitDescription ??
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
              child: sharePDFButton(),
            )
          ],
        ),
      ),
    );
  }

  Widget getMyMadallahRewardWidget(
      MyMadallahBenefitsModel myMadallahRewardsModel) {
    return FutureBuilder<File?>(
      future: filePathFuture, // async work
      builder: (BuildContext context, AsyncSnapshot<File?> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(child: CupertinoActivityIndicator());
          default:
            if (snapshot.hasError) {
              return Text("${LocaleKeys.try_again.tr()} ${snapshot.error}");
            } else {
              if (snapshot.data != null) {
                Future<PdfDocument> pdfFuture =
                    PdfDocument.openFile(snapshot.data!.path);
                PdfControllerPinch pdfPinchController = PdfControllerPinch(
                  document: pdfFuture,
                );
                if (pdfPinchController != null) {
                  return PdfViewPinch(
                    scrollDirection: Axis.vertical,
                    controller: pdfPinchController!,
                    padding: 0,
                    onDocumentLoaded: (document) {},
                    /*renderer: (PdfPage page) => page.render(
                      width: page.width * 2,
                      height: page.height * 2,
                      format: PdfPageImageFormat.jpeg,
                      backgroundColor: '#FFFFFF',
                    ),*/
                  );
                } else {
                  return Container();
                }
              } else {
                return Container();
              }
            }
        }
      },
    );
  }

  /*Widget getMyMadallahRewardWidget1(
      MyMadallahBenefitsModel myMadallahRewardsModel) {
    return FutureBuilder<File?>(
      future: filePathFuture, // async work
      builder: (BuildContext context, AsyncSnapshot<File?> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(child: CupertinoActivityIndicator());
          default:
            if (snapshot.hasError) {
              return Text("${LocaleKeys.try_again.tr()} ${snapshot.error}");
            } else {
              if (snapshot.data != null) {
                pdfController = PdfController(
                  document: PdfDocument.openFile(snapshot.data!.path),
                );
                if (pdfController != null) {
                  return PdfView(
                    scrollDirection: Axis.vertical,
                    controller: pdfController!,
                    onDocumentLoaded: (document) {},
                    renderer: (PdfPage page) => page.render(
                      width: page.width * 2,
                      height: page.height * 2,
                      format: PdfPageImageFormat.jpeg,
                      backgroundColor: '#FFFFFF',
                    ),
                  );
                } else {
                  return Container();
                }
              } else {
                return Container();
              }

              
            }
        }
      },
    );
  }*/

  Widget sharePDFButton() {
    return Builder(
      builder: (BuildContext context) {
        return InkWell(
            onTap: () async {
              _onShareFromFilePath(context, widget.rewardsList[widget.index]);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            child: Container(
              width: 130,
              //height: 50,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFb89669)),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: const Color(0xFFb89669)),
              margin: const EdgeInsets.only(
                  top: 30.0, left: 10.0, right: 10.0, bottom: 10.0),
              child: Center(
                child: Text(
                  LocaleKeys.share.tr(),
                  style: const TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ));
      },
    );
  }

  Future<File?> _createFileFromString(
      String? resp, String? fileName, String? fileType) async {
    final encodedStr = resp;
    Uint8List bytes = base64.decode(encodedStr!);
    //Directory? tempDir = await DownloadsPathProvider.downloadsDirectory;
    Directory? tempDir = Platform.isIOS
        ? await getApplicationDocumentsDirectory()
        //: await DownloadsPathProvider.downloadsDirectory;
        : await getTemporaryDirectory();
    String tempPath = tempDir!.path;
    filePath = File('$tempPath/$fileName.$fileType');

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
    return filePath;
  }

  void _onShareFromFilePath(BuildContext context,
      MyMadallahBenefitsModel myMadallahRewardsModel) async {
    final box = context.findRenderObject() as RenderBox?;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    ShareResult shareResult;
    if (myMadallahRewardsModel.docLink != null &&
        myMadallahRewardsModel.docLink!.isNotEmpty) {
      File? filePath = await _createFileFromString(
          myMadallahRewardsModel.document,
          myMadallahRewardsModel.docName,
          myMadallahRewardsModel.docType);
      final files = <XFile>[];
      /*for (var i = 0; i < imagePaths.length; i++) {
        files.add(XFile(imagePaths[i], name: imageNames[i]));
      }*/
      files.add(XFile(filePath!.path, name: myMadallahRewardsModel.docName));
      shareResult = await Share.shareXFiles(files,
          text:
              "", //myMadallahRewardsModel.benefitTitle, //file + text share not working in iOS whatsapp
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
