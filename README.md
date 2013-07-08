# APILA

1 1 v. tr. [LC] Posa (coses) l’una sobre l’altra formant pila o piles

## DESCRIPTION

A RESTful API to find learning resources in context

##INSTALLATION

    git clone git://github.com/xdurana/apila.git
    cd apila
    bundle install

    cp config/summon.example.yml config/summon.yml
    subl config/summon.yml

    shotgun

## TESTS

    http://localhost:9393/api/v1/status/ping
    http://localhost:9393/api/v1/summon/search?s.q=probability+models
    http://localhost:9393/api/v1/summon/conferences?keyword=quantum+mechanics
    http://localhost:9393/api/v1/summon/documents?keyword=cognitive+science
    http://localhost:9393/api/v1/summon/journals?keyword=learning+analytics

## LINKS

* [APILA API Documentation](http://docs.xdurana.apiary.io/)
* [Summon API](http://api.summon.serialssolutions.com/help/api/)
* [Ruby language bindings for Serials Solutions Summon Unified Discovery Service](http://rubygems.org/gems/summon)
* [Summon Gem Model](http://rubydoc.info/gems/summon/2.0.5/frames)

## LICENSE

(The MIT License)

Copyright (c) 2013 Xavier Duran Albareda

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.