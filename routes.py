from re import I
from bottle import route, view, template, request, redirect
from datetime import datetime
from module1 import load_reviews_from_file, save_review_to_file

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

    if request.method == 'POST': #добавление информации отзывов
        nickname = request.forms.get('nickname')
        review = request.forms.get('review')
        phone = request.forms.get('phone')
        email = request.forms.get('email')
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        new_review = {'nickname': nickname, 'review': review, 'phone': phone, email : 'email', 'timestamp':timestamp}
        save_review_to_file(new_review)
        reviews.append(new_review)
          

    return template('otzv', reviews=reviews, year=datetime.now().year)


          







def load_articles():
    # Здесь можно вставить код загрузки статей
    # из файла или другого источника данных
    return []

@route('/articles')
def articles():
    articles = load_articles()
    return template('articles.tpl', articles=articles)

@route('/submit_article', method='POST')
def submit_article():
    author = request.forms.get('author')
    text = request.forms.get('text')
    # Здесь можно добавить код для сохранения статьи
    # в файле или другом источнике данных
    return 'Статья добавлена успешно'

