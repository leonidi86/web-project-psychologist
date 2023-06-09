
from datetime import datetime

app = Flask(__name__)

@app.route('/')
def index():
    articles = [
        {
            'author': 'Имя автора 1',
            'text': 'Текст статьи 1',
            'date': 'Дата написания 1'
        },
        {
            'author': 'Имя автора 2',
            'text': 'Текст статьи 2',
            'date': 'Дата написания 2'
        },
        {
            'author': 'Имя автора 3',
            'text': 'Текст статьи 3',
            'date': 'Дата написания 3'
        }
    ]

    return render_template('articles.tpl', title='Полезные статьи', year=datetime.now().year, articles=articles)

if __name__ == '__main__':
    app.run()