try:
    import sae
    from mysite import wsgi
except ImportError:
    def application(environ, start_response):
        start_response('200 ok', [('content-type', 'text/plain')])
        return ['']
else:
    application = sae.create_wsgi_app(wsgi.application)
