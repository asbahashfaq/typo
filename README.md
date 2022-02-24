# TYPO 
## Project 2 - SEI - General Assembly
A full-stack database backed Sinatra application, where users can test their typing speed.

## Demonstration
<a href="https://gentle-river-53271.herokuapp.com/">Link to website</a>

<img src="/demo/demo.gif" width='500px' style="text-align:center;">

## My plan / approach
The planning process involved the following steps: 

### 1- Wireframing 
The Typo app has three different pages, the home page contains the main functionality of the app, where users can test their typing speed. Other pages include All Paragraphs, Login page, Sign up page, and Test History for each user.
<img src="/demo/wireframes.png" width='500px' style="text-align:center;">

### 2- ERD diagram
The database schema consists of 5 tables, with one to one, one to many and many to many relationships between them. The schema was thoroughly planned to make the development process as smooth as possible. The ERD diagram shows the relationship between all entities in the database. 
<img src="/demo/erd_diagram.jpeg" width='500px' style="text-align:center;">

### 3- Backend Development
The backend development invovled the following steps: 
1 - Database creation and population using schema 
2 - User sign up and sign in
3 - API integration. API used to get paragraphs: <a href="http://metaphorpsum.com/">Metaphorpsum</a>
4 - Speed test - CRUD 

### 4- Frontend Development
The front end development involved the following steps:
1 - HTML Structure for all pages
2 - In-browser calculation of typing speed using JavaScript and sending a request to backend from JavaScript
3 - CSS

## Technologies used
- Sinatra
- Ruby 
- Postgresql
- HTML
- CSS
- JavaScript
- GitHub
- Heroku

## Lessons Learnt
- Ruby practice
- CRUD app best practices
- Heroku hosting

## Future Features
- Add categories to paragraphs, so users can type paragraphs from topics of their choice
- Add live competition with othre players
- Add game element to typing


