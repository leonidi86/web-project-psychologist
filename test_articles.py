import unittest
from articles import load_articles
from datetime import datetime
from bottle import template, request
from routes import articles
import json

class Test_test_articles(unittest.TestCase):

    def test_post_articles_invalid_email(self):
        articles2_FILE = 'articles2.json'
    
        # Подготовка
        request.method = 'POST'
        request.forms = {
            'nickname': 'John',
            'name': 'Test Article',
            'article': 'This is a test article.',
            'email': 'invalid_email'
        }

        # Сохранение существующих статей перед выполнением теста
        existing_articles = load_articles()
    
        # Сохранение изначального количества статей в articles2_FILE
        with open(articles2_FILE, 'r', encoding='utf-8') as f:
            initial_num_articles2 = len(json.load(f))

        # Выполнение
        result = articles()

        # Проверка утверждений
        self.assertEqual(result, template('articles', articles=load_articles(), year=datetime.now().year))
    
        # Проверка, что список статей не изменился
        self.assertEqual(load_articles(), existing_articles)
    
        # Проверка, что количество статей в articles2_FILE осталось неизменным
        with open(articles2_FILE, 'r', encoding='utf-8') as f:
            num_articles2 = len(json.load(f))
        self.assertEqual(num_articles2, initial_num_articles2)


    def test_post_articles_invalid_empty(self):
        articles2_FILE = 'articles2.json'
    
        # Подготовка
        request.method = 'POST'
        request.forms = {
            'nickname': 'John',
            'name': 'Test Article',
            'article': '',
            'email': 'john@example.com'
        }
    
        # Сохранение изначального количества статей в articles2_FILE
        with open(articles2_FILE, 'r', encoding='utf-8') as f:
            initial_num_articles2 = len(json.load(f))
    
        # Сохранение изначального количества статей
        initial_num_articles = len(load_articles())
    
        # Выполнение
        result = articles()
    
        # Проверка утверждений
        self.assertEqual(result, template('articles', articles=load_articles(), year=datetime.now().year))
    
        # Проверка, что новая статья не была сохранена
        self.assertEqual(len(load_articles()), initial_num_articles)
    
        # Проверка, что количество статей в articles2_FILE осталось неизменным
        with open(articles2_FILE, 'r', encoding='utf-8') as f:
            num_articles2 = len(json.load(f))
        self.assertEqual(num_articles2, initial_num_articles2)




if __name__ == '__main__':
    unittest.main()