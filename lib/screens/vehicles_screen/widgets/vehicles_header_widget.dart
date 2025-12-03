import 'package:flutter/material.dart';

class VehiclesHeaderWidget extends StatelessWidget {
  final String searchHint;
  final int activeCount;
  final int idleCount;
  final ValueChanged<String>? onSearch;
  final ValueChanged<String>? onFilterChanged;

  const VehiclesHeaderWidget({
    super.key,
    this.searchHint = 'Search vehicles, drivers...',
    this.activeCount = 2,
    this.idleCount = 2,
    this.onSearch,
    this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final radius = 12.0;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SEARCH BAR
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: TextField(
            onChanged: onSearch,
            decoration: InputDecoration(
              hintText: searchHint,
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              filled: true,
              fillColor: const Color(0xFFF4F6F8),
              contentPadding: const EdgeInsets.symmetric(vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),

        // FILTER PILL BUTTONS
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _filterPill(
                context,
                'All',
                selected: true,
                onTap: () => _callFilter('All'),
              ),
              _filterPill(
                context,
                'Active',
                selected: false,
                onTap: () => _callFilter('Active'),
              ),
              _filterPill(
                context,
                'Idle',
                selected: false,
                onTap: () => _callFilter('Idle'),
              ),
            ],
          ),
        ),

        const SizedBox(height: 14),

        // STAT CARDS (two cards)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(child: _statCard(context, activeCount, 'Active')),
              const SizedBox(width: 12),
              Expanded(child: _statCard(context, idleCount, 'Idle')),
            ],
          ),
        ),
      ],
    );
  }

  Widget _filterPill(
    BuildContext context,
    String label, {
    bool selected = false,
    VoidCallback? onTap,
  }) {
    return Material(
      color: selected ? const Color(0xFF2D6CED) : Colors.white,
      elevation: selected ? 0 : 0,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: selected ? Colors.transparent : const Color(0xFFE6E9EE),
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: selected ? Colors.white : const Color(0xFF333A44),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _statCard(BuildContext context, int count, String label) {
    return Container(
      height: 84,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE8EDF2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$count',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: label == 'Active'
                  ? const Color(0xFF1FA05D)
                  : const Color(0xFF2E3A59),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  void _callFilter(String value) {
    if (onFilterChanged != null) onFilterChanged!(value);
  }
}
