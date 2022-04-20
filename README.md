# Tea Subscription Service (TSS)
TSS is a rails API designed for a frontend client to consume. This API allows the front end client to hit 3 end points achieving the following goals; 
1. Create a subscription for a customer and their tea of choice 
2. Cancel a subscription 
3. Retrieve a users subscriptions 

## Technologies
![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)
![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)
![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)


## DB SCHEMA
![Screen Shot 2022-04-20 at 9 56 39 AM](https://user-images.githubusercontent.com/83717116/164272870-2dbcfe5f-4e91-46ce-bf3c-4eea813e960b.png)

  
## Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rake db:{drop,create,migrate}` 

## INSTRUCTIONS FOR INTERVIEWER - Test endpoints using Postman

* start server in terminal
``` 
$ rails s -p 3000
``` 
* Use below postman collection to get endpoints

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/join-team?invite_code=9a222d71cd3760a6186e347d20b935c5&target_code=22ffa523b88e1adc714a60ea97b593e0)


## Running the tests
Run `bundle exec rspec` to run the test suite

## <ins>Contributors</ins>
<p>
  <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" />
</p>

- [Darren Kulback](https://www.linkedin.com/in/darren-kulback-9b2394189/)

<p>
  <img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" />
</p>

- [Darren Kulback](https://github.com/dkulback)
## IDE
![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)

