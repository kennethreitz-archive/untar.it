#!/usr/bin/env python

from composer.index import Index, Route, Static
from composer.filters import MakoContainer


class UntaritIndex(Index):

    def _register_filters(self):
        self.register_filter('filetype', MakoContainer, {'directories': ['templates'], 'template': 'filetype.mako'})

    def _generate_static(self):
        yield Static('/static', 'static')

    def _generate_routes(self):
        context = {'title': 'Hello'}

        yield Route('/', 'templates/index.mako', filters=['mako'], context=context)

        # TODO: Pull this from a yaml file or something
        for filetype in ['tar.gz', 'tar.bz2']:
            url = self.absolute_url(filetype + '/')
            yield Route(url, 'templates/filetype.mako', filters=['filetype'], context=context)


if __name__ == '__main__':
    import json
    import os

    index = UntaritIndex(os.path.dirname(__file__))
    print json.dumps(index.to_dict(), indent=4)
