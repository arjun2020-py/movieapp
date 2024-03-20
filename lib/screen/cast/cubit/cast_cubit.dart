import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../model/cast_model.dart';
part 'cast_state.dart';

class CastCubit extends Cubit<CastState> {
  CastCubit(this.context, this.id) : super(CastInitial()) {
    featchCast();
  }
  BuildContext context;
  int id;
  featchCast() async {
    String url = 'https://api.tvmaze.com/shows/$id/cast';
    final response = await http.get(Uri.parse(url));
    print(response.body);
    var responseData = json.decode(response.body);
   

List<CastModel> castModel =
        List<CastModel>.from(responseData.map((x) => CastModel.fromJson(x)));
    emit(CastListState(casts: castModel));
  }
}
