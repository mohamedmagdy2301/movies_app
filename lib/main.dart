import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies_app/core/constant.dart';
import 'package:movies_app/core/utils/service_locator.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/movies_app.dart';

void main() async {
  runApp(const MovieApp());
  setupSericeLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieEntityAdapter());
  await Hive.openBox<MovieEntity>(kMoviesBox);
}
