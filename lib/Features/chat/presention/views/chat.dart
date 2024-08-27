import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servi_connect/Features/chat/data/repos/chatRepoImp.dart';
import 'package:servi_connect/Features/chat/domain/useCases/MakeChatUseCase.dart';
import 'package:servi_connect/Features/chat/domain/useCases/viewChatUseCase.dart';
import 'package:servi_connect/Features/chat/presention/mangers/makeChatCubit.dart';
import 'package:servi_connect/Features/chat/presention/mangers/socketChatCubit.dart';
import 'package:servi_connect/Features/chat/presention/mangers/viewChatCubit.dart';
import 'package:servi_connect/core/socketServices.dart';
import 'package:servi_connect/core/utils/functions/setup_service_locator.dart';
import 'package:servi_connect/main.dart';

import '../../domain/useCases/SocketChatUseCase.dart';
import 'widgets/chatBody.dart';

class Chat extends StatefulWidget {
  const Chat({super.key, required this.idOfAnother});
  final String idOfAnother;

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var socketService = SocketServices.instance;
  var socketMessage;
  @override
  void initState() {
    super.initState();
    socketService.connectAndListen();
    socketService.onLoginEvent = (data) => {
          setState(() {
            socketMessage = data;
          })
        };
    socketService.onLogoutEvent = (data) => {
          setState(() {
            socketMessage = data;
          })
        };
    socketService
        .joinSession(prefs!.getString('id')!); //667c5faeb0ecf3b6cf29b2f1
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) {
              print("gggggggggggggggggggggg${widget.idOfAnother}");
              print(
                prefs?.getString('role'),
              );
              return ViewChatCubit(
                ViewChatUseCase(
                  chatRepo: getIt.get<ChatRepoImpl>(),
                ),
              )..viewViewChat(headers: {
                  'token': prefs?.getString('token')
                }, data: {
                  "isUser": prefs?.getString('role') == 'user',
                  "id": widget.idOfAnother
                  // "id1": "6644c510b8c0fbaf276f97e5"
                });
            },
          ),
          BlocProvider(
            create: (BuildContext context) {
              return MakeChatCubit(
                MakeChatUseCase(
                  chatRepo: getIt.get<ChatRepoImpl>(),
                ),
              );
            },
          ),
          BlocProvider(
            create: (BuildContext context) {
              return SocketChatCubit(
                SocketChatUseCase(
                  chatRepo: getIt.get<ChatRepoImpl>(),
                ),
              );
            },
          ),
        ],
        child: ChatBody(
            realTimeData: socketMessage, idOfAnother: widget.idOfAnother),
      ),
    );
  }
}
