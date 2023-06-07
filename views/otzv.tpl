%from datetime import datetime
% rebase('layout.tpl', title='Отзывы', year=datetime.now().year)

<!DOCTYPE html>
<html>
<head>
<br />
    

    <h2>Оставить отзыв:</h2> <!-- Блок отзывов с воодом данных имени, отзыва и номера телефона -->
    <form method="POST" action="/otzv">
        <label for="nickname">Никнейм:</label>
        <input type="text" id="nickname" name="nickname" required><br>
        <label for="review">Отзыв:</label>
        <textarea id="review" name="review" required></textarea><br>
        <label for="phone">Номер телефона:</label>
        <input type="text" id="phone" name="phone" required><br>
        <input type="submit" value="Добавить отзыв">
    </form>

    <h2>Все отзывы:</h2>
    <ul>
        % for review in reviews:
            <li><strong>{{ review['nickname'] }}</strong>: {{ review['review'] }} </strong>: {{ review['timestamp'] }} )</li> <!-- Список всех отзывов -->
         % end
    </ul>
    <!--
<h2>Все отзывы:</h2>
<ul>
    % for review in reviews:
        <li>{{ review.Name }} - {{ review.Reviews }}</li>
    % end
</ul>

<h3>Оставить отзыв</h3>
<form action="/reviews" method="post">
    <p><textarea rows="2" cols="50" name="Reviews" placeholder="Описание"></textarea></p> 
    <p><input type="text" size="50" name="Name" placeholder="Ваше имя"></input></p>
    <p><input type="text" size="50" name="Adress" placeholder="Ваша почта"></input></p>
    <p><input class="btn btn-default" type="submit" value="Добавить отзыв"></p>
</form>
-->
</body>
</html>

