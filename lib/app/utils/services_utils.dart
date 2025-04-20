class ServicesUtils {
  final String name;
  final String icon;
  final List<String> tool;
  final String description;

  ServicesUtils({required this.name, required this.icon, required this.description, required this.tool});
}

List<ServicesUtils> servicesUtils = [
  ServicesUtils(
    name: 'Flutter',
    icon: 'assets/icons/flutterio-icon.svg',
    description: "Are you interested in the great Mobile app? Let's make it a reality.",
    tool: [
      'Flutter is an open-source UI toolkit developed by Google for building natively compiled applications with expressive and fast user interfaces across multiple platforms.'
    ],
  ),
  ServicesUtils(
    name: 'Dart',
    icon: 'assets/icons/dart-100.svg',
    description: "I'm creating elegant designs suited to your needs following core design theory. ",
    tool: [
      'Dart is a programming language developed by Google, known for its versatility and usage in building cross-platform mobile, web, and desktop applications with a strong focus on performance and productivity.',
    ],
  ),
  ServicesUtils(
    name: 'Firebase',
    icon: 'assets/icons/firebase-icon.svg',
    description: "",
    tool: [
      'Firebase is a comprehensive platform for building web and mobile applications that offers features such as real-time database, authentication, hosting, and cloud functions.'
    ],
  ),
  ServicesUtils(
    name: 'State Management',
    icon: 'assets/icons/state_managment.svg',
    description: "",
    tool: [
      'State management is the technique used to manage and share data across multiple parts of a Flutter app efficiently. It ensures UI updates automatically when the data changes. Example: Provider, Riverpod, BLoC.',
    ],
  ),
  ServicesUtils(
    name: 'Api Integration',
    icon: 'assets/icons/api.svg',
    description: "",
    tool: [
      'API stands for Application Programming Interface and it serves as a set of rules and protocols that allows different software applications to communicate and interact with each other, enabling the exchange of data and functionality.',
    ],
  ),
  ServicesUtils(
    name: 'Socket IO',
    icon: 'assets/icons/socket-io-icon-original.svg',
    description: "",
    tool: [
      "Flutter's Socket.IO enables real-time, bidirectional communication between Flutter apps and servers. Using Dart, it establishes a persistent connection, ideal for implementing features like chat and live updates in mobile applications."
    ],
  ),
  ServicesUtils(
    name: 'Zego Cloud',
    icon: 'assets/icons/color_cropped-removebg.svg',
    description: "",
    tool: [
      "Zego Cloud offers cloud services for real-time video streaming, enabling developers to build interactive and scalable video communication applications effortlessly."
    ],
  ),
  ServicesUtils(
    name: 'Git',
    icon: 'assets/icons/git.svg',
    description: "",
    tool: [
      'Git is a version control system for tracking code changes, while GitHub is a platform for hosting and sharing that code. They help in collaboration, history tracking, and open-source contributions. Example: Commit code changes, collaborate on projects.'
    ],
  ),
  ServicesUtils(
    name: 'Admob',
    icon: 'assets/icons/google_ad_mob.svg',
    description: "",
    tool: [
      'AdMob is a mobile advertising platform developed by Google that allows app developers to monetize their apps by displaying targeted ads to users.',
    ],
  ),
];
