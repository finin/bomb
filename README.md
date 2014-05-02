bomb
====

Born on My Birthday Web demo

Born on My Birthday (BOMB) is a simple example of how a web site can
use SPARQL to provide a service. In this case, you can enter a date
(e.g., your birthday) and see people in Wikipedia (via the public
DBpedia service) who were born on that date. You can leave any of the
date fields blank to see up to 20 people born on a partial date.

The Web site demo is implemented using Bottle (http://bottlepy.org/),
a "fast, simple and lightweight WSGI micro web-framework for
Python". It is distributed as a single file module and has no
dependencies other than the Python Standard Library."  Bottle has a
web server built in and can calso be easily adapted to work with other
servers.

Doing 'python bomb.py' will run the web service on your computer
listening to port 8080. Visit http://localhost:8080/bomb/ to try it.

The demo source code is available at https://github.com/finin/bomb and
includes a copy of the bottle framework.
