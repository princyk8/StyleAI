class User {
  final String id;
  final String name;
  final String email;
  final String profileImage;
  final String gender;
  final String preferredStyle;

  const User({
    required this.id,
    required this.name,
    required this.email,
    this.profileImage = '',
    this.gender = '',
    this.preferredStyle = '',
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? profileImage,
    String? gender,
    String? preferredStyle,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
      gender: gender ?? this.gender,
      preferredStyle: preferredStyle ?? this.preferredStyle,
    );
  }
}