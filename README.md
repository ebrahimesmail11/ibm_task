<h1 align="center" id="title">ibm_task</h1>

<p align="center"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/IBM_logo.svg/800px-IBM_logo.svg.png" alt="project-image"></p>

<p id="description">An application that displays data and logs from a fake API as an exercise in provider http and clean architecture.</p>

<h2>Project Screenshots:</h2>
<h2>
  <img src="https://i.postimg.cc/mk8sNCwL/Screenshot-1726934535.png" alt="project-screenshot" width="170" height="400/">

<img src="https://i.postimg.cc/SKCb1wrt/Screenshot-1726934541.png" alt="project-screenshot" width="170" height="400/">

<img src="https://i.postimg.cc/8PY8p1X0/Screenshot-1726934579.png" alt="project-screenshot" width="170" height="400/">

<img src="https://i.postimg.cc/2SdxHGW7/Screenshot-1726934630.png" alt="project-screenshot" width="170" height="400/">

<img src="https://i.postimg.cc/6TJdc45P/Screenshot-1726934745.png" alt="project-screenshot" width="170" height="400/">

<img src="https://i.postimg.cc/Y0gXtHvJ/Screenshot-1726933744.png" alt="project-screenshot" width="170" height="400/">

<img src="https://i.postimg.cc/NfcDRZ9j/Screenshot-1726934662.png" alt="project-screenshot" width="170" height="400/">

<img src="https://i.postimg.cc/DwfcMscV/Screenshot-1726934151.png" alt="project-screenshot" width="170" height="400/">

<img src="https://i.postimg.cc/pTvrsQDz/erorr-network.jpg" alt="project-screenshot" width="170" height="400/">
</h2>

  
<h2>💻 Built with</h2>

Technologies used in the project:

*   animate\_do
*   flutter\_secure\_storage
*   flutter\_screenutil
*   http
*   provider
*   dartz
*   motion\_toast
*   shared\_preferences
*   connectivity\_plus
*   cached\_network\_image

<h2>💖Like my work?</h2>
<h2>
  <img src="https://img.icons8.com/?size=48&amp;id=qyRpAggnV0zH&amp;format=png" alt="project-screenshot" width="25" height="25/">
  ebrahim.es11mail11@gmail.com
</h2>
<h2>
  <img src="https://img.icons8.com/?size=80&amp;id=LwCcDAb8qdY1&amp;format=png" alt="project-screenshot" width="25" height="25/">
  +201061769047
</h2>
<h2>
  System Design
</h2>
## Project Structure

The following structure outlines the key folders and files within the project:

```bash
lib/
│
├── src/
│   ├── common/
│   │   ├── base/
│   │   ├── network/
│   │   │   ├── models/
│   │   │   │   ├── home/
│   │   │   │   │   └── person.dart
│   │   │   │   ├── login/
│   │   │   │   │   ├── login_failure.dart
│   │   │   │   │   └── login_success.dart
│   │   │   ├── service/
│   │   │       ├── api_response.dart
│   │   │       ├── failure.dart
│   │   │       ├── network_service.dart
│   │   │       └── response_status.dart
│   │   ├── routing/
│   │   ├── storage/
│   │   └── widgets/
│   ├── features/
│   │   ├── data/
│   │   │   ├── remote/
│   │   │   │   ├── login/
│   │   │   │   │   └── login_remote.dart
│   │   │   ├── repo/
│   │   │   │   ├── home/
│   │   │   │   │   └── home_repo.dart
│   │   │   │   └── login/
│   │   │   │       └── login_repo.dart
│   │   ├── domain/
│   │   │   ├── usecases/
│   │   │       └── login_usecases.dart
│   │   ├── presentation/
│   │   │   ├── providers/
│   │   │   │   └── login/
│   │   │   │       └── auth_provider_service.dart
│   │   │   ├── view/
│   │   │   │   ├── home/
│   │   │   │   └── login/
│   │   ├── view_models/
│   │       ├── home_view_model.dart
│   │       └── login_view_model.dart
│   ├── utils/
│       ├── colors/
│       ├── theme/
│       ├── connectivity_controller.dart
│       ├── no_network_screen.dart
├── app.dart
└── main.dart
