import 'package:flutter/material.dart';
import 'package:ibm_task/src/featuers/presentation/view/home/view/widgets/more_conversations_person.dart';
import 'package:ibm_task/src/featuers/presentation/view_models.dart/home/home_view_model.dart';
import 'package:provider/provider.dart';

class MoreConversationsPersonListView extends StatelessWidget {
  const MoreConversationsPersonListView({
    super.key,
  });

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
            : value.person!;
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: people.length,
          itemBuilder: (context, index) {
            return MoreConversationsPerson(
              person: people[index],
            );
          },
        );
      },
    );
  }
}
