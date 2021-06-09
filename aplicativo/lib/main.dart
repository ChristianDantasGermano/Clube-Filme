import 'package:aplicativo/app/shared/app_module.dart';
import 'package:aplicativo/app/shared/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() => runApp(ModularApp(module: AppModule(), child: AppWidget()));
