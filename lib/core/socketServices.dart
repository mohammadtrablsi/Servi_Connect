import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class SocketServices {
  static final SocketServices instance = SocketServices._internal();
  IO.Socket? socket;

  SocketServices._internal();

  Function(dynamic data)? onLoginEvent;
  Function(dynamic data)? onLogoutEvent;

  void connectAndListen() {
    socket ??= IO.io('http://10.0.2.2:3500',
        IO.OptionBuilder().setTransports(['websocket']).build());

    socket!.onConnect((data) => {
          print("connected to socket"),
        });

    socket!.on(
        'session-expired',
        (data) => {
              onLogoutEvent?.call(data),
            });

    socket!.on(
        'session-join',
        (data) => {
              onLoginEvent?.call(data),
            });
  }

  void joinSession(String userId) {
    socket!.emit('user-join', userId);
  }

  void dispose() {
    socket!.disconnect();
  }
}
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// class SocketServices {
//   static final SocketServices instance = SocketServices._internal();
//   late IO.Socket socket; // Marked as late

//   SocketServices._internal();

//   Function(dynamic data)? onLoginEvent;
//   Function(dynamic data)? onLogoutEvent;

//   void connectAndListen() {
//     socket = IO.io('http://10.0.2.2:3500',
//         IO.OptionBuilder().setTransports(['websocket']).build());

//     socket.onConnect((_) {
//       print("connected to socket");
//     });

//     socket.on('session-expired', (data) {
//       onLogoutEvent?.call(data);
//       print(data);
//     });

//     socket.on('session-join', (data) {
//       onLoginEvent?.call(data);
//       print(data);
//     });
//   }

//   void joinSession(String userId) {
//     socket.emit('user-join', userId);
//   }

//   void dispose() {
//     socket.disconnect();
//   }
// }
