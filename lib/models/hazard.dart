class HazardModel {
  final String name;
  final String src;
  final String video;

  String get imageSrc => 'assets/images/hazard/$src.png';

  String get videoSrc => '$video.mp4';

  HazardModel({
    required this.name,
    required this.src,
    required this.video,
  });
}

List<HazardModel> hsHazardModels = [
  HazardModel(
      name: 'Explosive Eruptions',
      src: '1_1',
      video: 'Explosive Eruptions_ The Hazard (VolFilm)'),
  HazardModel(
      name: 'Lahars', src: '1_2', video: 'Lahars_ The Hazard (VolFilm)'),
  HazardModel(name: 'Lava', src: '1_3', video: 'Lava_ The Hazard (VolFilm)'),
  HazardModel(
      name: 'Pyroclastic Flows',
      src: '1_4',
      video: 'Pyroclastic Flows_ The Hazard (VolFilm)'),
  HazardModel(
      name: 'Volcanic Gas',
      src: '1_5',
      video: 'Volcanic Gas_ The Hazard (VolFilm)'),
];
List<HazardModel> hsImpactModels = [
  HazardModel(
      name: 'Explosive Eruptions',
      src: '2_1',
      video: 'Explosive Eruptions_ The Impact (VolFilm)'),
  HazardModel(
      name: 'Lahars', src: '2_2', video: 'Lahars_ The Impact (VolFilm)'),
  HazardModel(name: 'Lava', src: '2_3', video: 'Lava_ The Impact (VolFilm)'),
  HazardModel(
      name: 'Pyroclastic Flows',
      src: '2_4',
      video: 'Pyroclastic Flows _ The Impact (VolFilm)'),
  HazardModel(
      name: 'Volcanic Gas',
      src: '2_5',
      video: 'Volcanic Gas_ The Impact (VolFilm)'),
];
