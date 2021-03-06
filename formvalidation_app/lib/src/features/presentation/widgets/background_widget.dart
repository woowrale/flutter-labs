import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildBackgroundStack(context);
  }

  Widget _buildBackgroundStack(BuildContext context) {
    return Stack(
      children: [
        _buildBackground(context),
        _buildContainer(),
        Positioned(child: _buildBackgroundCircle(), top: 90.0, left: 30.0),
        Positioned(child: _buildBackgroundCircle(), top: -40.0, right: -30.0),
        Positioned(
            child: _buildBackgroundCircle(), bottom: -50.0, right: -10.0),
        Positioned(child: _buildBackgroundCircle(), bottom: 120.0, right: 20.0),
        Positioned(child: _buildBackgroundCircle(), bottom: -50.0, left: -20.0),
      ],
    );
  }

  Widget _buildBackground(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.45,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(63, 63, 156, 1.0),
          Color.fromRGBO(90, 70, 178, 1.0),
        ]),
      ),
    );
  }

  Widget _buildBackgroundCircle() {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );
  }

  Widget _buildContainer() {
    return Container(
      padding: EdgeInsets.only(top: 80.0),
      child: Column(
        children: [
          Icon(Icons.person_pin_circle, color: Colors.white, size: 100.0),
          SizedBox(height: 10.0, width: double.infinity),
          Text('Woowrale',
              style: TextStyle(color: Colors.white, fontSize: 25.0)),
        ],
      ),
    );
  }
}
