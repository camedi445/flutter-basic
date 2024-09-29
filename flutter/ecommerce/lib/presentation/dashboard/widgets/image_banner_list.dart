import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/material.dart';

class ImageBannerList extends StatefulWidget {
  const ImageBannerList({super.key});

  @override
  State<ImageBannerList> createState() => _ImageBannerListState();
}

class _ImageBannerListState extends State<ImageBannerList> {
  final List<Widget> imageWidgetList = [
    Image.network(
      "https://images.pexels.com/photos/2047905/pexels-photo-2047905.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      fit: BoxFit.cover,
    ),
    Image.network(
      "https://images.pexels.com/photos/8195828/pexels-photo-8195828.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      fit: BoxFit.cover,
    ),
    Image.network(
      "https://images.pexels.com/photos/11190508/pexels-photo-11190508.jpeg?auto=compress&cs=tinysrgb&w=600",
      fit: BoxFit.cover,
    ),
    Image.network(
      "https://images.pexels.com/photos/2314681/pexels-photo-2314681.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      fit: BoxFit.cover,
    ),
  ];

  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _ImagePageView(
            onIndexChange: (index) {
              setState(() {
                pageIndex = index;
              });
            },
            imageWidgetList: imageWidgetList,
          ),
          _ImageIndicator(
            pageIndex: pageIndex,
            itemCount: imageWidgetList.length,
          ),
          const _ActionButton()
        ],
      ),
    );
  }
}

class _ImagePageView extends StatelessWidget {
  final ValueChanged<int>? onIndexChange;
  final List<Widget> imageWidgetList;

  const _ImagePageView(
      {required this.onIndexChange, required this.imageWidgetList});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.height / 2.4,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.tertiaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: PageView(
          allowImplicitScrolling: true,
          scrollDirection: Axis.horizontal,
          onPageChanged: onIndexChange,
          physics: const ClampingScrollPhysics(),
          children: imageWidgetList,
        ),
      ),
    );
  }
}

class _ImageIndicator extends StatelessWidget {
  final int pageIndex;
  final int itemCount;
  const _ImageIndicator({required this.pageIndex, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      left: MediaQuery.of(context).size.width / 3.3,
      right: MediaQuery.of(context).size.width / 3.3,
      child: SizedBox(
        height: 42,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          addRepaintBoundaries: true,
          itemCount: itemCount,
          padding: const EdgeInsets.symmetric(vertical: 18),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 375),
              margin: const EdgeInsets.symmetric(horizontal: 2),
              height: 6,
              width: pageIndex == index ? 40 : 30,
              decoration: BoxDecoration(
                color: pageIndex == index ? Colors.white : Colors.grey.shade900,
                borderRadius: BorderRadius.circular(15),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width / 2 - 120,
      right: MediaQuery.of(context).size.width / 2 - 120,
      bottom: -25,
      child: MaterialButton(
        onPressed: () {},
        height: 60,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        color: AppColors.buttonColor,
        child: Text(
          "Comprar",
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 20),
        ),
      ),
    );
  }
}
