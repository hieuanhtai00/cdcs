import 'package:chuyendecoso/features/home/pages/home.dart';
import 'package:chuyendecoso/features/me/pages/me.dart';
import 'package:chuyendecoso/features/overview/bloc/overview_bloc.dart';
import 'package:chuyendecoso/features/overview/component/header.dart';
import 'package:chuyendecoso/features/overview/component/navigation_bar.dart';
import 'package:chuyendecoso/features/tools/pages/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({Key? key}) : super(key: key);

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  int index = 0;
  double? heightIcon;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    heightIcon = MediaQuery.of(context).size.height / 10;
    return Scaffold(
      appBar: PreferredSize(
        child: Column(
          children: [
            Expanded(
              child: HeaderOverview(),
            ),
            Expanded(
              child: BlocBuilder<OverviewBloc, OverviewState>(
                builder: (context, state) {
                  if (state is ToolsState)
                    return Align(
                      child: Text(
                        'GIỚI THIỆU',
                        style: TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      alignment: Alignment.topCenter,
                    );
                  return Container();
                },
              ),
            ),
          ],
        ),
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height / 3,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: BlocBuilder<OverviewBloc, OverviewState>(
          builder: (context, state) {
            if (state is HomeState) return Home();
            if (state is ToolsState) return Tools();
            return Me();
          },
        ),
      ),
      bottomNavigationBar: NavigationBarButton(),
    );
  }
}
