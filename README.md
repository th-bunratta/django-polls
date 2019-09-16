## Django Polls Tutorial App
by Tharathorn Bunrattanasathian

### How to run the app server for the project 
1. Make sure you are in the root directory (repository root) of the project
2. Run ```pip install``` first.
3. Import the necessary Question data from ```db.sql``` to the SQLite database. You can either use the following database browsers to migrate it:
    - DB Browser for SQLite
    - DBeaver
4. Run ```python manage.py runserver``` and, Voila!, the server should listen on the default port.


### Dependency requirements
Easily install dependencies by using ```requirements.txt```

| Packages | Version |
|:---:|:---:|
|Python | 3.7.3 or higher|
|Django | 2.2.5|
|Python-decouple | 3.1|

### Progress overview
|Part #     | Description|Done?|
|:---------:|:----------:|:---:|
|I| Project, app, and first view creation |✓|
|II| Database and model setup, migrations, Django model API, and site administration basics |✓|
|III| More about responsive views, templates, request handling, and URL routing |✓|
|IV| Simple forms, generic views and its classes |✓|
|V| All about testing basics in Django |✓|
