# CourseShopper

## Description
CourseShopper enables users to browse the UvA (Universiteit van Amsterdam) course catalog by various attributes and view complete course descriptions - it also keeps track of 'saved' courses and recently viewed courses. 

## Features

* Users can search for courses by keywords that appear in catalog numbers, titles, descriptions, and instructors' names
* Users can browse the course by department (taken to mean institute)
* Users can view complete course descriptions for each course, including catalog numbers, titles, institutes, credits, descriptions, staff, programmes, and participant count restrictions
* Users can create their own browseable *Courses I'm Shopping* and *Courses I'm Taking* lists
* Users can browse their 10 most recent *Recently Viewed* courses

## Implementation

* CourseShopper will be implemented using HTML5, JavaScript, and Ruby
* jQuery Mobile will be used for client-side framework
* Ruby on Rails (MVC architecture) will be used for server-side framework
* Users' *Courses I'm Shopping* and *Courses I'm Taking* lists will be stored server-side in an SQLite database
* CourseShopper will be designed for 760x1280 resolution smartphones, with the help of the Ripple Emulator extension for Chrome

#Deployment Instructions

##clone repo
`git clone git@github.com:jonmellman/project2.git jonmellman`

##make sure all gems are there
`cd jonmellman`
`bundle`

## initialize and seed database
`rake db:migrate`
`rake db:seed`

##start server
`rails s`
