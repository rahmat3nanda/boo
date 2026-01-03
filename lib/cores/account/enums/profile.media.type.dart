enum ProfileMediaType {
  image,
  video;

  static ProfileMediaType? from(String? s) => switch (s) {
    'image' => image,
    'video' => video,
    _ => null,
  };

  @override
  String toString() => switch (this) {
    image => 'image',
    video => 'video',
  };
}
