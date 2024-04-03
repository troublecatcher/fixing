import 'package:auto_route/auto_route.dart';
import 'package:fixease/custom/widget/custom_container.dart';
import 'package:fixease/custom/widget/custom_text_button.dart';
import 'package:fixease/features/main/item_list_cubit.dart';
import 'package:fixease/features/main/item_widget.dart';
import 'package:fixease/features/main/no_items_placeholder.dart';
import 'package:fixease/features/new_item/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fixease/custom/layout/section.dart';
import 'package:fixease/custom/widget/custom_button.dart';
import 'package:fixease/router/router.dart';
import 'package:fixease/theme/const.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
      bottom: false,
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                leading: CustomTextButton(
                  title: 'Settings',
                  onPressed: () => context.router.push(
                    const SettingsRoute(),
                  ),
                ),
                largeTitle: const Text('Repair items'),
                previousPageTitle: 'Back',
                border: null,
              ),
              SliverToBoxAdapter(
                child: BlocBuilder<ItemListCubit, List<Item>>(
                  builder: (context, state) {
                    if (state.isNotEmpty &&
                        state.where((item) => !item.repaired).isNotEmpty) {
                      int repairedItems =
                          state.where((item) => item.repaired).length;
                      return Column(
                        children: [
                          Section(
                            child: Container(
                              decoration: BoxDecoration(
                                color: accentColor,
                                borderRadius: borderRadius,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: EdgeInsets.all(16.r),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(8.r),
                                            decoration: BoxDecoration(
                                              color: labelColor,
                                              borderRadius: borderRadius,
                                            ),
                                            child: FittedBox(
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/icons/tools.svg'),
                                                  SizedBox(width: 8.w),
                                                  Text(
                                                    repairedItems.toString(),
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 32.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 24.h),
                                          Text(
                                            'Total repaired items',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: ClipRRect(
                                      borderRadius: borderRadius,
                                      child: Image.asset(
                                        'assets/images/key.png',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Section(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Broken items',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                    CustomTextButton(
                                      title: 'View all',
                                      onPressed: () => context.router.push(
                                        const AllItemsRoute(),
                                      ),
                                    ),
                                  ],
                                ),
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    if (!state[index].repaired) {
                                      return ItemWidget(item: state[index]);
                                    } else {
                                      return const SizedBox.shrink();
                                    }
                                  },
                                  separatorBuilder: (context, index) =>
                                      SizedBox(height: 8.h),
                                  itemCount: state.length,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 60.h),
                        ],
                      );
                    } else {
                      return const NoItemsPlaceholder();
                    }
                  },
                ),
              ),
            ],
          ),
          Section(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  title: 'Add new broken item',
                  onPressed: () => context.router.push(NewItemFirstRoute()),
                  isActive: true,
                  iconAsset: 'assets/icons/plus.svg',
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
