import json
articles_FILE = 'articles.json'
articles2_FILE = 'articles2.json'

def save_article(article):
    with open(articles2_FILE, 'r+', encoding='utf-8') as file:
        data = json.load(file)
        data.append(article)
        file.seek(0)
        json.dump(data, file, ensure_ascii=False, indent=2)
        file.truncate()

def load_articles():
    try:
        with open(articles_FILE, 'r', encoding='utf-8') as f:
            articles = json.load(f)
    except FileNotFoundError:
        articles = []
    return articles
