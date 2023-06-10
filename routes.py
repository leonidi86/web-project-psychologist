import re
from bottle import route, view, request, template, json_dumps
from datetime import datetime
from module1 import load_reviews_from_file, save_review_to_file
from articles import save_article, load_articles
import json
import time
@route('/')
@route('/home')
@view('index')
def home():
    """Renders the home page."""
    return dict(
        year=datetime.now().year
    )

@route('/contact')
@view('contact')
def contact():
    """Renders the contact page."""
    return dict(
        title='Contact',
        message='Your contact page.',
        year=datetime.now().year
    )

@route('/about')
@view('about')
def about():
    """Renders the about page."""
    return dict(
        title='About',
        message='Your application description page.',
        year=datetime.now().year
    )
@route('/otzv', method='GET')
@route('/otzv', method='POST')
@view('otzv')
def otzv():
    reviews = load_reviews_from_file()

    if request.method == 'POST':
        nickname = request.forms.get('nickname')
        review = request.forms.get('review')
        phone = request.forms.get('phone')
        email = request.forms.get('email')
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

        if len(review) > 300:
            return "The description should not exceed 300 characters."

        phone_pattern = re.compile(r'^\+7\d{10}$')
        email_pattern = re.compile(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|ru|org)$')

        if not phone_pattern.match(phone):
            return "Пожалуйста, введите действительный номер телефона."

        if not email_pattern.match(email):
            return "Пожалуйста, введите действительный адрес электронной почты."

        new_review = {'nickname': nickname, 'review': review, 'phone': phone, 'email': email, 'timestamp': timestamp}
        save_review_to_file(new_review)
        reviews.append(new_review)

    return template('otzv', reviews=reviews, year=datetime.now().year)







@route('/articles', method='GET')
@route('/articles', method='POST')
@view('articles')
def articles():
    articles = load_articles()
    error = None  # Add a variable to store the error message

    if request.method == 'POST':
        nickname = request.forms.get('nickname')
        name = request.forms.get('name')
        article = request.forms.get('article')
        email = request.forms.get('email')
        timestamp = datetime.now().strftime("%Y-%m-%d") 

        email_pattern = re.compile(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|ru|org)$')

        if not email_pattern.match(email):
            error = "Пожалуйста, введите действительный адрес электронной почты."

        if not error:  # If no error, save the article
            new_article = {'nickname': nickname, 'article': article, 'name': name, 'email': email, 'timestamp': timestamp}
            save_article(new_article)
            articles.append(new_article)

    return template('articles', articles=load_articles(), year=datetime.now().year, error=error) 



