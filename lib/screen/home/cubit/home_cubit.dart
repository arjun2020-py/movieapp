import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../model/home_model.dart';
import 'package:http/http.dart' as http;

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.context) : super(HomeInitial()) {
    fetachShow();
  }
  BuildContext context;

  fetachShow() async {
    String url = 'https://api.tvmaze.com/shows';
    final response = await http.get(Uri.parse(url));
    var responseData = json.decode(response.body);
    print(response.body);
    List<ShowModel> showModel =
        List<ShowModel>.from(responseData.map((x) => ShowModel.fromJson(x)));
    emit(ShowListState(shows: showModel));
  }
}
