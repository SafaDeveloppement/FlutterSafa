import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:applicationpef/models/chatModel.dart';
import 'package:applicationpef/models/messageModel.dart';
import 'package:applicationpef/chatCustomUI/OwnMessageCard.dart';
import 'package:applicationpef/chatCustomUI/ReplyCard.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:applicationpef/constante/constante.dart';

class IndividualPage extends StatefulWidget {
  final ChatModel? chatModel;
  final ChatModel? sourchat;

  IndividualPage({Key? key, this.chatModel, this.sourchat}) : super(key: key);

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  late IO.Socket socket;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _controller = TextEditingController();
  bool showEmojiPicker = false;
  bool sendButton = false;
  List<MessageModel> messages = [];

  @override
  void initState() {
    super.initState();
    connect();

    _controller.addListener(() {
      setState(() {
        sendButton = _controller.text.isNotEmpty;
      });
    });
  }

  void connect() {
    socket = IO.io('$URL', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket.connect();
    socket.emit('signin', widget.sourchat?.id);

    socket.onConnect((_) {
      print('Connected');
      socket.on('message', (msg) {
        print(msg);
        setMessage('destination', msg['message']);
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    });
    print(socket.connected);
  }

  void sendMessage(String message, int sourceId, int targetId) {
    setMessage('source', message);
    socket.emit('message', {
      'message': message,
      'sourceId': sourceId,
      'targetId': targetId,
    });
  }

  void setMessage(String type, String message) {
    MessageModel messageModel = MessageModel(
      type: type,
      message: message,
      time: DateTime.now().toString().substring(11, 16),
    );

    setState(() {
      messages.add(messageModel);
    });
  }

  void toggleEmojiPicker() {
    setState(() {
      showEmojiPicker = !showEmojiPicker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 130, 65, 173),
        title: Text(widget.chatModel?.name ?? ''),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
          IconButton(icon: Icon(Icons.call), onPressed: () {}),
        ],
      ),
      body: Container(
        color: Color.fromARGB(255, 249, 238, 247),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  if (message.type == 'source') {
                    return OwnMessageCard(
                      message: message.message,
                      time: message.time,
                    );
                  } else {
                    return ReplyCard(
                      message: message.message,
                      time: message.time,
                    );
                  }
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.emoji_emotions),
                    onPressed: toggleEmojiPicker,
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        sendMessage(
                          _controller.text,
                          widget.sourchat?.id ?? 0,
                          widget.chatModel?.id ?? 0,
                        );
                        _controller.clear();
                        setState(() {
                          sendButton = false;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
            if (showEmojiPicker)
              EmojiPicker(
                onEmojiSelected: (Category? category, Emoji emoji) {
                  _controller.text += emoji.emoji;
                },
              ),
          ],
        ),
      ),
    );
  }
}
