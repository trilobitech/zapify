class HistoryEntry {
  HistoryEntry({
    required this.phoneNumber,
    required this.lastUsageAt,
    required this.createdAt,
  });

  factory HistoryEntry.fromJson(Map<String, dynamic> json) {
    return HistoryEntry(
      phoneNumber: json['number'],
      lastUsageAt: DateTime.parse('${json['last_usage_at']}'),
      createdAt: DateTime.parse('${json['created_at']}'),
    );
  }

  String phoneNumber;
  DateTime lastUsageAt;
  DateTime createdAt;

  @override
  int get hashCode => phoneNumber.hashCode;

  @override
  bool operator ==(Object other) {
    return super == other ||
        (other is HistoryEntry && other.phoneNumber == phoneNumber);
  }

  @override
  String toString() =>
      'HistoryEntry{phoneNumber: $phoneNumber, lastUsageAt: $lastUsageAt, createdAt: $createdAt}';
}
