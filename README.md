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
<ol>
    <li>Database creation and population using schema </li>
    <li>User sign up and sign in</li>
    <li>API integration. API used to get paragraphs: <a href="http://metaphorpsum.com/">Metaphorpsum</a></li>
    <li>Speed test - CRUD </li>
</ol> 

### 4- Frontend Development
The front end development involved the following steps:
<ol>
    <li>HTML Structure for all pages</li>
    <li>In-browser calculation of typing speed using JavaScript and sending a request to backend from JavaScript</li>
    <li>CSS</li>
</ol> 

## Technologies used
<ul>
    <li>Sinatra</li>
    <li>Ruby</li>
    <li>Postgresql</li>
    <li>HTML</li>
    <li>CSS</li>
    <li>JavaScript</li>
    <li>GitHub</li>
    <li>Heroku</li>
</ul>

## Lessons Learnt
<ul>
    <li>Ruby practice</li>
    <li>CRUD app best practices</li>
    <li>Heroku hosting</li>
</ul>

## Future Features
<ul>
    <li>Add categories to paragraphs, so users can type paragraphs from topics of their choice</li>
    <li>Add live competition with othre players</li>
    <li>Add game element to typing</li>
</ul> 

