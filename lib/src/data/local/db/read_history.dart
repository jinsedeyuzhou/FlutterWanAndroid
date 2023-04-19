import 'package:floor/floor.dart';
@Entity(tableName: "read_history")
class ReadHistory {

  @PrimaryKey(autoGenerate: true)
  final int? id;

  final int? cid;

  final String title;
  final String link;
  final DateTime timestamp;

  ReadHistory(this.id, this.cid, this.title, this.link, this.timestamp);


  factory ReadHistory.optional({
    int? id,
    int? cid,
    String? title,
    String? link,
    DateTime? timestamp,
  }) =>
      ReadHistory(
        id,
        cid,
        title ?? 'empty',
        link ?? 'empty',
        timestamp ?? DateTime.now(),
      );

  @override
  String toString() {
    return 'Task{id: $id, cid: $cid, title: $title, timestamp: $timestamp, link: $link}';
  }

  ReadHistory copyWith({
    int? id,
    int? cid,
    String? title,
    String? link,
    DateTime? timestamp,
  }) {
    return ReadHistory(
      id,
      cid,
      title ?? 'empty',
      link ?? 'empty',
      timestamp ?? DateTime.now(),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ReadHistory &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              cid == other.cid &&
              title == other.title &&
              timestamp == other.timestamp &&
              link == other.link;

  @override
  int get hashCode =>
      id.hashCode ^
      cid.hashCode ^
      title.hashCode ^
      timestamp.hashCode ^
      link.hashCode;


}
