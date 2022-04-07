# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version - 2.7.5
* Rails version - 7.0.2.3
* Node version - 16.13.1
* Yarn version - 1.22.17

You can use RVM and NVM to manage ruby and node versions respectively

* After confirming node installation make sure to install Yarn
```
brew install yarn (for Mac)
npm install yarn (for others using npm)
```

After successfully installing Yarn run below commands just to be sure
```
yarn --version
yarn install
```

* Database creation

Ensure you have PostgreSQL version 14.2. 

1. Open config/database.yml and change database username and password with your values.
2. Run below commands to setup database
```
rails db:create
rails db:migrate
```

* Running the server
```
rails s
```

With this much you should be able to run the project on localhost:3000. if you are using the app for the first time please click Join Us button on the first screen to signup and then Login with your created credentials.

Below details are relevant only if you make changes to the project.

* System dependencies
This project was created using the latest jsbundler gem and uses Turbo and Stimulus by Hotwire for enhanced performance.

This Project uses Tailwinds CSS 3 with the updated gem. 
If you make any css changes run below command to see the changes take effect
```
rails tailwindcss:build
```

* Services (job queues, cache servers, search engines, etc.)

