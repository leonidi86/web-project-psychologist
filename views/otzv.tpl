%from datetime import datetime
% rebase('layout.tpl', title='Отзывы', year=datetime.now().year)

<!DOCTYPE html>
<html>
<head>
<br />
    

    <h2>Оставить отзыв:</h2> <!-- Блок отзывов с воодом данных имени, отзыва и номера телефона -->
    <form method="POST" action="/otzv">

    <p><textarea rows="2" cols="50" name="nickname" placeholder="Описание" required></textarea></p> 
    <p><input type="text" size="50" id="review" name="review" placeholder="Ваше имя" required></input></p>
    <p><input type="text" size="50" id="phone" name="phone" placeholder="Ваша номер телефона" required></input></p>
    <p><input type="text" size="50" id="email" name="email" placeholder="Ваша почта" required></input></p>
    <p><input class="btn btn-default" type="submit" value="Добавить отзыв"></p>

    </form>

    <h2>Все отзывы:</h2>
    <ul>
        % for review in reviews:
            <li><strong>{{ review['nickname'] }}</strong>: {{ review['review'] }} </strong>: {{ review['timestamp'] }} )</li> <!-- Список всех отзывов -->
         % end
    </ul>

</body>
</html>

