import 'package:auto_route/auto_route.dart';
import 'package:fixease/custom/layout/section.dart';
import 'package:fixease/custom/layout/section_with_title.dart';
import 'package:fixease/custom/widget/custom_button.dart';
import 'package:fixease/custom/widget/custom_container.dart';
import 'package:fixease/custom/widget/custom_text_button.dart';
import 'package:fixease/features/main/item_list_cubit.dart';
import 'package:fixease/features/main/item_widget.dart';
import 'package:fixease/features/main/main_screen.dart';
import 'package:fixease/features/new_item/bloc/item_bloc.dart';
import 'package:fixease/features/new_item/item.dart';
import 'package:fixease/router/router.dart';
import 'package:fixease/theme/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SingleItemScreen extends StatelessWidget {
  final int index;
  const SingleItemScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemListCubit, List<Item>>(
      builder: (context, state) {
        try {
          final item = state[index];
          return CupertinoPageScaffold(
              child: SafeArea(
            bottom: false,
            child: Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    CupertinoSliverNavigationBar(
                      largeTitle: const Text('Broken item'),
                      trailing: CustomTextButton(
                        title: 'Edit',
                        onPressed: () {
                          context.read<ItemBloc>().add(ItemRestoreEvent(item));
                          context.router.push(NewItemFirstRoute(index: index));
                        },
                      ),
                      previousPageTitle: 'Back',
                      border: null,
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Section(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: accentColor,
                                borderRadius: borderRadius,
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 50),
                                      child: ClipRRect(
                                        borderRadius: borderRadius,
                                        child: Image.asset(
                                          'assets/images/tools.png',
                                          scale: 8,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(16.r),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.75,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.breakingRate,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                              Text(
                                                item.reason,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20.sp,
                                                ),
                                              ),
                                              SizedBox(height: 8.h),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(8.r),
                                                      decoration: BoxDecoration(
                                                        color: highlightColor,
                                                        borderRadius:
                                                            borderRadius,
                                                      ),
                                                      child: Text(
                                                        item.name,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16.sp,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 4.w),
                                                  Expanded(
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(8.r),
                                                      decoration: BoxDecoration(
                                                        color: highlightColor,
                                                        borderRadius:
                                                            borderRadius,
                                                      ),
                                                      child: Text(
                                                        item.category,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SectionWithTitle(
                            title: 'Photos',
                            child: SizedBox(
                              height: 100.r,
                              width: double.infinity,
                              child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, i) {
                                  return SizedBox(
                                    height: 100.r,
                                    width: 100.r,
                                    child: ClipRRect(
                                      borderRadius: borderRadius,
                                      child: Image.memory(
                                        item.photos[i],
                                        fit: BoxFit.cover,
                                        height: 100.r,
                                        width: 100.r,
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    SizedBox(width: 16.w),
                                itemCount: item.photos.length,
                              ),
                            ),
                          ),
                          SectionWithTitle(
                            title: 'Description of the problem',
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomContainer(
                                    child: Text(
                                      item.desc,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SectionWithTitle(
                            title: 'List of necessary expenses',
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, i) {
                                final expense = item.expenses[i];
                                return CustomContainer(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 8,
                                        child: Text(
                                          expense.name,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          '\$${expense.price}',
                                          style: TextStyle(
                                            color: accentColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 8.h),
                              itemCount: item.expenses.length,
                            ),
                          ),
                          SizedBox(height: 113.h),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: primaryColor,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 16.h),
                        Section(
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  title: 'Remove',
                                  onPressed: () {
                                    context.read<ItemListCubit>().delete(index);
                                    context.router.popForced();
                                  },
                                  isActive: true,
                                  padding: EdgeInsets.zero,
                                  color: secondaryColor,
                                  textColor: accentColor,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: CustomButton(
                                  title: 'Repaired!',
                                  onPressed: () {
                                    context.read<ItemListCubit>().update(
                                        index, item.copyWith(repaired: true));
                                    context.router.popForced();
                                  },
                                  isActive: true,
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 53.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ));
        } catch (e) {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
