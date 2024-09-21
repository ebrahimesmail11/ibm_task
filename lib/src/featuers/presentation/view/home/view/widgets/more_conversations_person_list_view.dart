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
        return value.showLoader
            ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: value.filteredPerson?.length,
                    itemBuilder: (context, index) {
                      return MoreConversationsPerson(
                          person: value.filteredPerson?[index] ??
                              value.person?[index]);
                    },
                  );
      },
    );
  }
}
