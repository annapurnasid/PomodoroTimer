# Pomodoro Timer

This Flutter app is based on Pomodoro Technique.

## About Pomodoro
Pomodoro technique is time management technique to increase work efficiency. 
It works by the principle of working for a certain period of time and then taking rest for few minutes.

More about it: https://en.wikipedia.org/wiki/Pomodoro_Technique

## How the app works
The work session starts on hitting the start and continues for 25 minutes.
There will be a notification after the work time ends. This denotes you can now take rest.

The rest time starts on clicking the button. 
After the rest period, there will be a notification alert to start the work.

Lets call this one cycle - work+rest
After 2 such cycles, there will be a long rest.

and this continues.

## Few changes in app for development:
change the timings for work and rest, in pomodoro_timer.dart file.

const int kWorkDuration = 5; // 5 sec <br>
const int kRestDuration = 2; // 2 sec <br>
const int kLongRestDuration = 3; // 3 sec <br>
const int kLongRestInterval = 2; // 2 short rest and then 1 long rest <br>

This project is a starting point for a Flutter application.

## Features implemented in the app
- Well organised widget function
- Sample to organise the style features
- Add local notification, with sound alert
- Inbuilt Timer 

## Further improvements

- Take user input to set the work and rest duration
- Take user input to define the work and rest cycle
- Take user input for long rest duration

## Get Started with Flutter

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

[Tutorial reference](https://www.raywenderlich.com/34019063-creating-local-notifications-in-flutter) for this app.

