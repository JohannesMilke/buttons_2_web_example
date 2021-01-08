import 'package:buttons_2_web_example/widget/tabbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WebPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => TabBarWidget(
        title: 'Buttons 2.0 For Web',
        tabs: [
          Tab(icon: Icon(Icons.color_lens), text: 'Colors'),
          Tab(icon: Icon(Icons.mouse), text: 'Cursors'),
          Tab(icon: Icon(Icons.settings_overscan), text: 'Overlay'),
          Tab(icon: Icon(Icons.title), text: 'Themes'),
          Tab(icon: Icon(Icons.title), text: 'Local Themes'),
        ],
        children: [
          buildColors(),
          buildCursors(),
          buildOverlay(),
          buildThemes(),
          buildLocalThemes(context),
        ],
      );

  Color getForegroundColor(Set<MaterialState> states) {
    const interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
    };

    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    } else if (states.contains(MaterialState.focused)) {
      return Colors.green;
    } else {
      return Colors.white;
    }
  }

  Color getBackgroundColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.focused)) return Colors.green;
    if (states.contains(MaterialState.pressed)) return Colors.red;
    if (states.contains(MaterialState.hovered)) return Colors.white;

    return null;
  }

  BorderSide getBorderSide(Set<MaterialState> states) {
    final color = getForegroundColor(states);

    return BorderSide(width: 3, color: color);
  }

  Widget buildColors() {
    final foregroundColor =
        MaterialStateProperty.resolveWith<Color>(getForegroundColor);
    final backgroundColor =
        MaterialStateProperty.resolveWith<Color>(getBackgroundColor);
    final side = MaterialStateProperty.resolveWith<BorderSide>(getBorderSide);

    final style = ButtonStyle(
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
    );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: style,
            child: buildText('Text Button'),
            onPressed: () => print('Short Press!'),
            onLongPress: () => print('Long Press!'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: style,
            child: buildText('Elevated Button'),
            onPressed: () => print('Short Press!'),
            onLongPress: () => print('Long Press!'),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            style: style.copyWith(side: side),
            child: buildText('Outlined Button'),
            onPressed: () => print('Short Press!'),
            onLongPress: () => print('Long Press!'),
          ),
        ],
      ),
    );
  }

  Color getOverlayColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.hovered)) return Colors.green;
    if (states.contains(MaterialState.pressed)) return Colors.red;

    return null;
  }

  Widget buildOverlay() {
    final backgroundColor = MaterialStateProperty.all<Color>(Colors.green);
    final foregroundColor = MaterialStateProperty.all<Color>(Colors.white);
    final sideColor = MaterialStateProperty.all<BorderSide>(
        BorderSide(color: Colors.white, width: 2));
    final overlayColor =
        MaterialStateProperty.resolveWith<Color>(getOverlayColor);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: ButtonStyle(
              foregroundColor: foregroundColor,
              overlayColor: overlayColor,
            ),
            child: buildText('Text Button'),
            onPressed: () => print('Short Press!'),
            onLongPress: () => print('Long Press!'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ButtonStyle(
              foregroundColor: foregroundColor,
              backgroundColor: backgroundColor,
              overlayColor: overlayColor,
            ),
            child: buildText('Elevated Button'),
            onPressed: () => print('Short Press!'),
            onLongPress: () => print('Long Press!'),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            style: ButtonStyle(
              foregroundColor: foregroundColor,
              side: sideColor,
              overlayColor: overlayColor,
            ),
            child: buildText('Outlined Button'),
            onPressed: () => print('Short Press!'),
            onLongPress: () => print('Long Press!'),
          ),
        ],
      ),
    );
  }

  Widget buildThemes() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: buildText('Text Button'),
              onPressed: () => print('Short Press!'),
              onLongPress: () => print('Long Press!'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: buildText('Elevated Button'),
              onPressed: () => print('Short Press!'),
              onLongPress: () => print('Long Press!'),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              child: buildText('Outlined Button'),
              onPressed: () => print('Short Press!'),
              onLongPress: () => print('Long Press!'),
            ),
          ],
        ),
      );

  Widget buildLocalThemes(BuildContext context) {
    final textButtonTheme = TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.blue,
      ),
    );

    final elevatedButtonTheme = ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.blue,
        primary: Colors.white,
      ),
    );
    final outlinedButtonTheme = OutlinedButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.blue,
        side: BorderSide(color: Colors.blue),
      ),
    );

    /*
    OutlinedButtonTheme(
        data: outlinedButtonTheme,
        child: ElevatedButtonTheme(
          data: elevatedButtonTheme,
          child: TextButtonTheme(
            data: textButtonTheme,
            child:
     */

    return Theme(
      data: Theme.of(context).copyWith(
        textButtonTheme: textButtonTheme,
        elevatedButtonTheme: elevatedButtonTheme,
        outlinedButtonTheme: outlinedButtonTheme,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: buildText('Text Button'),
              onPressed: () => print('Short Press!'),
              onLongPress: () => print('Long Press!'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: buildText('Elevated Button'),
              onPressed: () => print('Short Press!'),
              onLongPress: () => print('Long Press!'),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              child: buildText('Outlined Button'),
              onPressed: () => print('Short Press!'),
              onLongPress: () => print('Long Press!'),
            ),
          ],
        ),
      ),
    );
  }

/*
ElevatedButton(
              style: ElevatedButton.styleFrom(
                enabledMouseCursor: SystemMouseCursors.copy,
              ),
              child: buildText(SystemMouseCursors.basic.kind),
              onPressed: () {},
            ),
            */

  Widget buildCursors() {
    final cursors = <SystemMouseCursor>[
      SystemMouseCursors.none,
      SystemMouseCursors.basic,
      SystemMouseCursors.alias,
      SystemMouseCursors.allScroll,
      SystemMouseCursors.cell,
      SystemMouseCursors.click,
      SystemMouseCursors.contextMenu,
      SystemMouseCursors.copy,
      SystemMouseCursors.disappearing,
      SystemMouseCursors.forbidden,
      SystemMouseCursors.grab,
      SystemMouseCursors.grabbing,
      SystemMouseCursors.help,
      SystemMouseCursors.move,
      SystemMouseCursors.noDrop,
      SystemMouseCursors.precise,
      SystemMouseCursors.progress,
      SystemMouseCursors.text,
      SystemMouseCursors.verticalText,
      SystemMouseCursors.wait,
      SystemMouseCursors.zoomIn,
      SystemMouseCursors.zoomOut,
      SystemMouseCursors.resizeColumn,
      SystemMouseCursors.resizeDown,
      SystemMouseCursors.resizeDownLeft,
      SystemMouseCursors.resizeDownRight,
      SystemMouseCursors.resizeLeft,
      SystemMouseCursors.resizeLeftRight,
      SystemMouseCursors.resizeRight,
      SystemMouseCursors.resizeRow,
      SystemMouseCursors.resizeUp,
      SystemMouseCursors.resizeUpDown,
      SystemMouseCursors.resizeUpLeft,
      SystemMouseCursors.resizeUpLeftDownRight,
      SystemMouseCursors.resizeUpRight,
      SystemMouseCursors.resizeUpRightDownLeft,
    ];

    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: cursors
              .map((cursor) => Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        enabledMouseCursor: cursor,
                      ),
                      child: buildText(cursor.kind),
                      onPressed: () {},
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget buildText(String text) => Text(text, style: TextStyle(fontSize: 28));
}
