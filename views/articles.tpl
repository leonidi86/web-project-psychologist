% from datetime import datetime
% rebase('layout.tpl', title='Отзывы', year=datetime.now().year)
<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function validateForm() {
            var emailPattern = /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/;
            var nickname = document.forms["articleForm"]["nickname"].value;
            var name = document.forms["articleForm"]["name"].value;
            var article = document.forms["articleForm"]["article"].value;
            var email = document.forms["articleForm"]["email"].value;
            var textarea = document.getElementById("article");

            if (nickname.trim() === "") {
                alert("Пожалуйста, введите ваше имя.");
                return false;
            }

            if (name.trim() === "") {
                alert("Пожалуйста, введите название статьи.");
                return false;
            }

            if (article.trim() === "") {
                alert("Пожалуйста, введите статью.");
                return false;
            }

            if (article.length > 2000) {
                alert("Длина статьи не может превышать 2000 символов.");
                return false;
            } else if (article.length > 0 && article.length <= 200) {
                // Очистить поле ввода для статьи, если оно находится в правильном диапазоне
                textarea.value = "";
            }

            if (name.length > 200) {
                alert("Длина названия статьи не может превышать 200 символов.");
                return false;
            }

            if (!emailPattern.test(email)) {
                alert("Пожалуйста, введите действительный адрес электронной почты.");
                return false;
            }

            // Очистить поле ввода для названия статьи
            document.forms["articleForm"]["name"].value = "";

            alert("Спасибо за ваше предложение! Мы обязательно его рассмотрим и свяжемся с вами.");
            return true;
        }

        function countCharacters() {
            var textarea = document.getElementById("article");
            var counter = document.getElementById("counter");
            var remaining = 2000 - textarea.value.length;

            if (remaining < 0) {
                textarea.value = textarea.value.substr(0, 2000);
                remaining = 0;
            }
            counter.innerHTML = remaining + "/2000";
        }
    </script>
</head>
<body>
<br>
      <h2 style="text-align: center;">Полезные статьи:</h2><br>
% for article in articles:

    <strong><p class="contan">{{ article['nickname'] }}</p><p class="contan2">{{ article['name'] }}</strong><br>{{ article['article'] }}</p><strong><p style="text-align: right;">{{ article['timestamp'] }}</p><br><br></strong>
% end

    <h2 style="text-align: right;">Оставить полезную статью:</h2>
    <form name="articleForm" method="POST" action="/articles" onsubmit="return validateForm();" class="contan3" >
        <p><input type="text" size="50" id="nickname" name="nickname" placeholder="Ваше имя" required></p>
        <p><textarea rows="2" cols="50" id="name" name="name" placeholder="Название статьи"></textarea></p> 
        <p><textarea  style="height: 373px; min-width: 1090px;" rows="2" cols="50" id="article" name="article" placeholder="Введите статью" required oninput="countCharacters()"></textarea></p> 
        <p id="counter">2000/2000</p>
        <p><input type="text" size="50" id="email" name="email" placeholder="Ваша почта" required></p>
        <p><input class="input_butt" type="submit" value="Добавить отзыв"></p>
    </form>
</body>
</html>
