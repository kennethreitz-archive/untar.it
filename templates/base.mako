<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />

    <title><%block name="title">Untar.it</%block></title>

    <link href="/static/css/base.css" media="screen" rel="stylesheet" type="text/css" />
    <link rel="icon" type="image/png" href="/static/images/icon.png" />

    <%block name="extra_head" />
</head>

<body>

    ${next.body()}

    <footer>
        Created by
        <a href="http://kennethreitz.org">kennethreitz</a> and
        <a href="http://shazow.net/">shazow</a>.
    </footer>

    <script type="text/javascript">
      var _gaq = _gaq || [];
      // TODO:
      // _gaq.push(['_setAccount', 'XXX']);
      // _gaq.push(['_trackPageview']);

      (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();
    </script>

    <%block name="tail">
    </%block>
</body>

</html>
