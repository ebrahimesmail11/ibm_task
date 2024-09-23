import 'package:flutter/material.dart';
import 'package:ibm_task/src/featuers/presentation/view/home/view/widgets/more_conversations_person.dart';
import 'package:ibm_task/src/featuers/presentation/view_models.dart/home/home_view_model.dart';
import 'package:provider/provider.dart';

class MoreConversationsPersonListView extends StatefulWidget {
  const MoreConversationsPersonListView({
    super.key,
  });

  @override
  State<MoreConversationsPersonListView> createState() => _MoreConversationsPersonListViewState();
}

class _MoreConversationsPersonListViewState extends State<MoreConversationsPersonListView> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
    void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
 void _onScroll() {
       if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
         context.read<HomeViewModel>().loadMorePepole();
      }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, value, child) {
        if (value.showLoader) {
          return const Center(child: CircularProgressIndicator());
        }

        // Ensure that person is not null
        if (value.person == null || value.person!.isEmpty) {
          return const Center(child: Text('No conversations available.'));
        }

        // If filteredPerson is available, use it, otherwise use person
        final people = value.filteredPerson?.isNotEmpty == true
            ? value.filteredPerson!
            : value.displayedPersons!;
        return ListView.builder(
          controller: _scrollController,
          padding: EdgeInsets.zero,
          itemCount: people.length + (value.isLoadingMore ? 1 : 0),
          itemBuilder: (context, index) {
            return index>=people.length? const  Center(child:  CircularProgressIndicator()): MoreConversationsPerson(
              person: people[index],
            );
          },
        );
      },
    );
  }
}
