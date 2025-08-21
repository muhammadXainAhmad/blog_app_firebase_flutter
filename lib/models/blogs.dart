class BlogModel {
  final String uid;
  final String blogId;
  final String blogTitle;
  final String name;
  final String blogContent;
  final String? blogImage;
  final DateTime postedAt;

  BlogModel({
    required this.uid,
    required this.blogId,
    required this.blogTitle,
    required this.name,
    required this.blogContent,
    this.blogImage,
    required this.postedAt,
  });

  Map<String, dynamic> toMap() => {
    "uid": uid,
    "blogId": blogId,
    "blogTitle":blogTitle,
    "name": name,
    "blogContent": blogContent,
    "blogImage": blogImage,
    "postedAt": postedAt,
  };
}
