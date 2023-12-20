import 'package:flutter/material.dart';
import 'package:health_care/doc_app.dart';

import 'core/di/dependency_injection.dart';


void main() {
  DependencyInjection.init();
  runApp(const DocApp());
}

