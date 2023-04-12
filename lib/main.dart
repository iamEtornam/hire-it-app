import 'dart:io';

import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hire_it/custom_colors.dart';
import 'package:hire_it/custom_logo.dart';
import 'package:hire_it/data_source.dart';
// import 'package:window_size/window_size.dart';

import 'custom_theme.dart';
import 'job_model.dart';
import 'resources/resources.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    // setWindowMinSize(const Size(1293, 700));
    // setWindowMaxSize(Size.infinite);
  // }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hire IT',
      debugShowCheckedModeBanner: false,
      theme: customLightTheme(context),
      // darkTheme: customDarkTheme(context),
      home: DashboardView(),
    );
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FloatingNavBar(
        color: CustomColors.customBlueColor,
        selectedIconColor: Colors.white,
        unselectedIconColor: Colors.white.withOpacity(0.6),
        borderRadius: 45,
        items: [
          FloatingNavBarItem(
              iconData: Icons.home_filled, page: HomeView(), title: 'Home'),
          FloatingNavBarItem(
              iconData: CupertinoIcons.bookmark,
              page: Container(),
              title: 'Doctors'),
          FloatingNavBarItem(
              iconData: Icons.chat_bubble_outline_outlined,
              page: Container(),
              title: 'Reminders'),
          FloatingNavBarItem(
              iconData: Icons.account_circle_outlined,
              page: Container(),
              title: 'Records'),
        ],
        horizontalPadding: 45.0,
        hapticFeedback: true,
        showTitle: false,
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: CustomColors.bgColors,
              begin: Alignment.topRight,
              end: Alignment.bottomLeft)),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Row(
              children: [
                CustomLogo(
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'HIREIT',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontWeight: FontWeight.w900),
                ),
              ],
            ),
            centerTitle: false,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(Images.avatar),
                ),
              )
            ],
          ),
          body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return ListView(
              controller: _scrollController,
              padding: EdgeInsets.all(24),
              children: [
                TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: 1,
                  enableInteractiveSelection: true,
                  decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintStyle:
                          Theme.of(context).inputDecorationTheme.hintStyle,
                      contentPadding: EdgeInsets.all(15.0),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      focusedBorder:
                          Theme.of(context).inputDecorationTheme.focusedBorder,
                      enabledBorder:
                          Theme.of(context).inputDecorationTheme.enabledBorder,
                      disabledBorder:
                          Theme.of(context).inputDecorationTheme.disabledBorder,
                      errorBorder:
                          Theme.of(context).inputDecorationTheme.errorBorder,
                      focusedErrorBorder: Theme.of(context)
                          .inputDecorationTheme
                          .focusedErrorBorder,
                      fillColor:
                          Theme.of(context).inputDecorationTheme.fillColor,
                      filled: true,
                      labelText: 'Find your dream job',
                      labelStyle: Theme.of(context)
                          .inputDecorationTheme
                          .labelStyle!
                          .copyWith(color: Colors.grey[500], fontSize: 18),
                      errorStyle:
                          Theme.of(context).inputDecorationTheme.errorStyle,
                      prefixIcon: Icon(CupertinoIcons.search)),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Discover Job',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                FutureBuilder<List<Job>>(
                    future: Future.value(DataSource.data),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting &&
                          snapshot.data == null) {
                        return CircularProgressIndicator.adaptive();
                      }

                      if (constraints.maxWidth >= 600) {
                        return AnimationLimiter(
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 3 / 2.1,
                                crossAxisCount: 3,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                              ),
                              controller: _scrollController,
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return AnimationConfiguration.staggeredGrid(
                                  position: index,
                                  duration: const Duration(milliseconds: 375),
                                  columnCount: 3,
                                  child: ScaleAnimation(
                                    child: FadeInAnimation(
                                      child: JobCardWidget(
                                        job: snapshot.data![index],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        );
                      }
                      return AnimationLimiter(
                        child: ListView.separated(
                          controller: _scrollController,
                          shrinkWrap: true,
                          itemBuilder: (context, index) =>
                              AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: JobCardWidget(
                                  job: snapshot.data![index],
                                ),
                              ),
                            ),
                          ),
                          separatorBuilder: (__, _) => SizedBox(
                            height: 5,
                          ),
                          itemCount: snapshot.data!.length,
                        ),
                      );
                    })
              ],
            );
          }),
        ),
      ),
    );
  }
}

class JobCardWidget extends StatelessWidget {
  final Job job;
  const JobCardWidget({
    Key? key,
    required this.job,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => JobDetailView(
                job: job,
              ))),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        shadowColor: Colors.white30,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(job.positionAd,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.bold)),
                    Image.asset(
                      job.comapnyLogo,
                      width: 60,
                      height: 60,
                    )
                  ],
                ),
              ),
              CardHelperWidget(
                  icon: CupertinoIcons.money_dollar_circle,
                  data: job.salaryRange),
              SizedBox(
                height: 6,
              ),
              CardHelperWidget(
                  icon: CupertinoIcons.location, data: job.positionAd),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardHelperWidget(
                        icon: CupertinoIcons.briefcase,
                        data: job.yearsOfExperienceRange),
                    Material(
                        elevation: 0,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                          child: Text(
                            job.jobType,
                            style: Theme.of(context).textTheme.button,
                          ),
                        ),
                        color: job.id.isEven
                            ? CustomColors.customOrangeColor
                            : CustomColors.customLightBlueColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45)))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardHelperWidget extends StatelessWidget {
  final IconData icon;
  final String data;
  const CardHelperWidget({Key? key, required this.icon, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon),
        SizedBox(
          width: 8,
        ),
        Text(data,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.normal)),
      ],
    );
  }
}

class JobDetailView extends StatelessWidget {
  final Job job;
  const JobDetailView({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: CustomColors.bgColors,
              begin: Alignment.topRight,
              end: Alignment.bottomLeft)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Job Details',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.w900),
          ),
        ),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              Center(
                child: Material(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(
                      job.comapnyLogo,
                      width: 110,
                      height: 110,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(25),
                  shadowColor: Colors.white30,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                shadowColor: Colors.white30,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.positionAd,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CardHelperWidget(
                          icon: CupertinoIcons.money_dollar_circle,
                          data: job.salaryRange),
                      SizedBox(
                        height: 6,
                      ),
                      CardHelperWidget(
                          icon: CupertinoIcons.location, data: job.positionAd),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CardHelperWidget(
                              icon: CupertinoIcons.briefcase,
                              data: job.yearsOfExperienceRange),
                          Material(
                              elevation: 0,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 15),
                                child: Text(
                                  job.jobType,
                                  style: Theme.of(context).textTheme.button,
                                ),
                              ),
                              color: job.id.isEven
                                  ? CustomColors.customOrangeColor
                                  : CustomColors.customLightBlueColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(45)))
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Job Description',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        job.jobDescription,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.normal,
                            color: Colors.grey[700]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Skills Required',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        job.skillsRequired.map((val) => val.trim()).join(', '),
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.normal,
                            color: Colors.grey[700]),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                          style: TextButton.styleFrom(
                              elevation: 1,
                              backgroundColor: CustomColors.customBlueColor,
                              shape: StadiumBorder(),
                              padding: EdgeInsets.fromLTRB(24, 15, 24, 15)),
                          onPressed: () {},
                          child: Text(
                            'Apply Now',
                            style: Theme.of(context)
                                .textTheme
                                .button!
                                .copyWith(color: Colors.white),
                          )),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                            elevation: .5,
                            shadowColor: Colors.white30,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            shape: StadiumBorder(),
                            padding: EdgeInsets.fromLTRB(24, 15, 24, 15)),
                        onPressed: () {},
                        child: Icon(
                          CupertinoIcons.bookmark,
                          color: CustomColors.customBlueColor,
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
