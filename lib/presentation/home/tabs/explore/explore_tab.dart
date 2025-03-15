import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:online_exam/config/theme/di/di.dart';
import 'package:online_exam/config/theme/my_theme.dart';
import 'package:online_exam/core/utils/colors_manager.dart';
import 'package:online_exam/presentation/home/tabs/explore/cubit/get_subjects_cubit.dart';
import 'package:online_exam/presentation/home/tabs/explore/cubit/get_subjects_state.dart';
import 'package:online_exam/presentation/home/tabs/explore/subject_exam.dart';

import '../../../../core/reusable_components/custom_circular_indicator.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({super.key});

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  SubjectsViewModel viewModel = getIt.get<SubjectsViewModel>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.onIntent(GetSubjectsIntent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocConsumer<SubjectsViewModel, GetSubjectsState>(
        listener: (context, state) {
          if (state is GetSubjectsSuccess) {
          } else if (state is GetSubjectsFailure) {
          } else if (state is GetSubjectsLoading) {
            showDialog(
              barrierDismissible: false,
              useSafeArea: true,
              context: context,
              builder: (context) {
                return SpinKitThreeBounce(
                  color: Theme.of(context).primaryColor,
                  size: 50.0,
                );
              },
            );
          }
        },
        builder: (context, state) {
          if (state is GetSubjectsLoading) {
            return Scaffold(
              body: CustomLoadingIndicator(),
            );
          } else if (state is GetSubjectsSuccess) {
            return SafeArea(
              child: Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    spacing: 30,
                    children: <Widget>[
                      SearchBar(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.white),
                          elevation: WidgetStateProperty.all(200.0),
                          side: WidgetStateProperty.all(
                            BorderSide(
                                color: ColorsManager.customGray.shade100),
                          ),
                          leading: Icon(
                            Icons.search,
                            color: ColorsManager.customGray.shade100,
                          ),
                          hintText: 'Search',
                          hintStyle: WidgetStateProperty.all(
                            Theme.of(context).textTheme.titleSmall?.copyWith(
                                color: ColorsManager.customGray.shade100,
                                fontSize: 14),
                          )),
                      Row(
                        children: <Widget>[
                          Text('Browse by subject',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(fontSize: 22))
                        ],
                      ),
                      Expanded(
                        child: state.subjects.length == 0
                            ? Center(
                                child: Text(
                                  'No Subject found',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                          color: ColorsManager.customBlue,
                                          fontSize: 30),
                                ),
                              )
                            : ListView.builder(
                                itemCount: state.subjects.length,
                                itemBuilder: (context, index) {
                                  var subject = state.subjects[index];
                                  return SizedBox(
                                    height: 80.h,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => SubjectExam(
                                                subjectId: subject.sId,
                                                subjectName: subject.name,
                                              ),
                                            ));
                                      },
                                      child: Card(
                                        child: ListTile(
                                          contentPadding: EdgeInsets.all(10.0),
                                          leading: Image(
                                              image:
                                                  NetworkImage(subject.icon)),
                                          title:
                                              Text(subject.name ?? 'No Name'),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is GetSubjectsFailure) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}

// Column(
// spacing: 40.0,
// children: <Widget>[
//
// Row(
// children: <Widget>[
// Text('Browse by subject',style:Theme.of(context).textTheme.headlineMedium?.copyWith(
// fontSize: 22
//
// ))
// ],
// ),
// Container(
// height: 80,
// child: Card(
//
// child: ListTile(leading: Icon(Icons.computer),
// title: Text('Language'),
//
// ),
// ),
// ),
// Container(
// height: 80,
// child: Card(
//
// child: ListTile(leading: Icon(Icons.computer),
// title: Text('Language'),
//
// ),
// ),
// )
//
//
//
// ],
// )
