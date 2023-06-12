import unittest
from module1 import load_reviews_from_file, save_review_to_file

class TestReviews(unittest.TestCase):
    #Проверяет, что функция load_reviews_from_file возвращает список отзывов.
    def test_load_reviews_from_file(self):
        reviews = load_reviews_from_file()
        self.assertIsInstance(reviews, list)

    #Проверяет, что функция save_review_to_file сохраняет отзыв в файл и можно загрузить его с помощью load_reviews_from_file.
    def test_save_review_to_file(self):
        review = {
            'nickname': 'John Doe',
            'review': 'Great product!',
            'phone': '1234567890',
            'email': 'john@example.com',
            'rating': '5',
            'timestamp': '2023-06-13 10:00:00'
        }
        save_review_to_file(review)
        reviews = load_reviews_from_file()
        self.assertIn(review, reviews)

    #Проверяет, что функция save_review_to_file вызывает исключение ValueError, если отзыв содержит слишком длинное описание.
    def test_save_review_to_file_invalid_data(self):
        review = {
            'nickname': 'John Doe',
            'review': 'This review is too long. ' * 50,
            'phone': '1234567890',
            'email': 'john@example.com',
            'rating': '5',
            'timestamp': '2023-06-13 10:00:00'
        }
        with self.assertRaises(ValueError):
            save_review_to_file(review)

    #Проверяет, что функция save_review_to_file создает новый файл, если файл с отзывами не существует.
    def test_save_review_to_file_missing_file(self):
        review = {
            'nickname': 'Jane Smith',
            'review': 'Excellent service!',
            'phone': '9876543210',
            'email': 'jane@example.com',
            'rating': '4',
            'timestamp': '2023-06-13 11:00:00'
        }
        save_review_to_file(review)
        reviews = load_reviews_from_file()
        self.assertIn(review, reviews)

    #Проверяет, что функция save_review_to_file добавляет отзыв в существующий файл с отзывами.
    def test_save_review_to_file_existing_file(self):
        review = {
            'nickname': 'Alice Johnson',
            'review': 'Average experience.',
            'phone': '5555555555',
            'email': 'alice@example.com',
            'rating': '3',
            'timestamp': '2023-06-13 12:00:00'
        }
        save_review_to_file(review)
        reviews = load_reviews_from_file()
        self.assertIn(review, reviews)

if __name__ == '__main__':
    unittest.main()
