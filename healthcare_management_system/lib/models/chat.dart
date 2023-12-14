class Chat {
  final String name, lastMessage, image, time;
  final bool isActive;

  Chat({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
  });
}

List chatsData = [
  Chat(
    name: "Hana Gamage",
    lastMessage: "Hope you are doing well...",
    image: "Assets/doctor_4.jpg",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Kasun Perera",
    lastMessage: "Hello Doctor! I need...",
    image: "Assets/doctor_2.jpg",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Nayana Kumari",
    lastMessage: "Can you prescribe me?...",
    image: "Assets/doctor_9.jpg",
    time: "1 day ago",
    isActive: true,
  ),
];
