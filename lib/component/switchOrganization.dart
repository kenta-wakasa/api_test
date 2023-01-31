import 'package:api_test/importer.dart';
import 'package:flutter/material.dart';
import '../provider/provider.dart';
import '../repository/searchUser.dart';

class SwitchOrganization extends ConsumerWidget {
  const SwitchOrganization({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool organizationFlag = ref.watch(organizationFlagProvider);
    return SwitchListTile(
      title: const Text('組織に限る'),
      value: organizationFlag,
      onChanged: (bool value) {
        ref
            .watch(organizationFlagProvider.notifier)
            .update((state) => state = value);
        ref.watch(searchUsersProvider);
      },
      secondary: const Icon(Icons.business),
    );
  }
}
