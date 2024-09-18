import 'package:flutter/material.dart';
import 'package:ibm_task/src/common/base/app_constants.dart';
import 'package:ibm_task/src/common/base/extensions.dart';
import 'package:ibm_task/src/featuers/presentation/view/home/view/widgets/leading_app_bar.dart';
import 'package:ibm_task/src/featuers/presentation/view/home/view/widgets/messages_body.dart';
import 'package:ibm_task/src/featuers/presentation/view/home/view/widgets/title_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const LeadingAppBar(),
        title: const TitleAppBar(),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: context.colors.blue),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          dividerHeight: 0,
          labelColor: context.colors.blue,
          unselectedLabelColor: Colors.grey,
          indicatorColor: context.colors.blue,
          tabs: const [
            Tab(text: AppConstants.message),
            Tab(text: AppConstants.active),
            Tab(text: AppConstants.groups),
            Tab(text: AppConstants.calls),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          MessagesBody(),
          Center(
            child: Text(AppConstants.active),
          ),
          Center(
            child: Text(AppConstants.groups),
          ),
          Center(
            child: Text(AppConstants.calls),
          ),
        ],
      ),
    );
  }
}
