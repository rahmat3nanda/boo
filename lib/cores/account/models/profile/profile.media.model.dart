import 'package:boo/cores/account/enums/profile.media.type.dart'
    show ProfileMediaType;

class ProfileMedia {
  const ProfileMedia({this.url, this.thumbnail, this.metadata});

  final String? url;
  final String? thumbnail;
  final ProfileMediaMetadata? metadata;
}

class ProfileMediaMetadata {
  const ProfileMediaMetadata({
    this.mime,
    this.size,
    this.width,
    this.height,
    this.type,
    this.duration,
  });

  final String? mime;
  final double? size;
  final double? width;
  final double? height;
  final ProfileMediaType? type;
  final double? duration;
}
