import json
import io

articles_FILE = 'articles.json'

def save_article(article):
    articles = load_articles()
    articles.append(article)
    with io.open(articles_FILE, 'w', encoding='utf-8') as f:
        json.dump(articles, f, ensure_ascii=False)

def load_articles():
    try:
        with io.open(articles_FILE, 'r', encoding='utf-8') as f:
            articles = json.load(f)
    except FileNotFoundError:
        articles = []
    return articles

def save_article_to_file(article):
    with io.open(articles_FILE, 'a', encoding='utf-8') as file:
        file.write(json.dumps(article, ensure_ascii=False))
        file.write('\n')

def load_articles_from_file():
    articles = []
    try:
        with io.open(articles_FILE, 'r', encoding='utf-8') as file:
            for line in file:
                article = json.loads(line.strip())
                articles.append(article)
    except FileNotFoundError:
        pass
    return articles
