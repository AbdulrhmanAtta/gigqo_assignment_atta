# gigqo_assignment

That's standard new Flutter project containing Flutter Counter Demo application.

## Goals of assingment

You need to clone the repo and create your own branch where you will modify the app.

In your branch you need to handle mock-up data from Gigqo beta-api backend server.

API main endpoint URL: https://beta-api.gigqo.com/api

API contains basic REST endpoints implementing CRUD operations:

| Metod | Route | Desciption
|---|---|---|
| GET    | /mockup/track      | List all tracks 
| GET    | /mockup/track/{id} | Get details for specific track
| POST   | /mockup/track      | Create track
| PUT    | /mockup/track      | Update track
| DELETE | /mockup/track      | Delete Track

For the moment json response for all endpoints have folowing common structure:

```
{
    "status": "",   // "success" or "error"
    "message": "",  // error specific message
    "data": {}      // payload of the request
}
```

Mockup responses contains static data, but may return errors randomly!

For fetching and storing data you can use simple Flutter approach,
but if you are familiar with more advanced application state management approaches, like Providers, BloC, GetX etc. it is a plus to implement or use existing solutions in app architechture.

Finally your version of App should have UI to represent fetched data with at least one extra screen for detailed information
about track.

### Required objectives

To complete the assignment successfully you must fulfill the following tasks:
- Build three screens. 
    1. Home screen - standard flutter demo home page.
    2. Tracks screen - a list of tracks from API.
    3. Single track screen - a single track from API.   
- Navigation and routes should be set up and used throughout the app.
- Interaction with the ‘flutter demo home page’ counter on 1 of the other screens.

### Optional extras

Feel free to add animations, custom design, effects and gestures. These extras aren't required but are a plus if implemented. It's also possible to add links of your git reposotories to this README if you already built apps with these widgets.  


## Flutter Getting Started documentation

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
