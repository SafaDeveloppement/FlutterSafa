class ChatModel {
  int? id;
  String? name;
  String? icon;
  bool? isGroup;
  String? time;
  String? currentMessage;
  bool isSelected; // Propriété isSelected
  final String status;

  ChatModel({
    this.id,
    this.name,
    this.icon,
    this.isGroup,
    this.time,
    this.currentMessage,
    bool? isSelected, // Paramètre optionnel pour isSelected
    this.status = '',
  }) : isSelected = isSelected ?? false;

  //get status => null; // Initialisation par défaut de isSelected à false si null
}
