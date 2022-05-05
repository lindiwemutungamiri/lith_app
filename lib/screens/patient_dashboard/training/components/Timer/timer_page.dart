import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lith_app/screens/patient_dashboard/training/components/Timer/ticker.dart';
import 'package:lith_app/screens/patient_dashboard/training/components/Timer/timer_bloc.dart';
import 'package:lith_app/screens/patient_dashboard/training/courses/breathing.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(ticker: const Ticker()),
      child: const TimerView(),
    );
  }
}

class TimerView extends StatefulWidget {
  const TimerView({Key? key}) : super(key: key);

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> with TickerProviderStateMixin {
  AnimationController? _breathingController;
  var _breathe = 0.0;
  var duration = 4000;
  bool beginAnimation = false;

  @override
  void initState() {
    super.initState();
    _breathingController = AnimationController(
        vsync: this, duration: Duration(milliseconds: duration));
    _breathingController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _breathingController!.duration = const Duration(milliseconds: 4000);
        _breathingController!.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _breathingController!.duration = const Duration(milliseconds: 5000);
        _breathingController!.forward();
      }
    });

    _breathingController!.addListener(() {
      setState(() {
        _breathe = _breathingController!.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const TimerText(),
            const SizedBox(
              height: 50,
            ),
            breathCircle(context),
            const SizedBox(
              height: 50,
            ),
            actions(context)!,
          ],
        ),
      ],
    );
  }

  Widget? actions(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        if (state.duration == 0) {
          _breathingController!.stop();
          _breathingController!.reset();
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (state is TimerInitial) ...[
              FloatingActionButton(
                backgroundColor: const Color(0xFF419AAA),
                child: const Icon(Icons.play_arrow),
                onPressed: () => {
                  context
                      .read<TimerBloc>()
                      .add(TimerStarted(duration: state.duration)),
                  _breathingController!.forward(),
                },
              ),
            ],
            if (state is TimerRunInProgress) ...[
              FloatingActionButton(
                  backgroundColor: const Color(0xFF419AAA),
                  child: const Icon(Icons.pause),
                  onPressed: () => {
                        context.read<TimerBloc>().add(const TimerPaused()),
                        _breathingController!.stop(),
                      }),
              FloatingActionButton(
                  backgroundColor: const Color(0xFF419AAA),
                  child: const Icon(Icons.replay),
                  onPressed: () => {
                        context.read<TimerBloc>().add(const TimerReset()),
                        _breathingController!.reset(),
                        _breathingController!.stop(),
                      }),
            ],
            if (state is TimerRunPause) ...[
              FloatingActionButton(
                  backgroundColor: const Color(0xFF419AAA),
                  child: const Icon(Icons.play_arrow),
                  onPressed: () => {
                        context.read<TimerBloc>().add(const TimerResumed()),
                        _breathingController!.forward(),
                      }),
              FloatingActionButton(
                  backgroundColor: const Color(0xFF419AAA),
                  child: const Icon(Icons.replay),
                  onPressed: () => {
                        context.read<TimerBloc>().add(const TimerReset()),
                        _breathingController!.reset(),
                        _breathingController!.stop(),
                      }),
            ],
            if (state is TimerRunComplete) ...[
              FloatingActionButton(
                  backgroundColor: const Color(0xFF419AAA),
                  child: const Icon(Icons.replay),
                  onPressed: () => {
                        context.read<TimerBloc>().add(const TimerReset()),
                        _breathingController!.reset(),
                        _breathingController!.stop(),
                      }),
            ]
          ],
        );
      },
    );
  }

  Widget breathCircle(BuildContext context) {
    final size = 200.0 - 100.0 * _breathe;
    return Container(
      height: 210,
      width: 210,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          border: Border.all(color: const Color(0xFF0F677D)),
          color: const Color(0xFF0F677D),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 5,
              blurRadius: 5,
            )
          ]),
      child: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFF0F677D),
                    spreadRadius: 5,
                    blurRadius: 5,
                  )
                ]),
            child: Material(
              borderRadius: BorderRadius.circular(size / 1),
              color: const Color(0xFF45A9BA),
              child: SvgPicture.asset(
                'assets/icons/breathe.svg',
                width: 100,
                height: 100,
                color: Colors.white,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class TimerText extends StatelessWidget {
  const TimerText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    final minutesStr =
        ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$minutesStr:$secondsStr',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 50,
          ),
        ),
        IconButton(
            onPressed: () async {
              await showInformationDialog(context, minutesStr, secondsStr);
            },
            icon: const Icon(
              Icons.edit,
              size: 30,
              color: Colors.white,
            )),
      ],
    );
  }

  Future<void> showInformationDialog(
      BuildContext context, String min, String sec) async {
    final TextEditingController _textEditingController =
        TextEditingController();
    final TextEditingController _textEditingController2 =
        TextEditingController();
    _textEditingController.text = min;
    _textEditingController2.text = sec;

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _textEditingController,
                      validator: (value) {
                        return value!.isNotEmpty ? null : "Invalid Field";
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter minutes", suffixText: "minutes"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _textEditingController2,
                      validator: (value) {
                        return value!.isNotEmpty ? null : "Invalid Field";
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter Seconds", suffixText: "seconds"),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setDuration(int.parse(_textEditingController.text) * 60 +
                          int.parse(_textEditingController2.text));
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Breathing()));
                    }
                  },
                ),
              ],
            );
          });
        });
  }
}
