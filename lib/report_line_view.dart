import 'package:flutter/material.dart';

const nameColor = Color(0xff4B5B79);
const positionColor = Color(0xff727272);
const buttonColor = Color(0xFFF5F5F5);

class ReportLineView extends StatelessWidget {
  const ReportLineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: buttonColor,
        title: const Text("Report Line", style: TextStyle(color: nameColor)),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
        children: const [
          _DropDownButon(),
          SizedBox(height: 22),
          _Chart(),
        ],
      ),
    );
  }
}

class _Chart extends StatelessWidget {
  const _Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _IconButon(onTap: () {}),
        const _Line(
          heigh: 20,
          padding: EdgeInsets.only(left: 27),
        ),
        const _ItemChart(lineHeight: 20),
        const _ItemChart(
          lineHeight: 45,
          name: 'John Doe',
          position: 'Marketing and Community Manager',
        ),
        const Baseline(
          baseline: -4,
          baselineType: TextBaseline.alphabetic,
          child: _ItemChart(
            name: 'John Doe',
            position: 'Marketing and Community Manager',
            lineWidth: 35,
            lineHeight: 200,
            isActive: true,
            padding: EdgeInsets.only(left: 27),
          ),
        ),
        const Baseline(
          baselineType: TextBaseline.alphabetic,
          baseline: -155,
          child: _ItemChart(
            name: 'Antoine Langais',
            position: 'Chief Technical Officer',
            lineWidth: 30,
            padding: EdgeInsets.only(left: 89),
          ),
        ),
        const Baseline(
          baselineType: TextBaseline.alphabetic,
          baseline: -80,
          child: _ItemChart(
            name: 'Famke Jenssens',
            position: 'Markting and Community Manager',
            lineWidth: 30,
            padding: EdgeInsets.only(left: 89),
          ),
        ),
        Baseline(
          baseline: 11,
          baselineType: TextBaseline.alphabetic,
          child: _ItemChart(
            padding: const EdgeInsets.only(left: 89),
            lineWidth: 30,
            child: _IconButon(
              onTap: () {},
              icon: const Icon(
                Icons.more_horiz,
                color: nameColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Line extends StatelessWidget {
  const _Line({
    Key? key,
    this.heigh,
    this.width,
    this.padding,
  }) : super(key: key);
  final double? heigh, width;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        height: heigh ?? 2,
        width: width ?? 2,
        child: const ColoredBox(color: Color(0xFFE0E0E0)),
      ),
    );
  }
}

class _DropDownButon extends StatelessWidget {
  const _DropDownButon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: double.infinity,
      color: buttonColor,
      padding: const EdgeInsets.only(left: 16, right: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Functional Chart (Default)',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff4B5B79),
            ),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: Color(0xFF757575),
            size: 30,
          ),
        ],
      ),
    );
  }
}

class _IconButon extends StatelessWidget {
  const _IconButon({Key? key, this.icon, this.onTap}) : super(key: key);
  final Widget? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 26,
        decoration: const BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: icon ??
            const Icon(
              Icons.keyboard_double_arrow_up,
              color: nameColor,
            ),
      ),
    );
  }
}

class _ItemChart extends StatelessWidget {
  const _ItemChart({
    Key? key,
    this.lineWidth = 0,
    this.lineHeight = 0,
    this.isActive = false,
    this.name,
    this.pathAvatar,
    this.position,
    this.radiusAvatar = 27,
    this.padding,
    this.child,
  }) : super(key: key);
  final double lineWidth, lineHeight, radiusAvatar;

  final String? name, position, pathAvatar;
  final bool isActive;
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  double get _paddingLineHeight => radiusAvatar + lineWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (lineWidth > 0) _Line(width: lineWidth),
              child ??
                  Expanded(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: radiusAvatar,
                          backgroundImage: NetworkImage(
                            pathAvatar ??
                                "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg",
                          ),
                          backgroundColor: buttonColor,
                          child: isActive
                              ? Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colors.blue, width: 3),
                                  ),
                                )
                              : null,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                name ?? 'Peter Parker',
                                style: TextStyle(
                                  color: const Color(0xff4B5B79),
                                  fontSize: 13,
                                  fontWeight: isActive
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                position ?? 'Chief Executive Officer',
                                style: const TextStyle(
                                  color: Color(0xff727272),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
            ],
          ),
          if (lineHeight > 0)
            _Line(
              heigh: lineHeight,
              padding: EdgeInsets.only(left: _paddingLineHeight),
            ),
        ],
      ),
    );
  }
}
