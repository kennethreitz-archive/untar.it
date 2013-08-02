<%inherit file="base.mako" />

<h1>Untar.it</h1>

<p>
    What kind of file do you need to open?
</p>

<ul>
    % for filetype in route.context['known_types']:
        <li><a href="/${filetype}/">${filetype}</a></li>
    % endfor
</ul>
