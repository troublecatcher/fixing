import 'package:auto_route/auto_route.dart';
import 'package:fixease/custom/widget/custom_container.dart';
import 'package:fixease/custom/widget/custom_text_button.dart';
import 'package:fixease/features/main/item_list_cubit.dart';
import 'package:fixease/features/new_item/item.dart';
import 'package:fixease/router/router.dart';
import 'package:fixease/theme/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final price = item.expenses
        .fold(0.0, (previousValue, element) => previousValue + element.price);
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.breakingRate,
                style: TextStyle(
                  color: accentColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),
              Text(item.repaired ? 'Repaired' : 'In progress'),
            ],
          ),
          SizedBox(height: 2.h),
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
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: highlightColor,
                    borderRadius: borderRadius,
                  ),
                  child: Text(
                    item.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: highlightColor,
                    borderRadius: borderRadius,
                  ),
                  child: Text(
                    item.category,
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
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: borderRadius,
                ),
                child: Text(
                  '\$$price',
                  style: TextStyle(
                    color: accentColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              CustomTextButton(
                  title: 'Open',
                  onPressed: () => context.router.push(SingleItemRoute(
                      index:
                          context.read<ItemListCubit>().state.indexOf(item)))),
            ],
          ),
        ],
      ),
    );
  }
}
