import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/number_bloc.dart';
import '../bloc/number_state.dart';

class ResultCardWidget extends StatelessWidget {
  const ResultCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NumberBloc, NumberState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: switch (state) {
            Initial() => _buildPlaceholder(context),
            Loading() => _buildLoading(context),
            Loaded(:final number) => _buildResult(
              context,
              numberText: number.number.toString(),
              factText: number.text,
            ),
            ErrorDetails(:final message) => _buildError(context, message),
          },
        );
      },
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      key: const ValueKey('placeholder'),
      color: colorScheme.surfaceContainerHighest,
      child: const Padding(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Text(
            'Tap a button or enter a number',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      key: const ValueKey('loading'),
      color: colorScheme.surfaceContainerHighest,
      child: const Padding(
        padding: EdgeInsets.all(48),
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildResult(
    BuildContext context, {
    required String numberText,
    required String factText,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      key: const ValueKey('result'),
      color: colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              numberText,
              style: TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.bold,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              factText,
              style: TextStyle(
                fontSize: 16,
                color: colorScheme.onPrimaryContainer,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context, String message) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      key: const ValueKey('error'),
      color: colorScheme.errorContainer,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            Icon(
              Icons.error_outline_rounded,
              color: colorScheme.onErrorContainer,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: TextStyle(color: colorScheme.onErrorContainer),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
