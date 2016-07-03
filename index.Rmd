---
title       : Intro to the awesome game of football
subtitle    : This is how engineers play football
author      : Akash Chauhan
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---


## Slide 2

This is an introduction slide to the week 4 assignment of the
developing data tools course of coursera.

The assignment is to develop a shiny app. The app we will talk about is a guessing
game set in the middle of a football field.

The user is asked to provide certain inputs using the shiny widgets and based on the 
input the app calculates the result of the game.

So, let's look into the details of the game.

---

## Slide 3

The game statement is as below:

You are standing at mid field with the ball. The goalkeeper is halfway between you and the goalpost. Seeing you with the ball the goalkeeper starts running towards the goalpost at 18 km/h speed.

You have to guess now the speed and angle at which you need to hit the football so that the football reaches the goalpost before the goalkeeper in one go without bouncing. Keep in mind that the football must cross the goalkeeper above the height of the goalkeeper (6ft. 2in.) If it bouces before the goalkeeper or hits him it will be deflected by him.

Depending on your speed and angle input we will tell you whether you scored a goal or the goalkeeper deflected the ball!

We will ignore air resistance and other useless variables. This is a simple projectile motion situation.

Note: The football field is usually 120 yards long (~110 m)

---

## Slide 4

The user is asked to input the speed of the ball using a slider bar and the angle of the ball from the ground using a numeric input widget.


Based on the two inputs the app calculates whether the ball hit with the mentioned
speed and angle will be a goal or not based on the criterias mentioned in the 
problem statement.


Condition 1 : if the goalkeeper reaches the goalpost before the ball - it will never be a goal as the ball is too slow to reach there.


Condition 2 : if the ball is fast enough to reach the goalpost before the goalkeeper, the app checks if it goes above his head, bounces before him or hits him. if it bounces before him or hits him then he deflects it - no goal!


Condition 3 : if the ball goes above his head then its a goal!

---

## Slide 5

The code used to check these 3 conditions are shown below:

Condition 1 :
```
if((input$slider1*1000/3600)*cos(input$num*pi/180) < 10){
          "You are too slow! The goalkeeper has reached the goalpost before
                     the ball and has stopped the goal!!"}
```

Condition 2 :
```
height <- function(v, theta)
  (v*sin(theta)*27.5/((v*cos(theta))-5)) -(9.8*((27.5/((v*cos(theta))-5))^2)*0.5) 
  
if (height(input$slider1*1000/3600, input$num*pi/180) <= 1.8796){
          "The ball has been deflected by the goalkeeper. NO GOAL!"}
```

Condition 3 : 

if the above two conditions are not met then it's a goal!







