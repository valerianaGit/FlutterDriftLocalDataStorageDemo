# demo_drift_package

Basic note taking app Flutter project, using Drift package for local data storage.

## UI and use of Drift package 

UI in this project contains:
- textfield -> to write new notes
- database button -> button to check database on the device/project
- listView -> where user can see the todo items that have been added
- circular floating action button -> used to save items written in the textfield

User will be able to:
- create new todo items 
- read items from a list view 
- update these items to a listView
- delete these items from the list view

## Getting Started

This project is a demo. This project is meant to accompany the Flutter Chicago talk on April 24th 2023 on local data storage using the Drift package.

## Steps covered in talk 
1 -     flutter create project 
2 -     setup project basics
3 -     run through of demo mvp and app design
4 -     setup of boiler plate code for app
4.1.    Screenshot of code needed to write on textfield 
        and update table view without saving data 
5 -     Drift setup and use   

## Steps to setup local data storage using Drift
1 -     Choose state management system - riverpod
2 -     Setup drift_db file
3 -     Generate drift .g file 
4 -     Use local data storage 
5 -     Check database in your project 

## Packages used in this project 



## Additonal Resources for using the Drift package 

Unit Testing Drift databases 
https://drift.simonbinder.eu/docs/testing/

Testing Riverpod 
https://riverpod.dev/docs/cookbooks/testing

