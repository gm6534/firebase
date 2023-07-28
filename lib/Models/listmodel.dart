class ListModel{
  String? productName;
  String? price;
  String? sold;
  ListModel({required this.productName, required this.price, this.sold});
}
class ChatModel{
  String? chat;
  ChatModel({required this.chat});
}
class TodoModel{
  String? title;
  String? subtitle;
  String? message;
  TodoModel({required this.title, required this.subtitle, required this.message});
}