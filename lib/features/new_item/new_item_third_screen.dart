import 'dart:io';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:fixease/custom/widget/custom_text_button.dart';
import 'package:fixease/features/main/item_list_cubit.dart';
import 'package:fixease/features/new_item/bloc/item_bloc.dart';
import 'package:fixease/features/new_item/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fixease/custom/layout/section.dart';
import 'package:fixease/custom/layout/section_with_title.dart';
import 'package:fixease/custom/widget/custom_button.dart';
import 'package:fixease/custom/widget/custom_container.dart';
import 'package:fixease/custom/widget/custom_text_field.dart';
import 'package:fixease/features/new_item/photo_cubit.dart';
import 'package:fixease/router/router.dart';
import 'package:fixease/theme/const.dart';

@RoutePage()
class NewItemThirdScreen extends StatefulWidget implements AutoRouteWrapper {
  final int? index;
  const NewItemThirdScreen({super.key, this.index});

  @override
  State<NewItemThirdScreen> createState() => _NewItemThirdScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotoCubit(),
      child: this,
    );
  }
}

class _NewItemThirdScreenState extends State<NewItemThirdScreen> {
  late TextEditingController descController;

  @override
  void initState() {
    super.initState();
    descController = TextEditingController();
    if (widget.index != null) {
      final item = context.read<ItemListCubit>().state[widget.index!];
      for (var photo in item.photos) {
        context.read<PhotoCubit>().add(photo);
      }
      descController.text = item.desc;
    }
  }

  @override
  void dispose() {
    descController.dispose();
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
              const CupertinoSliverNavigationBar(
                largeTitle: Text('Broken item'),
                previousPageTitle: 'Back',
                border: null,
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    BlocBuilder<PhotoCubit, List<Uint8List>>(
                      builder: (context, state) {
                        return SectionWithTitle(
                          title: 'Photos',
                          child: CustomContainer(
                            padding: EdgeInsets.zero,
                            child: Column(
                              children: [
                                SizedBox(height: 16.h),
                                SizedBox(
                                  height: 100.r,
                                  width: double.infinity,
                                  child: ListView.separated(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.h),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      if (index == state.length) {
                                        return Container(
                                          height: 100.r,
                                          width: 100.r,
                                          padding: EdgeInsets.all(30.r),
                                          decoration: BoxDecoration(
                                            color: secondaryColor,
                                            borderRadius: borderRadius,
                                          ),
                                          child: SvgPicture.asset(
                                            'assets/icons/camera.svg',
                                            colorFilter: const ColorFilter.mode(
                                              accentColor,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                        );
                                      } else {
                                        return SizedBox(
                                          height: 100.r,
                                          width: 100.r,
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius: borderRadius,
                                                child: Image.memory(
                                                  state[index],
                                                  fit: BoxFit.cover,
                                                  height: 100.r,
                                                  width: 100.r,
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: CupertinoButton(
                                                  padding: EdgeInsets.zero,
                                                  onPressed: () => context
                                                      .read<PhotoCubit>()
                                                      .remove(index),
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.all(2.r),
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: accentColor,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: const Icon(
                                                      Icons.close,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    },
                                    separatorBuilder: (context, index) =>
                                        SizedBox(width: 16.w),
                                    itemCount: state.length + 1,
                                  ),
                                ),
                                SizedBox(height: 16.h),
                                Builder(builder: (ctx) {
                                  return Section(
                                    child: CustomButton(
                                      title: 'Add photo',
                                      onPressed: () => showCupertinoModalPopup(
                                        context: context,
                                        builder: (context) =>
                                            CupertinoActionSheet(
                                          actions: [
                                            CupertinoActionSheetAction(
                                              onPressed: () async {
                                                context.router.popForced();
                                                final ImagePicker picker =
                                                    ImagePicker();
                                                final XFile? pickedImage =
                                                    await picker.pickImage(
                                                        source:
                                                            ImageSource.camera);
                                                if (pickedImage != null) {
                                                  context
                                                      .read<PhotoCubit>()
                                                      .add(
                                                        await File(
                                                          pickedImage.path,
                                                        ).readAsBytes(),
                                                      );
                                                }
                                              },
                                              child:
                                                  const Text('Take new photo'),
                                            ),
                                            CupertinoActionSheetAction(
                                              onPressed: () async {
                                                context.router.popForced();
                                                final ImagePicker picker =
                                                    ImagePicker();
                                                final XFile? pickedImage =
                                                    await picker.pickImage(
                                                        source: ImageSource
                                                            .gallery);
                                                if (pickedImage != null) {
                                                  ctx.read<PhotoCubit>().add(
                                                      await File(
                                                              pickedImage.path)
                                                          .readAsBytes());
                                                }
                                              },
                                              child: const Text(
                                                  'Choose existing photo'),
                                            ),
                                          ],
                                          cancelButton:
                                              CupertinoActionSheetAction(
                                            onPressed: () =>
                                                context.router.popForced(),
                                            child: const Text('Cancel'),
                                          ),
                                        ),
                                      ),
                                      isActive: true,
                                      iconAsset: 'assets/icons/plus.svg',
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SectionWithTitle(
                      title: 'Description of the problem',
                      child: Stack(
                        children: [
                          CustomTextField(
                            placeholder:
                                'Additional information about the repair',
                            controller: descController,
                            onChanged: (_) => setState(() {}),
                            color: primaryColor,
                            maxLines: 4,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          BlocBuilder<PhotoCubit, List<Uint8List>>(
            builder: (context, state) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Section(
                  child: CustomButton(
                    title: 'Done',
                    onPressed: () {
                      final photos = context.read<PhotoCubit>().state;
                      final newItem = context
                          .read<ItemBloc>()
                          .state
                          .copyWith(photos: photos, desc: descController.text);
                      if (widget.index == null) {
                        context.read<ItemListCubit>().create(newItem);
                        context.read<ItemBloc>().add(ItemFlushEvent());
                      } else {
                        context
                            .read<ItemListCubit>()
                            .update(widget.index!, newItem);
                        context.read<ItemBloc>().add(ItemFlushEvent());
                      }
                      context.router
                        ..popForced()
                        ..popForced()
                        ..popForced();
                    },
                    isActive:
                        state.isNotEmpty && descController.text.isNotEmpty,
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
