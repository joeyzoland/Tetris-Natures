from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.index),
    url(r'^courses$', views.courses),
    url(r'^confirmation/(?P<id>\d+)$', views.confirmation),
    url(r'^keep$', views.keep),
    url(r'^delete/(?P<id>\d+)$', views.delete),
    # url(r'^comments$', views.comments)
]
