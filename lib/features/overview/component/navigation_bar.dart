import 'package:chuyendecoso/features/overview/bloc/overview_bloc.dart';
import 'package:chuyendecoso/features/overview/component/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBarButton extends StatefulWidget {
  const NavigationBarButton({Key? key}) : super(key: key);

  @override
  State<NavigationBarButton> createState() => _NavigationBarButtonState();
}

class _NavigationBarButtonState extends State<NavigationBarButton> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: false,
      iconSize: 10,
      items: [
        HomeButton(),
        ToolsButton(),
        MeButton(),
      ],
      onTap: (idx) {
        setState(() {
          print(idx);
          index = idx;
        });
        if (index == 0) context.read<OverviewBloc>().emit(HomeState());
        if (index == 1) context.read<OverviewBloc>().emit(ToolsState());
        if (index == 2) context.read<OverviewBloc>().emit(MeState());
      },
      currentIndex: index,
    );
  }
}
