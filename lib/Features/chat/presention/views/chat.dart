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

import '../../domain/useCases/SocketChatUseCase.dart';
import 'widgets/chatBody.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

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
    socketService.joinSession("667c5faeb0ecf3b6cf29b2f1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) {
              return ViewChatCubit(
                ViewChatUseCase(
                  chatRepo: getIt.get<ChatRepoImpl>(),
                ),
              )..viewViewChat(headers: {
                  'token':
                      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NzQ2N2M3NjNkMzRhMTc5NDQ1MzJmNiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzE4OTgyMzM0fQ.93wEZ8D1B4B9yS9omgH1zudyUvcDf43Gr0jIer7aydE'
                }, data: {
                  "isUser": true,
                  "id": "6644bdffd078b7fc6d634016",
                  "id1": "6644c510b8c0fbaf276f97e5"
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
        child: ChatBody(realTimeData: socketMessage),
      ),
    );
  }
}
