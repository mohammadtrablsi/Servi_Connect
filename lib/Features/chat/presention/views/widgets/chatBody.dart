import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:servi_connect/Features/chat/domain/entites/viewChatEntity.dart';
import 'package:servi_connect/Features/chat/presention/mangers/makeChatCubit.dart';
import 'package:servi_connect/Features/chat/presention/mangers/socketChatCubit.dart';
import 'package:servi_connect/Features/chat/presention/mangers/viewChatCubit.dart';
import 'package:servi_connect/Features/chat/presention/views/widgets/textFieldOfChat.dart';
import 'package:servi_connect/constants.dart';
import 'package:servi_connect/main.dart';
import 'package:sizer/sizer.dart';
// import 'package:timeago/timeago.dart' as timeago;

class ChatBody extends StatelessWidget {
  const ChatBody(
      {super.key, required this.realTimeData, required this.idOfAnother});
  final realTimeData;
  final String idOfAnother;

  @override
  Widget build(BuildContext context) {
    final makeChatCubit = context.read<MakeChatCubit>();
    final viewChatCubit = context.read<ViewChatCubit>();
    final socketChatCubit = context.read<SocketChatCubit>();
    if (realTimeData != null) {
      viewChatCubit.setRealTimeData(realTimeData);
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
            )),
        title: Text(
          'chat',
          style: TextStyle(
              fontSize: 17.sp,
              // color: AppColor.iconColor,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          BlocBuilder<ViewChatCubit, ViewChatState>(builder: (context, state) {
            if (state is ViewChatLoading) {
              return const CircularProgressIndicator();
            } else if (state is ViewChatFailure) {
              return const Text('error');
            } else if (state is ViewChatSuccess) {
              viewChatCubit.messages = state.ViewChats;
              return Expanded(
                child: ListView.builder(
                  // controller: controller.scrollController,
                  // reverse: true,
                  padding: EdgeInsetsDirectional.only(bottom: 1.w),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        // AMessage(),
                        message(
                            state,
                            index,
                            state.ViewChats[index].sender ==
                                prefs?.getString('id'))
                      ],
                    );
                  },
                  itemCount: state.ViewChats.length,
                ),
              );
            } else {
              return const SizedBox();
            }
          }),
          TextFieldOfChat(
            controlle: viewChatCubit.chatController,
            onpressed: () {
              viewChatCubit.addMessageToScreen();
              socketChatCubit.SocketSocketChat(headers: {
                'token': prefs?.getString('token')
              }, data: {
                "userId": idOfAnother, //"667c5faeb0ecf3b6cf29b2f1"
                "text": viewChatCubit.chatController.text,
              });
              makeChatCubit.MakeMakeChat(headers: {
                'token': prefs?.getString('token')
              }, data: {
                "isUser": prefs?.getString('role') == 'user',
                "id": idOfAnother,
                "text": viewChatCubit.chatController.text,
              });
              viewChatCubit.chatController.clear();
            },
          ),
        ],
      ),
    );
  }

  Widget message(state, index, isMe) {
    return Directionality(
      textDirection: isMe ? TextDirection.ltr : TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Container(
            //   transform: Matrix4.translationValues(0.0, 2.5.h, 0.0),
            //   width: 10.0.w,
            //   height: 10.0.w,
            //   decoration: const BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: kPrimaryColor,
            //   ),
            //   child: Center(
            //       child: Text(
            //     'u',
            //     style: TextStyle(color: Colors.white, fontSize: 20.sp),
            //   )),
            // ),
            // SizedBox(width: 2.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Material(
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(30),
                            bottomRight: isMe
                                ? const Radius.circular(30)
                                : const Radius.circular(0),
                            topRight: const Radius.circular(30),
                            bottomLeft: isMe
                                ? const Radius.circular(0)
                                : const Radius.circular(30),
                          ),
                          elevation: 5,
                          color: isMe
                              ? const Color.fromARGB(255, 209, 205, 205)
                              : const Color.fromARGB(255, 150, 191, 211),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("",
                                    style: TextStyle(
                                      fontSize: 11.5.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    )),
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.only(bottom: 0.8.w),
                                  child: Text(
                                    state.ViewChats[index].text,
                                    style: TextStyle(
                                      fontSize: 11.5.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.only(end: 4.w, bottom: 0.9.w),
                        child: const Text(' '),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
