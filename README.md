# flutter_fetch_api_with_dio

---
![fetch-api-with-dio](https://user-images.githubusercontent.com/48079501/182289177-641c20c1-8596-41df-82f0-a46a18984a08.jpg)

Flutter fetch API with Dio Package
Dio is a powerful Http client, which supports Interceptors,
Global configuration,
FormData,
Request Cancellation,
File downloading,
Timeout etc.
Check Out Example to Fetch API with Dio Package
Pagination is ignored: I will cover it in next article
API:https://reqres.in/api/users?page
![api](https://user-images.githubusercontent.com/48079501/182289276-7a9db086-b5d5-4e76-b608-65e172eddead.png)


#1. Add Dio package
Run this command:
With Dart:
$ dart pub add dio
With Flutter:
$ flutter pub add dio
This will add a line like this to your package's pubspec.yaml (and run an implicit dart pub get):
dependencies:
  dio: ^4.0.6

---

#2.Create an Model class
First, create an UserModel class that contains the data from the network request. It includes a factory constructor that creates an UserModel from JSON.

![model class](https://user-images.githubusercontent.com/48079501/182288258-bf8da6ee-eebd-4df9-9c8f-d38f911062c1.png)

---

#3.Create Service
![dioclient](https://user-images.githubusercontent.com/48079501/182288329-8b12ac22-8083-4013-997b-9ea2b895aab1.png)
Fetching data from the internet takes some time so make getUser() an asynchronous function.
-The dio.get() function requests JSON data from the server. The JSON response data is stored in the response variable.
Create instance of Dio with an optional BaseOptions object:
![dio2](https://user-images.githubusercontent.com/48079501/182288459-2e8ae176-06ce-4982-8263-cfcd8da645d8.png)

Here within BaseOtiopns()
We can define 
-baseUrl
-connectTimeout
- headers etc
And API path is defined in get(path)
We can observe that we don't need to Decode unlike Http package
HTTP with decode-We store response.data in variable and convert it into a UserModel using the fromMap() factory method otherwise we throwing Exception.
![dio refactor](https://user-images.githubusercontent.com/48079501/182288613-4b5d34a0-5d5f-43b6-96d1-5a4384671d8d.png)

Refactor:
It's better to create separate class for:
-Handle Response-ApiClient
-Convert response to Model-Repository
This helps to easily track error and reuse.
![refactor1](https://user-images.githubusercontent.com/48079501/182288766-ec9bd4ce-d5fe-4577-a3cc-1a385bf34ba2.png)
![refactor2](https://user-images.githubusercontent.com/48079501/182288810-f42dae08-8592-4cd1-b826-a06673f433e1.png)

---
#4.UI
![home](https://user-images.githubusercontent.com/48079501/182288857-1facbe1c-b967-4888-9957-f83654cd4f30.png)
![homeui](https://user-images.githubusercontent.com/48079501/182288948-4ba18f1f-2341-472c-a276-e0e284f4f53f.jpeg)

---

#Enhance loading with Shimmer Effect:
-Replace CircularProcessIndicator with Shimmer.fromColors()
![shimmer](https://user-images.githubusercontent.com/48079501/182288990-be43432a-205e-491d-bddf-b0df1210f5ae.png)
![shimmer](https://user-images.githubusercontent.com/48079501/182289010-aae1f434-3071-4ffc-9ff4-876c7b6123f0.jpeg)

I hope this exposition hopefully demystified the use of Dio(Get method) to fetch API.
Thanks for reading and see you in the next one.

