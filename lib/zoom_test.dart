import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ZoomableWidget(),
    );
  }
}

class ZoomableWidget extends StatefulWidget {
  @override
  _ZoomableWidgetState createState() => _ZoomableWidgetState();
}

class _ZoomableWidgetState extends State<ZoomableWidget> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zoomable Widget'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: InteractiveViewer(
              boundaryMargin: const EdgeInsets.all(20.0),
              minScale: 0.5,
              maxScale: 4.0,
              onInteractionUpdate: (details) {
                setState(() {
                  _scale = details.scale;
                });
              },
              transformationController: Matrix4TransformController(),
              child: Container(
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Zoom Me!',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.zoom_out),
                onPressed: () {
                  setState(() {
                    _scale -= 0.2;
                  });
                },
              ),
              Slider(
                value: _scale,
                min: 0.5,
                max: 4.0,
                onChanged: (value) {
                  setState(() {
                    _scale = value;
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.zoom_in),
                onPressed: () {
                  setState(() {
                    _scale += 0.2;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Matrix4TransformController extends TransformationController {
  Matrix4TransformController() : super();

  void reset() {
    value = Matrix4.identity();
  }
}
