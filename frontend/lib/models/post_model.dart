class PostModel {
  PostModel({
    required this.id,
    required this.sourceId,
    required this.title,
    required this.submissionDate,
    required this.termNumber,
    required this.isUrgent,
    required this.aiSummary,
    required this.tags,
    required this.statusNormalized,
    required this.statusDisplayName,
    required this.statusLegislativePath,
    required this.likesCount,
    required this.justificationPdf,
    required this.sourceLink,
    required this.sponsorParty,
    required this.representativeName,
    this.steps = const [],
  });

  final int id;
  final String sourceId;
  final String title;
  final DateTime submissionDate;
  final int termNumber;
  final bool isUrgent;
  final String aiSummary;
  final List<String> tags;
  final String statusNormalized;
  final String statusDisplayName;
  final String statusLegislativePath;
  final int likesCount;
  final String justificationPdf;
  final String sourceLink;
  final String sponsorParty;
  final String representativeName;
  final List<PostStep> steps;

  PostModel.fromJson(Map<String, dynamic> json)
    : id = json["id"] as int,
      sourceId = json["source_id"] as String,
      title = json["title"] as String,
      submissionDate = DateTime.parse(json["submission_date"] as String),
      termNumber = json["term_number"] as int,
      isUrgent = json["is_urgent"] as bool,
      aiSummary = json["ai_summary"] as String,
      tags =
          (json["tags"] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      statusNormalized = json["status_normalized"] as String,
      statusDisplayName = json["status_display_name"] as String,
      statusLegislativePath = json["legislative_path"] as String,
      likesCount = json["likes_count"] as int,
      justificationPdf = json["justification_pdf"] as String,
      sourceLink = json["source_link"] as String,
      sponsorParty = json["sponsor_party"] as String,
      representativeName = json["representative_name"] as String,
      steps =
          (json["steps"] as List<dynamic>?)
              ?.map((e) => PostStep.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];

  @override
  String toString() {
    return 'PostModel(id: $id, sourceId: $sourceId, title: $title, submissionDate: $submissionDate, termNumber: $termNumber, isUrgent: $isUrgent, aiSummary: ${aiSummary.length > 120 ? '${aiSummary.substring(0, 120)}…' : aiSummary}, tags: $tags, statusNormalized: $statusNormalized, statusDisplayName: $statusDisplayName, statusLegislativePath: $statusLegislativePath, likesCount: $likesCount, justificationPdf: $justificationPdf, sourceLink: $sourceLink, representative: $representativeName, sponsorParty: $sponsorParty)';
  }
}

class PostStep {
  final String date;
  final String label;
  final String description;
  final String iconType; // np. START, VOTE, VETO
  final bool isCompleted;
  final bool highlight;

  PostStep({
    this.date = "",
    this.label = "",
    this.description = "",
    this.iconType = "WORK",
    this.isCompleted = false,
    this.highlight = false,
  });

  factory PostStep.fromJson(Map<String, dynamic> json) {
    return PostStep(
      date: json["date"] as String? ?? "",
      label: json["label"] as String? ?? "",
      description: json["description"] as String? ?? "",
      iconType: json["icon_type"] as String? ?? "WORK",
      isCompleted: json["is_completed"] as bool? ?? false,
      highlight: json["highlight"] as bool? ?? false,
    );
  }
}
