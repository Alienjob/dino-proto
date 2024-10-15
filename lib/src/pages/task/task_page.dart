import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:dino_proto/src/core/core_bloc.dart';
import 'package:dino_proto/src/theme/text.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  static const routeName = '/task';

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  WebViewController? controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel(
        'SendFlipsCountToFlutter',
        onMessageReceived: (JavaScriptMessage message) {
          try {
            double flips = double.parse(message.message);
            context
                .read<CoreBloc>()
                .add(CoreEvent.webPageData(flips: flips.ceil()));
          } catch (e) {
            print('Error parsing flips count: $e');
          }
        },
      )
      ..loadRequest(Uri.parse('http://localhost:8080/index.html'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<CoreBloc, CoreState>(builder: (context, coreState) {
          return Text('Task. Flips: ${coreState.flips}');
        }),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              controller?.runJavaScript('tapRandomTile()');
            },
          ),
        ],
      ),
      body: (controller == null)
          ? const CircularProgressIndicator()
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                      'Game above is written in HTML, CSS, and JavaScript. (not by me)',
                      style: text.subtitle),
                  Text(
                      'On app bar of this page you can see number of flips and button to tap random tile in game.',
                      style: text.subtitle),
                  Text(
                      'It illustrates two way communication between Flutter and Webview.',
                      style: text.subtitle),
                  const SizedBox(height: 16),
                  Expanded(child: WebViewWidget(controller: controller!)),
                ],
              ),
            ),
    );
  }
}
