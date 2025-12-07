import 'package:flutter/material.dart';
import 'package:latwe_ustawy/members/widgets/member_thumbnail.dart';
import 'package:latwe_ustawy/service/backend_service.dart';

class MemberBuilder extends StatelessWidget {
  const MemberBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final backendService = BackendService();
    return FutureBuilder(
      future: backendService.fetchMembers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.hasData && snapshot.data != null) {
          final members = snapshot.data;
          return Column(
            children: members!
                .map((member) => MemberThumbnail(member: member))
                .toList(),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
