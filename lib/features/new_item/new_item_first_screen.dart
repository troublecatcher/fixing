import 'package:auto_route/auto_route.dart';
import 'package:fixease/custom/widget/custom_text_button.dart';
import 'package:fixease/features/main/item_list_cubit.dart';
import 'package:fixease/features/new_item/bloc/item_bloc.dart';
import 'package:fixease/features/new_item/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fixease/custom/layout/radio_list.dart';
import 'package:fixease/custom/layout/section.dart';
import 'package:fixease/custom/layout/section_with_title.dart';
import 'package:fixease/custom/radio_cubit.dart';
import 'package:fixease/custom/widget/custom_button.dart';
import 'package:fixease/custom/widget/custom_text_field.dart';
import 'package:fixease/router/router.dart';
import 'package:fixease/theme/const.dart';

@RoutePage()
class NewItemFirstScreen extends StatefulWidget implements AutoRouteWrapper {
  final int? index;
  const NewItemFirstScreen({super.key, this.index});

  @override
  State<NewItemFirstScreen> createState() => _NewItemFirstScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => RadioCubit(),
      child: this,
    );
  }
}

class _NewItemFirstScreenState extends State<NewItemFirstScreen> {
  late TextEditingController nameController;
  late TextEditingController categoryController;
  late TextEditingController reasonController;

  final options = [
    'No deadlines',
    'Within a month',
    'During the week',
    'A couple of days',
  ];

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    categoryController = TextEditingController();
    reasonController = TextEditingController();
    if (widget.index != null) {
      final item = context.read<ItemListCubit>().state[widget.index!];

      nameController.text = item.name;
      categoryController.text = item.category;
      reasonController.text = item.reason;
      final index = options.indexOf(item.breakingRate);
      context.read<RadioCubit>().set(index);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    categoryController.dispose();
    reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                trailing: widget.index != null
                    ? CustomTextButton(
                        title: 'Skip this step',
                        onPressed: () => context.router.push(
                          NewItemSecondRoute(index: widget.index),
                        ),
                      )
                    : null,
                largeTitle: const Text('Broken item'),
                previousPageTitle: 'Back',
                border: null,
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Section(
                      child: Column(
                        children: [
                          CustomTextField(
                            placeholder: 'The name of the item',
                            controller: nameController,
                            onChanged: (_) => setState(() {}),
                            color: primaryColor,
                          ),
                          SizedBox(height: 8.h),
                          CustomTextField(
                            placeholder: 'What category is the item',
                            controller: categoryController,
                            onChanged: (_) => setState(() {}),
                            color: primaryColor,
                          ),
                          SizedBox(height: 8.h),
                          CustomTextField(
                            placeholder: 'What the reason for the breakdown',
                            controller: reasonController,
                            onChanged: (_) => setState(() {}),
                            color: primaryColor,
                          ),
                        ],
                      ),
                    ),
                    SectionWithTitle(
                      title: 'Do you often have something broken at home?',
                      child: RadioList(
                        options: options,
                      ),
                    ),
                    SizedBox(height: 60.h),
                  ],
                ),
              ),
            ],
          ),
          BlocBuilder<RadioCubit, int?>(
            builder: (context, state) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Section(
                  child: CustomButton(
                    title: 'Next',
                    onPressed: () {
                      context.read<ItemBloc>().add(ItemFirstEvent(
                            nameController.text,
                            categoryController.text,
                            reasonController.text,
                            options[state!],
                          ));
                      context.router
                          .push(NewItemSecondRoute(index: widget.index));
                    },
                    isActive: nameController.text.isNotEmpty &&
                        categoryController.text.isNotEmpty &&
                        reasonController.text.isNotEmpty &&
                        state != -1,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ));
  }
}
