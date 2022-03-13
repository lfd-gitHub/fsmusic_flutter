import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsmusic_flutter/pages/basic/base_event.dart';
import 'package:fsmusic_flutter/pages/basic/base_service.dart';
import 'package:fsmusic_flutter/pages/basic/base_state.dart';
import 'package:fsmusic_flutter/widgets/fsm_appbar.dart';

abstract class BasePage<SER extends BaseService<E, S>, E extends BaseEvent, S extends BaseState> extends StatelessWidget {
  const BasePage({Key? key}) : super(key: key);

  String? withTitle() => null;
  AppBar? withappBar() => null;
  Color? bodyColor() => null;

  SER service();

  bool bodyReBuildWhen(S s1, S s2) => false;

  Widget body(BuildContext context) => const SizedBox();
  Widget bodyWithTheme(BuildContext context, ThemeData theme) => body(context);
  Widget bodyWithThemeAndState(BuildContext context, S state, ThemeData theme) //
      =>
      bodyWithTheme(context, theme);

  Widget widgetBuilder({bool Function(S pre, S cur)? buildWhen, required Widget Function(BuildContext, SER, S) builder}) {
    return BlocBuilder<SER, S>(buildWhen: buildWhen, builder: (ctx, state) => builder(ctx, ctx.read<SER>(), state));
  }

  Widget widgetListener({required Widget child, required void Function(BuildContext, S) listener}) {
    return BlocListener<SER, S>(listener: listener, child: child);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: withappBar() ?? (withTitle() == null ? null : FsmAppbar.def(withTitle()!)),
      backgroundColor: bodyColor(),
      body: BlocProvider(
        create: (ctx) => service(),
        child: BlocBuilder<SER, S>(
          buildWhen: bodyReBuildWhen,
          builder: (ctx, state) => bodyWithThemeAndState(context, state, Theme.of(context)),
        ),
      ),
    );
  }
}

abstract class DefaultPage extends BasePage<DefaultService, DefaultEvent, DefaultState> {
  const DefaultPage({Key? key}) : super(key: key);

  @override
  DefaultService service() => DefaultService();
}
