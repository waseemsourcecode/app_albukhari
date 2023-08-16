import 'package:app_albukhari/features/presentation/cubits/cubit/cubit_home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/cubit/cubit_home_state.dart';
import '../../widget/hadit_card.dart';

bool basicLearner = true;

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitHome, CubitHomeState>(
      builder: (context, state) {
        if (state is CubitHomeStateStarted) {
          if (state.hadits != null) {
            return HaditCard(
              hadits: state.hadits!,
              showRemoveBtn: false,
            );
            // return haditsBody(state.hadits!, size);
          }
        }
        return Container();
      },
    );
  }
}
