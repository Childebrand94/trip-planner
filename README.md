<a name="readme-top"></a>

<br />
<div align="center">
  <a href="https://github.com/Childebrand94/trip-planner">
  <img src="app/assets/images/logo.png" alt="Logo" width="200" height="200" 
  style="border-radius: 50%;">
  </a>
<h3 align="center">PathFindr</h3>
  <p align="center">
    <br />
    <a href="https://github.com/Childebrand94/trip-planner"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/Childebrand94/trip-planner">View Demo</a>
    ·
    <a href="https://github.com/Childebrand94/trip-planner/issues">Report Bug</a>
    ·
    <a href="https://github.com/Childebrand94/trip-planner/issues">Request Feature</a>
  </p>
</div>
<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <br>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#built-with">Built With</a></li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#contributing">Contributing</a></li>
  </ol>
</details>
<br>
<!-- ABOUT THE PROJECT -->

![alt text](app/assets/images/pathfindr_views/video.gif)

## About The Project

PathFindr is an innovative trip planning application designed to make your 
travel planning seamless, interactive, and collaborative. Whether you're 
embarking on a solo adventure or organizing a group trip, 
PathFindr brings convenience and connectivity to your fingertips.


<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- USAGE EXAMPLES -->

## Usage

PathFindr offers an intuitive and collaborative platform that simplifies 
trip planning. Users begin by logging into their account and creating a 
new trip from their dashboard, entering essential details. One of PathFindr’s 
standout features is its role system, allowing the trip's admin to make final 
decisions, ensuring smooth coordination and agreement among participants. 
Friends can be invited to collaborate through the Friend Mailer feature, 
allowing for group planning and real-time itinerary adjustments. Within the 
app, participants can collectively add, and edit, daily plans, places to 
visit, and activities. The inclusion of voting and commenting functionalities 
facilitates democratic decision-making and interactive discussions. Thanks to 
the Bootstrap-powered responsive design, planning is accessible on any device, 
enabling users to engage in planning anytime, anywhere.
<!-- ROADMAP -->

## Roadmap

-   [x] Roles & Permissions
-   [ ] Notifications 
-   [ ] Integrate Google places Api
-   [ ] Real Time Chat
-   [ ] Document upload
-   [ ] Expense Summary
-   [ ] Check List Creation

See the [open issues](https://github.com/Childebrand94/trip-planner/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

-   [![Ruby][Ruby]][Ruby-url]
-   [![Rails 7][Rails 7]][Rails 7-url]
-   [![Bootstrap 5][Bootstrap 5]][Bootstrap 5-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## Getting Started

Welcome to PathFindr! Whether you're planning your next big adventure or just 
exploring the possibilities, getting started with PathFindr is easy and 
straightforward. Follow these steps to begin your journey:

### Prerequisites

Before you begin, ensure you have the following prerequisites installed:

-   [Ruby (3.2.2)](https://www.ruby-lang.org/en/)

### Installation

1. **Clone the Repo**
- Clone the repository to your local machine:
    ```sh
    git clone https://github.com/Childebrand94/trip-planner
    ```
- Navigate to the cloned directory:
    ```sh
    cd trip-planner
    ```
2. **Install Dependencies**
- Insure the correct versions of ruby and rails
- Install the required gems by running:
    ```sh
    bundle install
    ```
- Setup database:
    ```sh
    rails db:create
    rails db:migrate
    rails db:seed
    ```
5. **Running PathFindr**
- Start the Rails Server
    ```sh
    rails server
    ```
8. Go to http://localhost:3000/

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Feedback and Contributions

We value your feedback and encourage you to report any issues, suggest features, or contribute to the development of this project. Together, we can make this Path Findr the ultimate resource for mastering the game.

Please note that this road map is subject to change, and the timeline for each feature may vary. We appreciate your support and look forward to improving and expanding our Path Findr based on your needs and suggestions.

See the [open issues](https://github.com/Childebrand94/trip-planner/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->

[Ruby]: https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white
[Ruby-url]: https://www.ruby-lang.org/
[Rails 7]: https://img.shields.io/badge/Rails%207-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white
[Rails 7-url]: https://rubyonrails.org/
[Bootstrap 5]: https://img.shields.io/badge/Bootstrap%205-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap 5-url]: https://getbootstrap.com/

