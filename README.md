# Ruby-Capstone-Project

Here in this project we have implemented the following requirements:

- Create Item class in a `item.rb` file.

- All Item class properties visible in the diagram should be defined and set up in the constructor method. Exception: properties for the 1-to-many relationships should NOT be set in the constructor method. Instead, they should have a custom setter method created.

- Add all methods visible in the diagram.

- Implement methods:
  - can_be_archived?() in the Item class
    - should return true if published_date is older than 10 years
    - otherwise, it should return false
  - move_to_archive() in the Item class
    - should reuse can_be_archived?() method
    - should change the archived property to true if the result of the can_be_archived?() method is true
    - should do nothing if the result of the can_be_archived?() method is false

- Create a main.rb file that will serve as your console app entry-point.
- Implement startup actions:
  - Present the user with a list of options to perform.
  - Let users choose an option.
  - If needed, ask for parameters for the option.
  - Have a way to quit the app.

## Technologies Used

* Language (Ruby)

## Getting Started

To get a local copy up and running follow these simple example steps.

## Prerequisites
* A text editor(preferably Visual Studio Code)

## Installation
* Ruby
* JSON gem
* Rspec gem

## Using it Locally

* Clone the repo using the command below

```
https://github.com/oluyaratosin123/Ruby-Capstone-Project.git

```

* Navigate to the directory in which you cloned the project and use the command below

```
cd Ruby-Capstone-Project
```

* Start the program using the command below
```
ruby main.rb
```

## Testing

* Clone the repo using the command below

```
https://github.com/oluyaratosin123/Ruby-Capstone-Project.git
```

```
cd Ruby-Capstone-Project
```

* Start rspec using the command below
```
rspec spec ./spec
```

## 👤 Author 
Fikerte-T :student: 
* Github: [@Fikerte-T](https://github.com/Fikerte-T)
* Twitter: []()
* LinkedIn: []()

Hamza Tarar :student: 
* Github: [@Hamza Tarar](https://github.com/Lockless404)
* Twitter: []()
* LinkedIn: []()

Edward Yara :student: 
- GitHub: [@oluyaratosin123](https://github.com/oluyaratosin123)
- Twitter: [@TOluyara](https://twitter.com/TOluyara)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/edward-oluyara/)

## Contributing :handshake:
Contributions, issues, and feature requests are welcome!

## Show your support
Give a 	:star: if you like this project.

## Acknowledgments
* Hat tip to anyone whose code was used
* Inspiration
* etc

## License :memo:
This project is [MIT](https://github.com/microverseinc/readme-template/blob/master/MIT.md) licensed
