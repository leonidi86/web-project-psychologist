import json

REVIEWS_FILE = 'reviews.json'

def save_review(review):
    reviews = load_reviews()
    reviews.append(review)
    with open(REVIEWS_FILE, 'w') as f:
        json.dump(reviews, f)

def load_reviews():
    try:
        with open(REVIEWS_FILE, 'r') as f:
            reviews = json.load(f)
    except FileNotFoundError:
        reviews = []
    return reviews