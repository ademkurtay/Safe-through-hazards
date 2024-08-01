class ChecklistModel {
  final String name;
  final String? desc;

  String get keyValue =>
      name.replaceAll(' ', '').replaceAll('\n', '').toLowerCase();

  ChecklistModel({required this.name, this.desc});
}

List<ChecklistModel> kitBasicCheckList = [
  ChecklistModel(
      name: 'Water',
      desc:
          "One gallon per person per day for several days, for drinking and sanitation"),
  ChecklistModel(
      name: 'Food', desc: "Several-day supply of non-perishable food"),
  ChecklistModel(
      name: 'Radio',
      desc:
          'Battery-powered or hand crank radio and a NOAA Weather Radio with tone alert'),
  ChecklistModel(name: 'Flashlight'),
  ChecklistModel(name: 'First Aid Kit'),
  ChecklistModel(name: 'Extra Batteries'),
  ChecklistModel(name: "Whistle"),
  ChecklistModel(name: "To signal for help"),
  ChecklistModel(name: "Dust Mask", desc: "To help filter contaminated air"),
  ChecklistModel(
      name: "Plastic sheeting and duct tape", desc: "To shelter in place"),
  ChecklistModel(
      name: "Moist towelettes, garbage bags and plastic ties",
      desc: "For personal sanitation"),
  ChecklistModel(name: "Wrench or Pliers", desc: "To turn off utilities"),
  ChecklistModel(name: 'Manual can opener', desc: "For food"),
  ChecklistModel(name: "Local Maps"),
  ChecklistModel(name: "Cell phone with chargers and a backup battery"),
];

List<ChecklistModel> kitAdditionalCheckList = [
  ChecklistModel(
      name:
          "Soap, hand sanitizer and disinfecting wipes to disinfect surfaces"),
  ChecklistModel(
      name:
          "Prescription medications, if you have them. Organize and protect your prescriptions, over-the-counter drugs, and vitamins to prepare for an emergency"),
  ChecklistModel(
      name:
          "Non-prescription medications such as pain relievers, anti-diarrhea medication, antacids or laxatives"),
  ChecklistModel(name: "Prescription eyeglasses and contact lens solution"),
  ChecklistModel(
      name: 'Infant formula, bottles, diapers, wipes\nand diaper rash cream'),
  ChecklistModel(name: "Pet food and extra water for your pet"),
  ChecklistModel(name: "Cash or traveler's checks"),
  ChecklistModel(
      name:
          "Important family documents such as copies of insurance policies, identification and bank account records saved electronically or in a waterproof, portable container"),
];
