## Django Polls Tutorial App
by Tharathorn Bunrattanasathian

### How to run the app server for the project 
1. Make sure you are in the root directory (repository root) of the project
2. Create ```settings.ini``` for your local app environment settings *(See default guide below)*
    - Make sure your secret key is strong enough. (Recommended: ```PBKDF2``` algorithm with a ```SHA256``` hash)
3. Run ```pip install -r requirements.txt``` first to install required packages for the project.
4. Import the optional Question data from ```db.sql``` to the SQLite database. You can either use the following database browsers to migrate it:
    - DB Browser for SQLite
    - DBeaver
5. Run ```python manage.py runserver``` and, Voila!, the server should listen on the default port.

### .env default guide
| Config variable | Value | Note |
|:---:|:---:|:---:|
|DEBUG|True|If the project are in development mode|
|LANGUAGE_CODE|en-us|Default language for the project|
|TIME_ZONE|Asia/Bangkok||
|DATABASE_URL|sqlite://./db.sqlite3|If your SQLite database file is in the same root directory as the project|
### Dependency requirements
Easily install dependencies by using ```requirements.txt```

| Packages | Version |
|:---:|:---:|
|Python | 3.7.3 or higher|
|Django | 2.2.5|
|Python-decouple | 3.1 |
|dj-database-url|0.5.0|
|Unipath|1.1|

### Progress overview
|Part #     | Description|Done?|
|:---------:|:----------:|:---:|
|I| Project, app, and first view creation |✓|
|II| Database and model setup, migrations, Django model API, and site administration basics |✓|
|III| More about responsive views, templates, request handling, and URL routing |✓|
|IV| Simple forms, generic views and its classes |✓|
|V| All about testing basics in Django |✓|
