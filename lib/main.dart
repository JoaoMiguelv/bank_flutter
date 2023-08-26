import 'package:flutter/material.dart';

void main() => runApp(
      const Column(
        children: [
          Text(
            'Bem vindo ao primeiro Texto Flutter',
            textDirection: TextDirection.ltr,
          ),
          Text(
            'Bem vindo ao segundo Texto Flutter',
            textDirection: TextDirection.ltr,
          ),
          Expanded(
            child: FittedBox(
              fit: BoxFit.contain, // otherwise the logo will be tiny
              child: FlutterLogo(),
            ),
          ),
        ],
      ),
    );