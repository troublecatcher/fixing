import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fixease/custom/layout/section.dart';
import 'package:fixease/custom/widget/custom_button.dart';
import 'package:fixease/custom/widget/custom_text_field.dart';
import 'package:fixease/custom/layout/section_with_title.dart';
import 'package:fixease/custom/radio_cubit.dart';
import 'package:fixease/custom/layout/radio_list.dart';
import 'package:fixease/main.dart';
import 'package:fixease/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fixease/theme/const.dart';

@RoutePage()
class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RadioCubit(),
      child: CupertinoPageScaffold(
          child: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                const CupertinoSliverNavigationBar(
                  largeTitle: Text('Let’s get acquainted'),
                  previousPageTitle: 'Back',
                  border: null,
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Section(
                        child: CustomTextField(
                          placeholder: 'Your name',
                          controller: nameController,
                          onChanged: (_) => setState(() {}),
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      SectionWithTitle(
                        title: 'Do you often have something broken at home?',
                        child: RadioList(
                          options: [
                            'Rarely',
                            'Periodically',
                            'Often',
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BlocBuilder<RadioCubit, int?>(
                builder: (context, state) {
                  return Section(
                    child: CustomButton(
                      title: 'Continue',
                      onPressed: () {
                        locator<SharedPreferences>()
                            .setBool('isFirstTime', false);
                        context.router.replace(const MainRoute());
                      },
                      isActive: nameController.text.isNotEmpty && state != null,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
