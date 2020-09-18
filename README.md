Game Tracker (Sinatra Project)
In order to implement Authentication in Sinatra, we need to conduct the following tasks:

Enable the rack session cookie middleware.
Generate a session secret so that our cookies are securely encrypted.
Create a `User` model that stores a unique email/username and encrypted password
Implement the `has_secure_password` macro in the `User` model to enable storing an encrypted version of the password and authenticating against that.
Build forms for sign up and log in and links to the routes that render them
Build out controllers that handle rendering forms and responding to their submission
Use the methods from `has_secure_password` to create user accounts and authenticate them later, storing the user's ID in session cookies using the `session` hash in our controllers.

Dependencies (Gems/Packages)
ActiveRecord 
    Adds methods to our classes that help us create and persist objects & relationships
bcrypt 
    Password Encryption for the string that's passed in (dependency of has_secure_password)
dotenv  (.env)
    Used to create a hidden file in which we can store credentials (API Keys, emails, etc)
    We add this file to .gitignore, so it won't be tracked in version control
    The constants defined in the .env file are accessible within the ENV constant in our app after we run Dotenv.load
session_secret_generator
    Creates a cryptographically random string of hexadecimal characters. 
    Used with session_secret 
    Store the result in SESSION_SECRET within the .env file
    We Run This To Generate It => generate_secret
tux 
    Tux dresses up sinatra for interactive use. 
    If you have models, you can also interact with  them using tux. 
    To start tux we run => bundle exec tux 
    Extra Info
        We use it to interact with your helpers, view rendering and your app's response objects. 
        Tux also gives you commands to view your app's routes and settings
    https://github.com/cldwalker/tux 

