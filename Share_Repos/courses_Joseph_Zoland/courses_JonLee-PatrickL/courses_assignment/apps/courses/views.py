from django.shortcuts import render, redirect, HttpResponse
from .models import Course, Description

# Create your views here.
def index(req):
    context = {
        "courses": Course.objects.all(),
    }
    return render(req, 'courses/index.html', context)
def courses(req):
    if req.method == "POST":
        course_link = Course.objects.create(name=req.POST['name'])
        Description.objects.create(course=course_link, description=req.POST['description'])
    return redirect('/')
# def comments(req):
#     context = {
#         "comments": req.GET['comment']
#     }
#     return render(req, 'courses/comments.html', context)
def confirmation(req, id):
    if req.method == "GET":
        context={
            "courses": Course.objects.get(id=id)
        }
        return render(req, 'courses/confirm.html', context)
def delete(req, id):
    if req.method == "GET":
        Course.objects.get(id=id).delete()
        return redirect('/')
def keep(req):
    if req.method =="GET":
        return redirect('/')
