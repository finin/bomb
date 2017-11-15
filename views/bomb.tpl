<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head><link rel=stylesheet type="text/css" href="/static/bomb.css"></head>
<body>
<div id="container">
  <div id="header">
    <span>Born On My Birthday</span>
    <span style="float:right"><img src="static/bomb50.png"></span>
  </div>
  <div id="navigation"><div style="text-align:center">See people from Wikipedia born on a given day</div></div>
  <div id="content">

% import urllib2 
% def chop(txt):
%    return txt if len(txt) < 300 else txt[:297]+'...'
%    end   
% def accessible(url): # returns True if URL can be opened
%   try:
%     urllib2.urlopen(urllib2.Request(url))
%     return True
%   except:
%     return False
%   end
%   end
%
% year, month, day = date
% anonUrl = 'static/anon.gif' # use if no picture is available for a person
% months = 'January February March April May June July August September October November December'.split()

<form action="/bomb" method="post">
Birthday: <select name="month" id="month" onchange="" size="1">
 % for (num,name) in enumerate(months):
 %   the_month = '%02d' % (num+1,)
    <option value="{{the_month}}" {{'selected' if month==the_month else ''}}>{{name}}</option>
 %end
</select>            
<select name="day" id="day" onchange="" size="1">
  % for num in range(1,32):
  %   the_day = '%02d' % (num,)
  <option value="{{the_day}}" {{'selected' if day==the_day else ''}}>{{the_day}}</option>
  % end
</select>
<input type="text" name="year" maxlength="4" size="4" value={{year if year or offset>0 else '1960'}}> <i>blank for any</i>
<input type="hidden" name="offset" value={{0}}>
<input value="GO" type="submit" />
</form>

% if rows:
<center><table cellpadding="2">
  % for (Per, Wiki, Name, Inlinks, Text, PicUrl, Date) in rows:
  <tr><td style="width:100px"><img src="{{PicUrl if accessible(PicUrl) else anonUrl}}" width="100"></td>
      <td style="width:500px;valign:center"><a href="{{Wiki}}">{{Name}}</a>
      was born on {{Date.strip()}}. {{chop(Text)}} </td>
  </tr>
% end
</table></center>
% end
% if len(rows) == 20:
% # ask for more rows
% print 'offset:', offset
<form action="/bomb" method="post">
  <input type="hidden" name="day" value={{day}}>
  <input type="hidden" name="month" value={{month}}>
  <input type="hidden" name="year" value={{year}}>
  <input type="hidden" name="offset" value={{offset + 20}}>
  <input value="MORE" type="submit" />
</form>

% end
</div>

<div id="footer">
<a href="/static/about.html">About</a> &nbsp;&middot;&nbsp; <a href="/static/sparql_query.txt">SPARQL query</a>
</div>
</div></div>
</body>
</html>
