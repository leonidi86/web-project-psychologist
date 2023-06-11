import unittest
from articles import load_articles
from datetime import datetime
from bottle import template, request
from routes import articles

class Test_test_articles(unittest.TestCase):

    def test_post_articles_invalid_email(self):
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

        # Выполнение
        result = articles()

        # Проверка утверждений
        self.assertEqual(result, template('articles', articles=load_articles(), year=datetime.now().year))
        
        # Проверка, что список статей не изменился
        self.assertEqual(load_articles(), existing_articles)

    def test_post_articles_valid(self):
        # Подготовка
        request.method = 'POST'
        request.forms = {
            'nickname': 'John',
            'name': 'Test Article',
            'article': 'This is a test article.',
            'email': 'john@example.com'
        }
    
        # Выполнение
        result = articles()
    
        # Проверка утверждений
        self.assertEqual(result, template('articles', articles=load_articles(), year=datetime.now().year))
        self.assertGreater(len(load_articles()), 0)



if __name__ == '__main__':
    unittest.main()