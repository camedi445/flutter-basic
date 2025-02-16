PostType postTypeFromString(String? type) {
  switch (type) {
    case 'image':
      return PostType.image;
    case 'video':
      return PostType.video;
    default:
      throw ArgumentError('Tipo de post no reconocido: $type');
  }
}

enum PostType {
  image,
  video,
}
