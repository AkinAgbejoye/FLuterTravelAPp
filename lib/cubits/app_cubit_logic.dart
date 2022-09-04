import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/app_cubit_state.dart';
import 'package:notes/cubits/app_cubits.dart';
import 'package:notes/pages/details_page.dart';
import 'package:notes/pages/home_page.dart';
import 'package:notes/pages/nav/main_page.dart';
import 'package:notes/pages/welcome.dart';

class AppCubitLogic extends StatefulWidget {
  const AppCubitLogic({Key? key}) : super(key: key);

  @override
  State<AppCubitLogic> createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
        if (state is WelcomeState) {
          return Welcome();
        }

        if (state is LoadedState) {
          return MainPage();
        }

        if (state is DetailedState) {
          return DetailedPage();
        }

        if (state is LoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
