# REQUIREMENTS

As a pet project we suggest to create analog of Twitter.

Most of listed stories covers around 70% of development processes in Galvanize. 

## There are following user stories:
- [x] User sign in/sign out/log in into the application. During sign up user must provide at least his name and email
- [x] User should be able to edit his profile
- User can create Articles (same as Tweet in Twitter)
- User should be able to see list of all Articles (including other user’s Articles)
- Login into the application should be required to see Articles
- Every user should be able to comment any article
- User should be able to delete their article
- User should be able to update their article

## Tools and tips which you need to use:
- GitHub - heartcombo/devise: Flexible authentication solution for Rails with Warden. as an authentication solution
- GitHub - collectiveidea/interactor: Interactor provides a common interface for performing complex user interactions. gem & pattern. Since we are using Interactor pattern widely in our projects, it will be great to try it in your pet project (even if its not necessary)
- Your project should use Rails > 6.0 (ideally 6.1 - our current Rails version in Diligent services) and Ruby 2.7
- Your project should be deployed to Cloud Application Platform | Heroku and using public github repository
- Each user story should be done in separate pull request in github. Each pull request should be reviewed by anyone from our Ruby team.
- Nice-to-have feature is automatic deploy with CI/CD tools. We are using Hosted CI/CD for teams that don't like bottlenecks - Semaphore
- Your code should be covered at least with unit tests. For practice you can try to write acceptance spec using GitHub - teamcapybara/capybara: Acceptance test framework for web applications
- After everything will be done (or if listed things too easy for you ) i suggest you to bring your Articles API using JSON:API — A specification for building APIs in JSON and use your own API in separate React application in future FE learnings.