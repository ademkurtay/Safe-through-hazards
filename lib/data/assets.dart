const String _pathImages = 'assets/images/';
const String _pathIcons = 'assets/icons/';

class DCheckImages {
  static const String premium = '${_pathImages}premium.png';
  static const String guideVideoImage = '${_pathImages}guide_video.png';
  static const String checklistPremium = '${_pathImages}checklist_premium.png';
  static const String quizBackground = '${_pathImages}quiz_background.png';
  static const String quizResultBackground =
      '${_pathImages}quiz_result_background.png';

  static String guide(int i) => '${_pathImages}guide/image $i.png';
}

class DCheckIcons {
  static const String play = '${_pathIcons}play.svg';
  static const String chevronRight = '${_pathIcons}chevron_right.svg';
  static const String lock = '${_pathIcons}lock.svg';
  static const String back = '${_pathIcons}back.svg';
  static const String close = '${_pathIcons}close.svg';
  static const String premClose = '${_pathIcons}prem_close.svg';

  static const String checkFilled = '${_pathIcons}check-filled.svg';
  static const String checkUnfilled = '${_pathIcons}check-unfilled.svg';

  static const String tableChevronRight =
      '${_pathIcons}table-chevron-right.svg';
}
