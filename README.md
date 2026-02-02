# Polaris
## Focus-First Screen Time Companion

### Overview
Polaris is a flutter-based productivity application that utilises a task–reward mechanism to reduce screen time spent on distracting apps and redirect it toward real productive work.

##### Note: The project is currently only implemented on Instagram. Also, the reward time increment is hardcoded to 10 minutes.

### Features
- Task-reward mechanism: Rewards screen time on completing meaningful tasks.
- Dynamic reward time: Increment and decrement in reward time based on Instagram usage.
- Hard app blocking: Unlike most digital wellbeing apps, it does not ask the user to continue for a few more minutes. Rather, it directly blocks Instagram.
- Overlay on screen: Uses screen overlay to block Instagram and prevent further usage.
- Task Manager: The to-do feature allows users to organise their daily schedules.
- Secure authentication: Secure user login and signup using JWT token.

### Tech Stack
| Component | Technology | Version |
| ------------- | ------------- | ------------- | 
| Frontend | Flutter | 3.38.5 |
| Backend | Express.Js | 5.2.1 |
| Database | MongoDB | 8.2.3 |

### Usage
- It consists of a to-do list where the user enters all the important tasks to be done on that day.
- On completing the task, the user will check off the task from the list. This will award the user by incrementing the reward time.
- Reward time is a screen timer up to which the user can use social media apps.
- On using such apps, the reward time will be decremented by the amount of time spent on them.
- After finishing all the reward time, the user is forced to go back to work by blocking access to these social media apps, thus creating a task-reward loop.

![Polaris (1)](https://github.com/user-attachments/assets/11330366-0a0e-4300-9085-3e6340d32456)

### User Interface
| Description | Screenshot |
| ------------- | ------------- |
| Login | <img src="https://github.com/user-attachments/assets/ef86ff54-187b-441f-a4f7-d35af83a8bc3" width="200"> |
| Signup | <img src="https://github.com/user-attachments/assets/7d7f5e7a-41a6-4617-b954-87933b1b36c8" width="200"> |
| Home Page | <img src="https://github.com/user-attachments/assets/6919c149-8f37-4d9b-80c8-700dd2c7600f" width="200"> |
| New Task Dialog Box | <img src="https://github.com/user-attachments/assets/602129c6-8739-4caf-ace5-c9adb3288cf5" width="200"> |
