from bottle import route, run, template, request, static_file
from sparql import ask_query

# sparql query to get information on people born on a given day
bombq = open('static/sparql_query.txt').read()

@route('/static/<filename:path>')
def send_static(filename):
    return static_file(filename, 'static/')

@route('/')
@route('/bomb')
def index():
    return template('bomb', date=('','',''), offset=0, rows=[])

@route('/bomb', method="POST")
def index_post():
    date = (request.forms['year'], request.forms['month'], request.forms['day'])
    date_string = ("%s-%s-%s" % date).strip()
    offset = int(request.forms['offset'])
    results = ask_query(bombq % (date_string, offset), format='text/tab-separated-values')
    if results:
        rows = [map(unquote, row) for row in results[1:]]
        return template('bomb', date=date, offset=offset, rows=rows)
    else:
        return ''

def unquote(s):
    # remove extraneous "s from a string
    return s[1:-1] if len(s) > 2 and s[0] == s[-1] == '"' else s

run(host='localhost', port=8080, debug=True)

