part of '../services.dart';

class _ServiceCard extends StatefulWidget {
  final ServicesUtils service;

  const _ServiceCard({Key? key, required this.service}) : super(key: key);

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {},
      onHover: (isHovering) {
        if (isHovering) {
          setState(() => isHover = true);
        } else {
          setState(() => isHover = false);
        }
      },
      child: Container(
        width: Responsive.isTablet(context) ? 400 : 300,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          gradient: isHover ? pinkpurple.withOpacity(0.9) : theme.serviceCard,
          borderRadius: BorderRadius.circular(15),
          boxShadow: isHover ? [primaryColorShadow] : [blackColorShadow],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              widget.service.icon,
              height: 60,
            ),
            Space.y(2.w)!,
            Text(widget.service.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.7,
                  color: isHover ? whiteColor : theme.textColor,
                )),
            Space.y(1.5.h)!,
            if (Responsive.isDesktop(context))
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.service.tool
                      .map((e) => Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('🛠   '),
                              Expanded(
                                child: ExpandableText(
                                  text: e,
                                  maxLines: 3,
                                  style: TextStyle(
                                    color: isHover ? whiteColor : theme.textColor,
                                  ),
                                ),
                              ),
                            ],
                          ))
                      .toList()),
            if (Responsive.isMobile(context) || Responsive.isTablet(context))
              Expanded(
                child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: widget.service.tool
                        .map((e) => Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('🛠   '),
                                Expanded(
                                  child: Text(e,
                                      style: TextStyle(
                                        color: isHover ? whiteColor : theme.textColor,
                                      )),
                                ),
                              ],
                            ))
                        .toList()),
              )
          ],
        ),
      ),
    );
  }
}

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle? style;

  const ExpandableText({
    required this.text,
    this.maxLines = 3,
    this.style,
    super.key,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _showFullText = false;
  bool _isOverflowing = false;

  @override
  Widget build(BuildContext context) {
    final span = TextSpan(text: widget.text, style: widget.style);
    final tp = TextPainter(
      text: span,
      maxLines: widget.maxLines,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: 230); // match your SizedBox width

    _isOverflowing = tp.didExceedMaxLines;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: _showFullText ? null : widget.maxLines,
          overflow: _showFullText ? TextOverflow.visible : TextOverflow.ellipsis,
          style: widget.style,
        ),
        if (_isOverflowing && !_showFullText)
          GestureDetector(
            onTap: () => setState(() => _showFullText = true),
            child: Text(
              'more',
              style: widget.style?.copyWith(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
      ],
    );
  }
}
