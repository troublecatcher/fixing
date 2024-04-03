import 'package:auto_route/auto_route.dart';
import 'package:fixease/features/main/item_list_cubit.dart';
import 'package:fixease/features/main/item_widget.dart';
import 'package:fixease/features/main/main_screen.dart';
import 'package:fixease/features/new_item/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AllItemsScreen extends StatelessWidget {
  const AllItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
      bottom: false,
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            largeTitle: Text('Broken items'),
            previousPageTitle: 'Back',
            border: null,
          ),
          BlocBuilder<ItemListCubit, List<Item>>(
            builder: (context, state) {
              return SliverList.separated(
                itemCount: state.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: ItemWidget(item: state[index]),
                ),
                separatorBuilder: (context, index) => SizedBox(height: 8.h),
              );
            },
          ),
        ],
      ),
    ));
  }
}
