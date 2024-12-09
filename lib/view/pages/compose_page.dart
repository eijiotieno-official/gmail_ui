import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gmail_ui/view/widgets/compose_app_bar_view.dart';
import 'package:gmail_ui/view/widgets/compose_buttons_options_view.dart';
import '../../view_model/account_view_model.dart';

import '../widgets/body_section.dart';
import '../widgets/custom_divider.dart';
import '../widgets/input_view.dart';
import '../widgets/subject_section.dart';
import '../widgets/to_section.dart';

class ComposePage extends ConsumerStatefulWidget {
  const ComposePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ComposePageState();
}

class _ComposePageState extends ConsumerState<ComposePage> {
  TextEditingController _fromController = TextEditingController();

  final TextEditingController _toController = TextEditingController();

  final TextEditingController _ccController = TextEditingController();

  final TextEditingController _bccController = TextEditingController();

  final TextEditingController _subjectController = TextEditingController();

  final TextEditingController _bodyController = TextEditingController();

  bool _isToToggled = false;

  void _toToggle() {
    setState(() {
      _isToToggled = !_isToToggled;
    });
  }

  @override
  void initState() {
    _fromController =
        TextEditingController(text: ref.read(currentUserAccountProvider).email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          ComposeAppBar(),
          InputView(
            controller: _fromController,
            prefixText: "From",
          ),
          CustomDivider(),
          ToSection(
            toController: _toController,
            ccController: _ccController,
            bccController: _bccController,
            isToToggled: _isToToggled,
            onToToggled: _toToggle,
          ),
          CustomDivider(),
          SubjectSection(controller: _subjectController),
          CustomDivider(),
          BodySection(controller: _bodyController),
          Spacer(),
          ComposeButtonsOptionsView(),
        ],
      ),
    );
  }
}
