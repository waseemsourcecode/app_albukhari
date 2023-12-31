import 'package:app_albukhari/features/presentation/cubits/dashboard/cubit_dashboard.dart';
import 'package:app_albukhari/features/presentation/cubits/dashboard/state_dashboard.dart';
import 'package:app_albukhari/features/presentation/pages/dashboard/dashboard_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatelessWidget with DashboardUI {
  Dashboard({super.key});
  @override
  Widget build(BuildContext context) {
    var vb = true;
    return Scaffold(
        bottomNavigationBar: BlocBuilder<CubitDashBoard, StateDB>(
          buildWhen: (previous, current) =>
              current is StateDBSelectionIconUpdation,
          builder: (context, state) {
            var defaultIndex = 1;

            if (state is StateDBSelectionIconUpdation) {

              defaultIndex = state.selected;
              if(defaultIndex == 0 || defaultIndex == 1){
                vb = false;
              }
            }
            return buildBottomNavigationBar(defaultIndex, context);
          },
        ),
        appBar: buildAppBar(context),
        body: Column(
          children: [Visibility(
              visible:vb ,
              child: buildDHeading()), Expanded(child: buildPageView())],
        ));
  }
}
