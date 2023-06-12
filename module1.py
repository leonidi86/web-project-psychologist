# Load reviews from file
import email

# Load reviews from file
def load_reviews_from_file():
    reviews = []
    try:
        with open('reviews.txt', 'r', encoding='utf-8') as file:
            for line in file:
                data = line.strip().split(',')
                if len(data) == 6:
                    nickname, review, phone, email, rating, timestamp = data
                    reviews.append({'nickname': nickname, 'review': review, 'phone': phone, 'email': email, 'rating': rating, 'timestamp': timestamp})
    except FileNotFoundError:
        pass
    return reviews

def save_review_to_file(review):
    with open('reviews.txt', 'a', encoding='utf-8') as file:
        file.write(f"{review['nickname']},{review['review']},{review['phone']},{review['email']},{review['rating']},{review['timestamp']}\n")
        if len(review['review']) > 300:
            raise ValueError("The description should not exceed 300 characters.")



