# Assignment 1
### Q1 : Explain what a widget tree is in Flutter and how parent-child relationships work between widgets.
- A widget tree in Flutter represents the hierarchical structure of all widgets that make up a Flutter app. Every visual element — from text and buttons to layouts like columns and rows — is a widget, and they are nested inside one another to form this tree. The root widget (often MaterialApp) sits at the top, and each widget inside it becomes a child. Parent widgets control the layout and behavior of their children, such as alignment, padding, or positioning. For example, in this project, Column is a parent widget containing multiple children like Row, InfoCard, and GridView. This tree structure allows Flutter to efficiently rebuild only the parts of the interface that change.

### Q2: List all the widgets you used in this project and explain their functions.
In this project, several widgets were used to build the UI. Scaffold provides the main structure of the page, including the app bar and body. AppBar displays the title of the application at the top of the screen. Padding adds space around the content, while Column and Row arrange widgets vertically and horizontally, respectively. InfoCard and ItemCard are custom widgets used to display information in card form. Card itself provides a container with elevation to create a shadow effect. GridView.count displays a grid layout of ItemCard widgets. Icon and Text show graphical symbols and text content, while Center aligns its child to the center of the available space. Finally, Material and InkWell are used to create tappable, visually interactive components that respond with ripple effects when pressed.

### Q3: What is the function of the MaterialApp widget? Why is it often used as the root widget?
The MaterialApp widget serves as the root of a Flutter application that follows Material Design principles. It provides several essential features such as navigation (via routes), theming, localization, and the overall structure of the app. MaterialApp also sets up the app’s title, default font, color scheme, and visual density across different platforms. It is often used as the root widget because it wraps all the necessary configurations and ensures a consistent design language throughout the app. Without MaterialApp, widgets like Scaffold and AppBar would not have access to Material Design properties.

### Q4: Explain the difference between StatelessWidget and StatefulWidget. When would you choose one over the other?
A StatelessWidget is a widget that does not change once it is built — its properties and UI remain constant throughout its lifetime. It is ideal for displaying static content such as labels, icons, or simple layouts. On the other hand, a StatefulWidget can change dynamically during runtime based on user interaction or data updates. It has a State object that holds mutable data and triggers the widget to rebuild when changes occur. You would choose a StatefulWidget when your UI needs to update, for example, a counter that increases when a button is pressed. In this project, MyHomePage is implemented as a StatelessWidget because the displayed information does not change after being built.

### Q5: What is BuildContext and why is it important in Flutter? How is it used in the build method?
BuildContext is an object that provides information about the position of a widget in the widget tree and allows access to theme data, inherited widgets, and navigation functions. It’s essential in Flutter because it connects each widget to its location within the overall tree, enabling parent-child communication. Inside the build method, BuildContext is used to retrieve theme colors (for example, Theme.of(context).colorScheme.primary) or to navigate to new pages using Navigator.of(context). Essentially, it helps widgets understand their environment and interact properly within the app.

### Q6: Explain the concept of a “hot reload” in Flutter and how it differs from a “hot restart.”
“Hot reload” is a feature in Flutter that allows developers to quickly see code changes reflected in the running app without losing its current state. When you make changes to the UI or logic and press hot reload, Flutter injects the updated code into the running app and rebuilds the widget tree while keeping the existing data and state intact. This makes UI development much faster. In contrast, a “hot restart” restarts the entire app and rebuilds everything from scratch, which clears all current states and data. Hot reload is ideal for iterative design and debugging, while hot restart is used when major structural changes require a full rebuild.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Assignment 2
### Q1: Explain the difference between Navigator.push() and Navigator.pushReplacement() in Flutter. In what context of your application is each best used?
Navigator.push() is used to navigate from one page to another while keeping the previous page in the navigation stack. This means the user can return to the previous page using the back button. It’s useful for temporary navigations, like when the user views product details and then goes back to the main menu. On the other hand, Navigator.pushReplacement() replaces the current page in the stack with a new one, preventing the user from returning to the previous page. This is ideal for navigation flows where returning doesn’t make sense, such as moving from a login screen to the home page after a successful login in the Football Shop app.

### Q2: How do you use hierarchy widgets like Scaffold, AppBar, and Drawer to build a consistent page structure in your application?
In Flutter, the combination of Scaffold, AppBar, and Drawer helps maintain a consistent layout structure across different screens. The Scaffold widget acts as the foundation of each page, providing areas for the app bar, drawer, body content, and floating action buttons. The AppBar gives a consistent top navigation bar with the shop title or logo, while the Drawer provides an easy way for users to navigate to other sections like Home, Products, and About. Using these widgets ensures that all pages in the Football Shop app share a uniform look and feel, making navigation intuitive and cohesive.

### Q3: In the context of user interface design, what do you think is the advantage of using layout widgets like Padding, SingleChildScrollView, and ListView when displaying form elements? Provide usage examples from your application.
Layout widgets like Padding, SingleChildScrollView, and ListView are crucial for creating a user-friendly and responsive interface. Padding helps give breathing space between elements, preventing them from appearing cluttered. SingleChildScrollView allows the content to scroll vertically, ensuring that forms or long content remain accessible even on smaller screens. ListView efficiently displays scrollable lists, such as product listings. In the Football Shop app, Padding is used to separate product cards, SingleChildScrollView is used to make the product detail form scrollable, and ListView displays a list of available products in the store menu.

### Q4: How do you set the color theme so that your Football Shop has a visual identity that is consistent with the shop brand?
Setting a consistent color theme is essential for creating a strong brand identity. In Flutter, this can be done by defining a custom theme inside the MaterialApp widget using the theme property. The Football Shop app applies a color palette that reflects the brand — for instance, using shades of blue and red inspired by FC Barcelona’s iconic colors. This color scheme is applied throughout the app, including the AppBar, buttons, icons, and backgrounds. Maintaining consistent colors not only strengthens brand recognition but also enhances the overall visual harmony of the application.

-----------------------------------------------------------------------------------------------------------------------

# Assignment 3
1. Why we need a Dart model when fetching/sending JSON data

Creating a Dart model provides strong typing, null safety, and maintainability when working with JSON. If we directly map JSON as Map<String, dynamic>, there is no guarantee that the received data contains the correct types—an integer might become a string, a missing field might cause runtime errors, and null values may appear unexpectedly. With a dedicated Dart model, each field has a defined type, constructors can enforce required data, and errors are caught at compile time instead of crashing the app at runtime. Models also make the code cleaner and more maintainable because all JSON parsing and formatting logic is centralized in one place. Without models, the code becomes messy, repetitive, error-prone, and harder to understand as the project grows.

2. Purpose of the http and CookieRequest packages

The http package is a general-purpose networking library that allows sending HTTP requests such as GET, POST, PUT, and DELETE. It is stateless—meaning every request is independent and does not automatically store cookies or authentication data.
On the other hand, CookieRequest (from pbp_django_auth) is specifically designed for communicating with a Django backend using session-based authentication. It stores cookies automatically, keeps the login session alive, and ensures that authenticated requests (e.g., fetching user-specific data) include the correct session cookie.
In short: http handles generic API requests, while CookieRequest handles authenticated, session-based communication with Django.

3. Why the CookieRequest instance must be shared globally

A single shared CookieRequest instance ensures that the authentication state is consistent across the whole Flutter app. If each widget created its own instance, the session cookie would not be shared — one screen might think the user is logged in while another thinks the user is logged out. By using a global provider (as required in the assignment), all pages use the same stored cookies. This allows the login session to persist, lets the user stay logged in while navigating between pages, and ensures that protected endpoints on Django receive the correct authentication cookie.

4. Connectivity configuration required for Flutter ↔ Django communication

To allow Flutter to communicate with Django running on a local machine, several configurations must be set:

10.0.2.2 in ALLOWED_HOSTS — Android emulators treat your computer as 10.0.2.2. If it is not allowed, Django blocks all incoming requests for security.

Enable CORS — Browsers (including Flutter Web) block requests to different hosts unless CORS explicitly allows them. Without proper CORS rules, all API calls fail.

SameSite and cookie settings — When using session-based authentication, cookies must be allowed to travel across different domains/ports. Incorrect SameSite settings will cause login cookies not to be saved.

Android Internet permission (android.permission.INTERNET) — Without this, the Flutter app cannot make any network request at all.

If any of these settings are missing, Flutter will not be able to connect, send requests, authenticate, or read Django’s responses. The app may show empty data, API errors, or fail to log in entirely.

5. Data transmission mechanism (input → Django → Flutter)

When the user enters input in Flutter (such as product name or description) and submits the form, the data is collected and sent as a JSON body through an HTTP request to Django. Django receives the request, validates the data, stores or processes it, and returns a JSON response. Flutter then parses this JSON using the Dart model and updates the UI accordingly. This cycle ensures that user-generated data flows safely from Flutter to Django and back into a structured, displayable format.

6. Authentication mechanism (login/register/logout)

For login, registration, and logout, Flutter sends user credentials (username, password, or registration data) through a CookieRequest POST request. Django’s authentication system checks the credentials:

If correct, Django creates a session and sends back a session cookie.

CookieRequest automatically stores this cookie, allowing Flutter to stay logged in.

Whenever Flutter accesses a protected endpoint (e.g., fetching user products), the session cookie is automatically included, so Django knows which user is making the request. Logging out simply clears this cookie on both Django and Flutter sides. After successful login, Flutter navigates the user to the main menu, while logout redirects them back to the login screen.
This mechanism ensures secure, persistent authentication across the entire app.
