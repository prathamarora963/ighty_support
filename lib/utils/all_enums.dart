enum ProfileType { fromSignup, fromProfile, defaultType }

class ProfileStatus {
  final ProfileType profileType;
  ProfileStatus({required this.profileType});
  static ProfileType fromInt(int type) {
    switch (type) {
      case 1:
        return ProfileType.fromSignup;
      case 2:
        return ProfileType.fromProfile;
      default:
        return ProfileType.defaultType;
    }
  }
}

enum FeatureType {
  isFertilizerPlan,
  isGarden,
  isSand,
  isPhoto,
  isPlant,
  defaultType,
}

class Status {
  final FeatureType featureType;
  Status({required this.featureType});
  static FeatureType fromInt(int type) {
    switch (type) {
      case 1:
        return FeatureType.isFertilizerPlan;
      case 2:
        return FeatureType.isGarden;
      case 3:
        return FeatureType.isSand;
      case 4:
        return FeatureType.isPhoto;
      case 5:
        return FeatureType.isPlant;
      default:
        return FeatureType.defaultType;
    }
  }
}
