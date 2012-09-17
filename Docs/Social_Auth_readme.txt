Our app needs a way to identify and authorize users (these two features are referred to in the computer security realm as authentication).

There are many other sites that have already tackled the same problem and have dealt with it successfully. These is why we will hookup to those sites and let them worry about storing user passwords and managing security.

This is done VIA OAUTH. But the OAUTH specs are not honored properly and almost everyone has their own specially flavored implementation. This poses a problem. There are several clients available, but in particular I've chosen django-social-auth because it is backed up by unit testing, it has at least some documentation, and it's actively being maintained by the community.

To install django social auth, log on to the command prompt and type:

sudo pip install django-social-auth

Then adjust your settings.py file for the project, so that 'social_auth' is listed amongst the installed apps array. Also add a new variable to settings.py which will be used by django-social-auth: 'AUTHENTICATION-BACKENDS= ('social_auth.backends.contrib.GitHubBackend','django.contrib.auth.backends.ModelBackend','bckend1','backend2',...'backendN',)'. Use this array to list specific backends to support when a user is logging into our application.

Also in settings.py, add this import statement:

from django.template.defaultfilters import slugify

and add these variables:

SOCIAL_AUTH_ENABLED_BACKENDS = ('github',)
SOCIAL_AUTH_COMPLETE_URL_NAME  = 'socialauth_complete'
SOCIAL_AUTH_ASSOCIATE_URL_NAME = 'associate_complete'
SOCIAL_AUTH_DEFAULT_USERNAME = lambda u: slugify(u)
SOCIAL_AUTH_EXTRA_DATA = false
SOCIAL_AUTH_CHANGE_SIGNAL_ONLY = True

SOCIAL_AUTH_ASSOCIATE_BY_MAIL = True

Go to your project's root urls.py file and add the following url:

urlpatterns = patterns("",
   url('',include('social_auth.urls')),
   ...
)

remember to perform from the console:

python manage.py syncdb

Now, what the documentation doesn't tell you, is to put links in your login template:

Login with <a href="{% url socialauth_begin 'twitter' %}">Twitter</a>
