import 'call_tab.dart';
import 'chat_tab.dart';
import 'controller/chat_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:flutter/material.dart';

import 'models/chat_model.dart';
import 'models/model_data.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatController chatController = Get.put(ChatController());
  PageController pageController = PageController();
  List<ChatModel> chat = ModelData.getChatData();
  List tabs = [ChatTab(), CallTab()];
  @override
  Widget build(BuildContext context) {
    return chat.isEmpty
        ? SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: Container(
                    padding: getPadding(
                      left: 20,
                      top: 15,
                      right: 20,
                      bottom: 15,
                    ),
                    decoration: AppDecoration.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Messages",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: AppStyle.txtAvenirBlack28,
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                CustomImageView(
                  svgPath: ImageConstant.imgCardBlue50,
                  height: getSize(140),
                  width: getSize(140),
                ),
                Padding(
                  padding: getPadding(top: 27),
                  child: Text(
                    "No messages yet",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtAvenirBlack28,
                  ),
                ),
                Padding(
                  padding: getPadding(top: 10, bottom: 243),
                  child: Text(
                    "Start a conversation with your doctor",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtBody,
                  ),
                ),
              ],
            ),
          )
        : GetBuilder<ChatController>(
            init: ChatController(),
            builder: (controller) => SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: Container(
                      padding: getPadding(
                        left: 20,
                        top: 15,
                        right: 20,
                        bottom: 15,
                      ),
                      decoration: AppDecoration.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Messages",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: AppStyle.txtAvenirBlack28,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: getMargin(top: 8, bottom: 8),
                      decoration: AppDecoration.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: getPadding(left: 0, top: 19, right: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.currentPage == 1
                                          ? pageController.previousPage(
                                              duration: const Duration(
                                                  milliseconds: 100),
                                              curve: Curves.bounceIn)
                                          : SizedBox();
                                      controller.setCurrentPage(0);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: controller
                                                              .currentPage ==
                                                          0
                                                      ? ColorConstant.cyan800
                                                      : ColorConstant
                                                          .gray200))),
                                      child: Padding(
                                        padding: getPadding(bottom: 5),
                                        child: Center(
                                          child: Text(
                                            "Chat",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: controller.currentPage == 0
                                                ? AppStyle.txtHeadlineCyan800
                                                : AppStyle.txtHeadline,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.currentPage == 0
                                          ? pageController.nextPage(
                                              duration: const Duration(
                                                  milliseconds: 100),
                                              curve: Curves.bounceIn)
                                          : SizedBox();
                                      controller.setCurrentPage(1);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: controller
                                                              .currentPage ==
                                                          1
                                                      ? ColorConstant.cyan800
                                                      : ColorConstant
                                                          .gray200))),
                                      child: Padding(
                                        padding: getPadding(bottom: 5),
                                        child: Center(
                                          child: Text(
                                            "Calls",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: controller.currentPage == 1
                                                ? AppStyle.txtHeadlineCyan800
                                                : AppStyle.txtHeadline,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: PageView.builder(
                              itemCount: 2,
                              onPageChanged: (value) {
                                controller.setCurrentPage(value);
                              },
                              controller: pageController,
                              itemBuilder: (context, index) {
                                return tabs[index];
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
