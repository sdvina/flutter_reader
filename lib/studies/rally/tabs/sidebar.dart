// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_reader/layout/adaptive.dart';
import 'package:flutter_reader/studies/rally/colors.dart';

class TabWithSidebar extends StatelessWidget {
  const TabWithSidebar({
    super.key,
    this.restorationId,
    required this.mainView,
    required this.sidebarItems,
  });

  final Widget mainView;
  final List<Widget> sidebarItems;
  final String? restorationId;

  @override
  Widget build(BuildContext context) {
    if (isDisplayDesktop(context)) {
      return Row(
        children: [
          Flexible(
            flex: 2,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: mainView,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: RallyColors.inputBackground,
              padding: const EdgeInsetsDirectional.only(start: 24),
              height: double.infinity,
              alignment: AlignmentDirectional.centerStart,
              child: ListView(
                shrinkWrap: true,
                children: sidebarItems,
              ),
            ),
          ),
        ],
      );
    } else {
      return SingleChildScrollView(
        restorationId: restorationId,
        child: mainView,
      );
    }
  }
}

class SidebarItem extends StatelessWidget {
  const SidebarItem({
    super.key,
    required this.value,
    required this.title,
  });

  final String value;
  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        SelectableText(
          title,
          style: textTheme.bodyMedium!.copyWith(
            fontSize: 16,
            color: RallyColors.gray60,
          ),
        ),
        const SizedBox(height: 8),
        SelectableText(
          value,
          style: textTheme.bodyLarge!.copyWith(fontSize: 20),
        ),
        const SizedBox(height: 8),
        Container(
          color: RallyColors.primaryBackground,
          height: 1,
        ),
      ],
    );
  }
}
