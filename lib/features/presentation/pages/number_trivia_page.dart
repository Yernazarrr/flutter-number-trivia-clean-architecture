import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/number_bloc.dart';
import '../bloc/number_event.dart';
import '../bloc/number_state.dart';
import '../widgets/history_list_widget.dart';
import '../widgets/result_card_widget.dart';

import '../../../core/theme/theme_cubit.dart';

class NumberTriviaPage extends StatefulWidget {
  const NumberTriviaPage({super.key});

  @override
  State<NumberTriviaPage> createState() => _NumberTriviaPageState();
}

class _NumberTriviaPageState extends State<NumberTriviaPage> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _getConcreteNumber() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<NumberBloc>().add(
        NumberEvent.getConcreteNumber(int.parse(_controller.text.trim())),
      );
      FocusScope.of(context).unfocus();
    }
  }

  bool _isLoading(NumberState state) => state is Loading;

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Numbers Trivia App'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: context.read<ThemeCubit>().toggle,
            icon: Icon(
              themeMode == ThemeMode.dark
                  ? Icons.light_mode_rounded
                  : Icons.dark_mode_rounded,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ResultCardWidget(),
              const SizedBox(height: 24),

              BlocBuilder<NumberBloc, NumberState>(
                builder: (context, state) {
                  return FilledButton.icon(
                    onPressed: _isLoading(state)
                        ? null
                        : () => context.read<NumberBloc>().add(
                            const NumberEvent.getRandomNumber(),
                          ),
                    icon: const Icon(Icons.casino_rounded),
                    label: const Text('Random number'),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),

              BlocBuilder<NumberBloc, NumberState>(
                builder: (context, state) {
                  final loading = _isLoading(state);
                  return Form(
                    key: _formKey,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _controller,
                            keyboardType: TextInputType.number,
                            enabled: !loading,
                            decoration: const InputDecoration(
                              labelText: 'Enter a number',
                              prefixIcon: Icon(Icons.tag_rounded),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Enter a number.';
                              }
                              if (int.tryParse(value.trim()) == null) {
                                return 'Only integers are allowed.';
                              }
                              return null;
                            },
                            onFieldSubmitted: (_) => _getConcreteNumber(),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: FilledButton.tonal(
                            onPressed: loading ? null : _getConcreteNumber,
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: 14,
                                horizontal: 20,
                              ),
                            ),
                            child: const Icon(Icons.search_rounded),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),

              const HistoryListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
