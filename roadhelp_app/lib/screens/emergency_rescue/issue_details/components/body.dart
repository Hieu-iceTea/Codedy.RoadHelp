import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/config/enums.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/helper/util.dart';
import 'package:roadhelp/models/issue.dart';
import 'package:roadhelp/providers/issue_provider.dart';
import 'package:roadhelp/repositories/issue_repository.dart';
import 'package:roadhelp/screens/emergency_rescue/send/wait_websocket/wait_websocket_screen.dart';

import '/components/default_button.dart';
import 'issue_description.dart';
import 'issue_rating.dart';
import 'map_image.dart';
import 'top_rounded_container.dart';

class Body extends StatefulWidget {
  Issue issue;
  bool isPartner;

  Body({Key? key, required this.issue, this.isPartner = false})
      : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Consumer<IssueProvider>(
      builder: (context, value, child) => CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            title: const Text(
              "Chi tiết sự cố",
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              Container(
                margin: EdgeInsets.only(right: getProportionateScreenWidth(15)),
                child: IconButton(
                  onPressed: () => {},
                  icon: const Icon(Icons.map),
                  tooltip: "Xem bản đồ",
                ),
              )
            ],
            //foregroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              background: MapImages(
                latitude: widget.issue.latitude,
                longitude: widget.issue.longitude,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                TopRoundedContainer(
                  color: Colors.white,
                  child: Column(
                    children: [
                      IssueDescription(
                        issue: widget.issue,
                        isPartner: widget.isPartner,
                      ),
                      TopRoundedContainer(
                        color: Color(0xFFF6F7F9),
                        child: Column(
                          children: [
                            if (widget.issue.status == IssueStatus.succeeded)
                              IssueRating(issue: widget.issue),
                            if (widget.issue.status == IssueStatus.sent)
                              Padding(
                                padding: EdgeInsets.only(
                                  left: SizeConfig.screenWidth * 0.15,
                                  right: SizeConfig.screenWidth * 0.15,
                                  bottom: getProportionateScreenWidth(40),
                                  top: getProportionateScreenWidth(15),
                                ),
                                child: DefaultButton(
                                  text: "Tôi muốn đi hỗ trợ",
                                  press: () => _partnerConfirmMember(context),
                                ),
                              ),
                            if (widget.issue.status ==
                                    IssueStatus.memberConfirmPartner &&
                                widget.isPartner)
                              Padding(
                                padding: EdgeInsets.only(
                                  left: SizeConfig.screenWidth * 0.15,
                                  right: SizeConfig.screenWidth * 0.15,
                                  bottom: getProportionateScreenWidth(40),
                                  top: getProportionateScreenWidth(15),
                                ),
                                child: DefaultButton(
                                  text: "Đánh dấu hoàn thành",
                                  press: () => {},
                                ),
                              ),
                            const SizedBox(
                              height: 200,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
        //child: Body(issue: arguments.issue),
      ),
    );
  }

  //Phần này chỉ dành cho luồng gửi-nhận cứu hộ (làm thế này hơi ẩu, nên tách ra. nhưng kệ đi) - Hiếu iceTea
  Future<void> _partnerConfirmMember(context) async {
    try {
      // 01. Tạo & Gửi xác nhận: Partner muốn hỗ muốn trợ Member (issue)
      String message = await Provider.of<IssueProvider>(context, listen: false)
          .partnerConfirmMember(widget.issue);

      // 02. Chờ WebSocket phản hồi: đã có partner nhận hay chưa
      Navigator.pushNamed(
        context,
        WaitWebSocketScreen.routeName,
        arguments: WaitWebSocketArguments(
          message: "Chỉ một lúc thôi...\nHệ thống đang tìm người hỗ trợ bạn.",
          destination:
              '/topic/issue/partnerWaitMember/' + widget.issue.id.toString(),
          callback: (stompFrame) =>
              _callbackWebSocket(stompFrame, widget.issue.id!),
          onCancel: () {},
        ),
      );
    } catch (error) {
      await Util.showDialogNotification(
          context: context, content: error.toString());
    }
  }

  //Phần này chỉ dành cho luồng gửi-nhận cứu hộ (làm thế này hơi ẩu, nên tách ra. nhưng kệ đi) - Hiếu iceTea
  Future<void> _callbackWebSocket(stompFrame, int issueId) async {
    if (stompFrame.body != null) {
      Map<String, dynamic> response = json.decode(stompFrame.body!);
      IssueStatus issueStatus = IssueStatus.values.firstWhere(
        (element) =>
            element.toString() ==
            "IssueStatus." + response['data']['issueStatus'],
      );

      if (issueStatus == IssueStatus.memberConfirmPartner) {
        Issue issueReload = await IssueRepository.findById(issueId);

        Navigator.pop(context); //Thoát màn hình chờ WebSocket

        setState(() {
          widget.issue = issueReload;
        });
      }
    }
  }
}
