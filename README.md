## Django Polls Tutorial App
#### *by Tharathorn Bunrattanasathian*

This application is a poll Django application consisting of two questions about popular western artists. In this app poll questions are located in ```\polls``` route, and
a voter can anonymously select only one choice at a time. If the voter wants to choose more, they can do so by clicking on ```Vote again```.

### Dependency requirements
|Python | 3.7.3 or higher|
|:---:|:---:|

For the list of dependent packages, see as follows or look up in [```requirements.txt```](requirements.txt)

| Python packages | Version |
|:---:|:---:|
|Django | 2.2.5|
|Python-decouple | 3.1 |
|dj-database-url|0.5.0|
|Unipath|1.1|

### How to run the app server for the project 
1. Make sure you are in the root directory (repository root) of the project
2. Create ```settings.ini``` for your local app environment settings *(See default guide below)*
    - Make sure your secret key is strong enough. (Recommended: ```PBKDF2``` algorithm with a ```SHA256``` hash)
3. Run <code>pip install -r [requirements.txt](requirements.txt)</code> first to install required packages for the project.
4. (*Optional*) Import the sample data by using the Django built-in command<pre>python [manage.py](manage.py) loaddata sample.json</pre> or from the SQL dump file [```db.sql```](db.sql) to the SQLite database by using either of the following database browsers to migrate it:
    - DB Browser for SQLite
    - DBeaver
5. Run <pre>python [manage.py](manage.py) runserver</pre> and, Voila!, the server should listen on the default port at <code>localhost:*default_port*</code>.

### Django configuration file (```.env```/```.ini```) defaults guide
| Config variable | Default value | Note |
|:---:|:---:|:---:|
|DEBUG|```True```|If the project is in development mode|
|LANGUAGE_CODE|```en-us```|Default language for the project|
|TIME_ZONE|```Asia/Bangkok```||
|DATABASE_URL|```sqlite://./db.sqlite3```|If your SQLite database file is in the same root directory as the project|

### Progress overview
|Part #     | Description|Done?|
|:---------:|:----------:|:---:|
|I| Project, app, and first view creation |✓|
|II| Database and model setup, migrations, Django model API, and site administration basics |✓|
|III| More about responsive views, templates, request handling, and URL routing |✓|
|IV| Simple forms, generic views and its classes |✓|
|V| All about testing basics in Django |✓|
