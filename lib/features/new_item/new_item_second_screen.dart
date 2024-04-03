import 'package:auto_route/auto_route.dart';
import 'package:fixease/custom/widget/custom_text_button.dart';
import 'package:fixease/features/main/item_list_cubit.dart';
import 'package:fixease/features/new_item/bloc/item_bloc.dart';
import 'package:fixease/features/new_item/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fixease/custom/layout/section.dart';
import 'package:fixease/custom/layout/section_with_title.dart';
import 'package:fixease/custom/widget/custom_button.dart';
import 'package:fixease/custom/widget/custom_container.dart';
import 'package:fixease/custom/widget/custom_text_field.dart';
import 'package:fixease/features/new_item/expense.dart';
import 'package:fixease/features/new_item/expense_cubit.dart';
import 'package:fixease/router/router.dart';
import 'package:fixease/theme/const.dart';

@RoutePage()
class NewItemSecondScreen extends StatefulWidget implements AutoRouteWrapper {
  final int? index;
  const NewItemSecondScreen({super.key, this.index});

  @override
  State<NewItemSecondScreen> createState() => _NewItemSecondScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpenseCubit(),
      child: this,
    );
  }
}

class _NewItemSecondScreenState extends State<NewItemSecondScreen> {
  late TextEditingController nameController;
  late TextEditingController priceController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    priceController = TextEditingController();
    if (widget.index != null) {
      final item = context.read<ItemListCubit>().state[widget.index!];
      for (var expense in item.expenses) {
        context.read<ExpenseCubit>().add(expense);
      }
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
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
                          NewItemThirdRoute(index: widget.index),
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
                    BlocBuilder<ExpenseCubit, List<Expense>>(
                      builder: (context, state) {
                        return SectionWithTitle(
                          title: 'Expenses within 1 month',
                          child: Column(
                            children: [
                              ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: state.length,
                                itemBuilder: (context, index) =>
                                    CustomContainer(
                                  color: primaryColor,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Expense ${index + 1}',
                                            style: TextStyle(
                                              color: textColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                          CustomTextButton(
                                            title: 'Remove',
                                            onPressed: () => context
                                                .read<ExpenseCubit>()
                                                .remove(index),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.h),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: CustomContainer(
                                              color: secondaryColor,
                                              child: Text(
                                                state[index].name,
                                                style: TextStyle(
                                                  color: textColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.h),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: CustomContainer(
                                              color: secondaryColor,
                                              child: Text(
                                                '\$${state[index].price}',
                                                style: TextStyle(
                                                  color: textColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        SizedBox(height: 16.h),
                              ),
                              if (state.isNotEmpty) SizedBox(height: 16.h),
                              CustomContainer(
                                color: primaryColor,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Expense ${state.length + 1}',
                                      style: TextStyle(
                                        color: textColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    CustomTextField(
                                      placeholder: 'Expense name',
                                      controller: nameController,
                                      onChanged: (_) => setState(() {}),
                                      color: secondaryColor,
                                    ),
                                    SizedBox(height: 8.h),
                                    CustomTextField(
                                      placeholder: 'Price',
                                      controller: priceController,
                                      onChanged: (_) => setState(() {}),
                                      color: secondaryColor,
                                      keyboardType: TextInputType.number,
                                      enableInteractiveSelection: false,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Column(
                      children: [
                        Section(
                          child: CustomButton(
                            title: 'Add new',
                            onPressed: () {
                              context.read<ExpenseCubit>().add(Expense(
                                  nameController.text,
                                  double.parse(priceController.text)));
                              nameController.clear();
                              priceController.clear();
                              setState(() {});
                            },
                            isActive: nameController.text.isNotEmpty &&
                                priceController.text.isNotEmpty,
                            iconAsset: 'assets/icons/plus.svg',
                          ),
                        ),
                        SizedBox(height: 60.h),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          BlocBuilder<ExpenseCubit, List<Expense>>(
            builder: (context, state) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Section(
                  child: CustomButton(
                    title: 'Next',
                    onPressed: () {
                      context.read<ItemBloc>().add(ItemSecondEvent(state));
                      context.router
                          .push(NewItemThirdRoute(index: widget.index));
                    },
                    isActive: state.isNotEmpty,
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
