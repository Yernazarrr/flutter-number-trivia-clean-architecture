import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/number_entity.dart';
import '../bloc/number_bloc.dart';
import '../bloc/number_state.dart';

class HistoryListWidget extends StatelessWidget {
  const HistoryListWidget({super.key});

  List<NumberEntity> _getHistory(NumberState state) => switch (state) {
    Initial() => const [],
    Loading(:final history) => history,
    Loaded(:final history) => history,
    ErrorDetails(:final history) => history,
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NumberBloc, NumberState>(
      builder: (context, state) {
        final history = _getHistory(state);

        if (history.isEmpty) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'History',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: history.length,
              separatorBuilder: (_, _) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final entity = history[index];
                return _HistoryItem(entity: entity);
              },
            ),
          ],
        );
      },
    );
  }
}

class _HistoryItem extends StatelessWidget {
  final NumberEntity entity;
  const _HistoryItem({required this.entity});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: colorScheme.outlineVariant),
      ),
      leading: CircleAvatar(
        backgroundColor: colorScheme.secondaryContainer,
        child: Text(
          entity.number.toString(),
          style: TextStyle(
            fontSize: 12,
            color: colorScheme.onSecondaryContainer,
          ),
        ),
      ),
      title: Text(entity.text, maxLines: 2, overflow: TextOverflow.ellipsis),
    );
  }
}
