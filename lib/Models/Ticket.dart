class Ticket {
  String firstQuestion;
  String secondQuestion;
  String thirdQuestion;

  Ticket({this.firstQuestion, this.secondQuestion, this.thirdQuestion});

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      firstQuestion: json["first"]["text"],
      secondQuestion: json["second"]["text"],
      thirdQuestion: json["third"]["text"],
    );
  }
}
