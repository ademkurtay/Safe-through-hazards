class QuizModel {
  final String question;
  final List<String> answer;
  final int indexCurrentAnswer;

  QuizModel(
      {required this.question,
      required this.answer,
      required this.indexCurrentAnswer});
}

List<QuizModel> quizModels = [
  QuizModel(
      question:
          "What is the first and most important step to protect yourself and your family during a volcanic eruption?",
      indexCurrentAnswer: 0,
      answer: [
        "Following advice from local officials",
        "Stocking up on emergency supplies",
        "Evacuating immediately",
        "Sealing windows and doors",
      ]),
  QuizModel(
      indexCurrentAnswer: 3,
      question:
          "What should be included in an emergency supply kit for a volcanic eruption?",
      answer: [
        "Extra clothing and blankets",
        "Flashlight and extra batteries",
        "Bottled water and canned food",
        "All of the above",
      ]),
  QuizModel(
      indexCurrentAnswer: 1,
      question:
          "Which respiratory protection is recommended for outdoor activities during a volcanic eruption?",
      answer: [
        "Surgical mask",
        "N-95 disposable respirator",
        "Cloth face covering",
        "Nuisance dust mask",
      ]),
  QuizModel(
      indexCurrentAnswer: 2,
      question: "What should you do if authorities instruct you to evacuate?",
      answer: [
        "Wait at home for further instructions",
        "Ignore the instructions and stay put",
        "Follow designated evacuation routes",
        "Shelter in place and close all windows",
      ]),
  QuizModel(
      indexCurrentAnswer: 0,
      question: "What should you do to prepare your vehicle for evacuation?",
      answer: [
        "Fill the gas tank",
        "Leave it uncovered for easy access",
        "Pack only essential items",
        "Disconnect the battery",
      ]),
  QuizModel(
      indexCurrentAnswer: 2,
      question:
          "What should you do if told to take shelter where you are during a volcanic eruption?",
      answer: [
        "Open windows to ventilate the room",
        "Turn on heating and air conditioning systems",
        "Gather emergency supplies and go to an interior room",
        "Ignore the instructions and continue with normal activities",
      ]),
  QuizModel(
      indexCurrentAnswer: 2,
      question:
          "Why is it important to have a hard-wired telephone in the designated shelter room?",
      answer: [
        "To call friends for updates",
        "To report non-emergency conditions",
        "To contact emergency services in case of life-threatening situations",
        "To play music for comfort",
      ]),
  QuizModel(
      indexCurrentAnswer: 1,
      question: "What should you do with pets during a volcanic eruption?",
      answer: [
        "Leave them outside to fend for themselves",
        "Take them with you to the designated shelter area",
        "Lock them in a separate room",
        "Abandon them and focus on human safety",
      ]),
  QuizModel(
      indexCurrentAnswer: 1,
      question: "What should you do if you have time before evacuating?",
      answer: [
        "Gather essential items and evacuate immediately",
        "Turn off gas, electricity, and water",
        "Leave windows and doors open for ventilation",
        "Pack unnecessary items for comfort",
      ]),
  QuizModel(
      indexCurrentAnswer: 3,
      question:
          "How should you adjust the thermostat on refrigerators and freezers during a power outage?",
      answer: [
        "Turn it off completely",
        "Keep it at the current temperature",
        "Increase it to the warmest possible temperature",
        "Decrease it to the coldest possible temperature",
      ]),
  QuizModel(
      indexCurrentAnswer: 2,
      question:
          "What is the first thing you should do if warned to evacuate due to an imminent volcanic eruption?",
      answer: [
        "Gather essential belongings",
        "Turn off all fans and heating systems",
        "Leave the area immediately",
        "Seek shelter indoors",
      ]),
  QuizModel(
      indexCurrentAnswer: 3,
      question:
          "If a lahar, pyroclastic flow, or lava flow is headed toward you, what should you do?",
      answer: [
        "Stay indoors and close all windows",
        "Drive across the path of danger",
        "Seek shelter outdoors",
        "Leave the area immediately",
      ]),
  QuizModel(
      indexCurrentAnswer: 2,
      question:
          "What precautions should you take if you are indoors during a volcanic eruption?",
      answer: [
        "Open all windows to ventilate the area",
        "Turn on all fans to circulate air",
        "Close all windows, doors, and dampers",
        "Bring pets and livestock outside for safety",
      ]),
  QuizModel(
      indexCurrentAnswer: 1,
      question:
          "How should you protect yourself if caught outdoors during a volcanic eruption?",
      answer: [
        "Seek shelter indoors immediately",
        "Roll into a ball to protect your head during a rockfall",
        "Drive towards the direction of danger",
        "Open windows and doors to ventilate the area",
      ]),
  QuizModel(
      indexCurrentAnswer: 1,
      question:
          "What should you do if your eyes, nose, and throat become irritated from volcanic gases and fumes?",
      answer: [
        "Remain in the area to see if symptoms subside",
        "Move away from the area immediately",
        "Ignore the symptoms as they will disappear on their own",
        "Consult your doctor if symptoms continue",
      ]),
  QuizModel(
      indexCurrentAnswer: 2,
      question: "How can you protect yourself during ashfall?",
      answer: [
        "Wear short-sleeved clothing",
        "Keep windows and doors open for ventilation",
        "Use goggles to protect your eyes",
        "Drive with the car windows down",
      ]),
  QuizModel(
      indexCurrentAnswer: 2,
      question:
          "What is the recommended type of respirator to protect against ashfall?",
      answer: [
        "Nuisance dust mask",
        "Surgical mask",
        "N-95 respirator",
        "Cloth face covering",
      ]),
  QuizModel(
      indexCurrentAnswer: 1,
      question:
          "What should you do if ashfall lasts for more than a few hours?",
      answer: [
        "Remain indoors regardless of duration",
        "Listen to authorities for advice on leaving the area",
        "Open windows to release accumulated ash",
        "Resume normal outdoor activities without precautions",
      ]),
  QuizModel(
      indexCurrentAnswer: 1,
      question:
          "Why should you keep your car engine switched off during heavy ashfall?",
      answer: [
        "To conserve fuel",
        "To avoid stirring up ash that can clog engines",
        "To prevent the spread of ash to other areas",
        "To reduce noise pollution",
      ]),
  QuizModel(
      indexCurrentAnswer: 0,
      question: "What should you avoid doing while driving in heavy ashfall?",
      answer: [
        "Operating the air conditioning system",
        "Driving with windows open",
        "Turning on windshield wipers",
        "Speeding up to reach your destination faster",
      ]),
];
