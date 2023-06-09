%from datetime import datetime
% rebase('layout.tpl', title='Отзывы', year=datetime.now().year)
<!DOCTYPE html>
<html>
<head>
<script>
    function validateForm() {
        var emailPattern = /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/; // Паттерн для адреса электронной почты
        var nickname = document.forms["articleForm"]["nickname"].value;
        var name = document.forms["articleForm"]["name"].value;
        var article = document.forms["articleForm"]["article"].value;
        var phone = document.forms["articleForm"]["phone"].value;
        var email = document.forms["articleForm"]["email"].value;
        var textarea = document.getElementById("description");

        if (textarea.value.length > 1000) {
            alert("The description should not exceed 300 characters.");
            return false;
        }

        if (nickname === "" || article === "" || name === "" || email === "") {
            alert("Please fill in all fields.");
            return false;
        }

        if (!emailPattern.test(email)) {
            alert("Please enter a valid email address.");
            return false;
        }
    }
    function countCharacters() {
        var textarea = document.getElementById("article");
        var counter = document.getElementById("counter");
        var remaining = 1000 - textarea.value.length;

        if (remaining < 0) {
            textarea.value = textarea.value.substr(0, 1000);
            remaining = 0;
        }
        counter.innerHTML = remaining + "/1000";
    }
</script>
</head>
<body>
<br>

  <h2>Полезные статьи:</h2>
    <ul>
        % for article in articles:
           <li><strong>{{ article['nickname'] }}: {{ article['name'] }}: {{ article['article'] }}: {{ article['timestamp'] }}</strong></li>
         % end
    </ul>

    <h2>Оставить полезную статью:</h2>
    <form name="articleForm" method="POST" action="/articles">
            <p><input type="text" size="50" id="nickname" name="nickname" placeholder="Ваше имя" required></input></p>
             <p><textarea rows="2" cols="50" id="name" name="name" placeholder="Название статьи"></textarea></p> 
                <p><textarea rows="2" cols="50" id="article" name="article" placeholder="Введите статью" required oninput="countCharacters()"></textarea></p> 
        <p id="counter">1000/1000</p>
        <p><input type="text" size="50" id="email" name="email" placeholder="Ваша почта" required></input></p>
        <p><input class="btn btn-default" type="submit" value="Добавить отзыв"></p>
    </form>

      

</body>
</html>