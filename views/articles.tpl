%from datetime import datetime
% rebase('layout.tpl', title='Отзывы', year=datetime.now().year)

<!DOCTYPE html>
<html>
<head>
    <title>Полезные статьи</title>
    <style>
        /* Ваши стили CSS для страницы */
    </style>
</head>
<body>
    <h1>Полезные статьи</h1>

    <div class="articles-container">
        <h3>Список статей:</h3>
        %for article in articles:
            <div class="article">
                <strong>{{ article['author'] }}</strong>: {{ article['text'] }}
            </div>
        %end
    </div>

    <h2>Добавить статью</h2>
    <form method="POST" action="/submit_article">
        <label for="author">Автор:</label>
        <input type="text" name="author" id="author" required><br>

        <label for="text">Текст:</label>
        <textarea name="text" id="text" required></textarea><br>

        <input type="submit" value="Разместить">
    </form>
</body>
</html>