<!--
*** Thanks for checking out this README Template. If you have a suggestion that would
*** make this better, please fork the repo and create a pull request or simply open
*** an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
-->

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]


<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/rammazzoti2000/ror-capstone-lifestyle">
    <img src="app/assets/images/microverse.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">RoR / Capstone --> [LifeOpedia!]</h3>

  <p align="center">
    This project is the Capstone of the Microverse curriculum at the end of the Ruby on Rails module!
    <br />
    <a href="https://github.com/rammazzoti2000/ror-capstone-lifestyle"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/rammazzoti2000/ror-capstone-lifestyle/issues">Report Bug</a>
    ·
    <a href="https://github.com/rammazzoti2000/ror-capstone-lifestyle/issues">Request Feature</a>
  </p>
</p>

<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
* [Installation](#installation)
* [Database Structure](#database-structure)
* [Live Demo and Presentation](#live-demo-and-presentation)
* [Contributors](#contributors)
* [Acknowledgements](#acknowledgements)
* [License](#license)

<!-- ABOUT THE PROJECT -->
## About The Project

This is the Capstone project that signs the completion of the RubyOnRails module in Microverse Curriculum.
It is a webapp where users can register using name, username, password and can signin with their username only.
As a logged in user, it is possible to create articles, edit profile, comment, vote and bookmark an article for future reads.
The app can be used also on read only mode, with restricted access to its features.

![screenshot-1](app/assets/images/screenshot-1.png)

<!-- INSTALLATION -->
## Installation

To have this app on your pc, you need to:
* have Ruby & Ruby on Rails installed in your computer
* [download](https://github.com/rammazzoti2000/ror-capstone-lifestyle/archive/development.zip) or clone this repo:
  - Clone with SSH:
  ```
    git@github.com:rammazzoti2000/ror-capstone-lifestyle.git
  ```
  - Clone with HTTPS
  ```
    https://github.com/rammazzoti2000/ror-capstone-lifestyle.git
  ```
* and open the terminal inside the repo and run the bundler
  - ```$ bundler install --without production```
* then, run rails db:migrate && rails db:seed. This creates the database with the corresponding tables, columns and associations and will populate the database with mockup content
  - ```$ rails db:migrate```
  - ```$ rails db:seed```
* and finally, you can test it in the console by running and singin with a user already defined --> :point_right: ```maxinova``` :point_left:
  - ```$ rails server``` and using ```localhost:3000``` into your browser address bar to start using it
  - for any technical problems running ```rails db:migrate:reset && rails db:seed``` should solve it
  ## Rspec testing

* Run the command and see the output: 
```$ bundle exec rspec```
![Rspec](app/assets/images/rspec.png)

## Database Structure
 * Database schema used for this project reflects the following structure:
 ![erd](app/assets/images/erd.png)

### Built With
This project was built using these technologies.
* Ruby & Ruby on Rails
* Rspec / Capybara
* Bootstrap
* HTML / CSS / SCSS
* SQLite
* Rubocop
* GithubActions :muscle:
* Atom

<!-- Live Demo -->
## Live Demo and Presentation
* Live Demo Link: [ror-capstone-lifeopedia](https://ror-capstone-lifeopedia.herokuapp.com/) :point_left:
##
* Project Presentation: [Loom](https://www.loom.com/share/291f99a17d0542e09a48fd3f7c0e83cc) :point_left:

<!-- CONTACT -->
## Contributors

👤 **Alexandru Bangau**

- LinkedIn: [Alexandru Bangau](https://www.linkedin.com/in/alexandru-bangau/)
- GitHub: [@rammazzoti2000](https://github.com/rammazzoti2000)
- E-mail: bangau.alexandru@gmail.com


<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [Microverse](https://www.microverse.org/)
* [Ruby Documentation](https://www.ruby-lang.org/en/documentation/)
* [Ruby on Rails](https://rubyonrails.org/)
* [Bootstrap](https://getbootstrap.com/)
* [Behance](https://www.behance.net/)
* [Heroku](https://www.heroku.com/)

## Credits
* Nelson Sakwa - [liFEstIye](https://www.behance.net/gallery/14554909/liFEsTlye-Mobile-version)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/rammazzoti2000/ror-capstone-lifestyle.svg?style=flat-square
[contributors-url]: https://github.com/rammazzoti2000/ror-capstone-lifestyle/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/rammazzoti2000/ror-capstone-lifestyle.svg?style=flat-square
[forks-url]: https://github.com/rammazzoti2000/ror-capstone-lifestyle/network/members
[stars-shield]: https://img.shields.io/github/stars/rammazzoti2000/ror-capstone-lifestyle.svg?style=flat-square
[stars-url]: https://github.com/rammazzoti2000/ror-capstone-lifestyle/stargazers
[issues-shield]: https://img.shields.io/github/issues/rammazzoti2000/ror-capstone-lifestyle.svg?style=flat-square
[issues-url]: https://github.com/rammazzoti2000/ror-capstone-lifestyle/issues

## 📝 License

This project is [MIT](https://opensource.org/licenses/MIT) licensed.
