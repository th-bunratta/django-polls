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
5. If you first set up the repository on a clean slate, migrate the database as well by running the following Django command: <pre>python [manage.py](manage.py) migrate</pre>
6. Run <pre>python [manage.py](manage.py) runserver</pre> and, Voila!, the server should listen on the default port at <code>localhost:*default_port*</code>.

### Django configuration file (```.env```/```.ini```) defaults guide
| Config variable | Default value | Note |
|:---:|:---:|:---:|
|`DEBUG`|```True```|If the project is in development mode|
|`LANGUAGE_CODE`|```en-us```|Default language for the project|
|`TIME_ZONE`|```Asia/Bangkok```||
|`DATABASE_URL`|```sqlite://./db.sqlite3```|If your SQLite database file is in the same root directory as the project|

### Progress overview
|Part #     | Topic |Done?|
|:---------:|:----------:|:---:|
|I| Project Bootstrapping |✓|
|II| Databases, Models, and Site Administration |✓|
|III| Routing & Templates |✓|
|IV| Generic Views & Forms |✓|
|V| Django Unit Testing |✓|
|VI| Static Files |✓|
|VII| Django Administration Customisation||

#### Authentication Tutorial
|Story #     | Topic |Done?|
|:---------:|:----------:|:---:|
|I| User Login |✓|
|II| Polls Page Greets User by Name |✓|
|III| User Can Logout |✓|
|IV| User Must Login to Vote |✓|
|V| Vote for a Poll Replaces Previous Vote |✓|
|VI| Poll Details Page Shows a Visitor's Previous Vote |✓|
|VII| Poll Details Page Contains Links to View Results and List of Polls |✓|

#### Selenium Tutorial
| #     | Instructions |Done?|
|:---------:|:----------:|:---:|
|I| Go to /polls/. Find an H1 tag and verify that it contains “Current Polls” (or whatever text your heading is). |✓|
|II| Got to /polls/ and find a poll question on the page. The test passes if it is found.|✓|
|III| Click on a polls hyperlink. Verify that it goes to a page with list of choices to vote on. |✓|
|IV| Click on the first choice. Verify that it goes to a page of voting results. |✓|