import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fixease/custom/widget/custom_container.dart';
import 'package:fixease/custom/radio_cubit.dart';
import 'package:fixease/theme/const.dart';

class RadioList extends StatelessWidget {
  final List<String> options;

  const RadioList({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioCubit, int?>(
      builder: (context, state) {
        return Column(
          children: List.generate(options.length, (index) {
            final condition = index == context.read<RadioCubit>().state;
            return SizedBox(
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () => context.read<RadioCubit>().set(index),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: CustomContainer(
                          color: condition ? accentColor : null,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                options[index],
                                style: TextStyle(
                                    color:
                                        condition ? Colors.white : accentColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp),
                              ),
                              if (condition)
                                SvgPicture.asset(
                                  'assets/icons/check.svg',
                                  colorFilter: const ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
