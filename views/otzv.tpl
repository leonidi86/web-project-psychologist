%from datetime import datetime
% rebase('layout.tpl', title='Отзывы', year=datetime.now().year)
<!DOCTYPE html>
<html>
<head>
<script>
    function validateForm() {
        var phonePattern = /^\d{10}$/; // Паттерн для номера телефона (10 цифр)
        var emailPattern = /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/; // Паттерн для адреса электронной почты
        var nickname = document.forms["reviewForm"]["nickname"].value;
        var review = document.forms["reviewForm"]["review"].value;
        var phone = document.forms["reviewForm"]["phone"].value;
        var email = document.forms["reviewForm"]["email"].value;
        var textarea = document.getElementById("description");

        if (textarea.value.length > 300) {
            alert("The description should not exceed 300 characters.");
            return false;
        }

        if (nickname === "" || review === "" || phone === "" || email === "") {
            alert("Please fill in all fields.");
            return false;
        }

        if (!phonePattern.test(phone)) {
            alert("Please enter a valid phone number.");
            return false;
        }

        if (!emailPattern.test(email)) {
            alert("Please enter a valid email address.");
            return false;
        }
    }
    function countCharacters() {
        var textarea = document.getElementById("review");
        var counter = document.getElementById("counter");
        var remaining = 300 - textarea.value.length;

        if (remaining < 0) {
            textarea.value = textarea.value.substr(0, 300);
            remaining = 0;
        }
        counter.innerHTML = remaining + "/300";
    }
</script>
</head>
<body>
<br>
    <h2>Оставить отзыв:</h2>
    <form name="reviewForm" method="POST" action="/otzv">
            <p><input type="text" size="50" id="nickname" name="nickname" placeholder="Ваше имя" required></input></p>
                <p><textarea rows="2" cols="50" id="review" name="review" placeholder="Описание" required oninput="countCharacters()"></textarea></p> 
        <p id="counter">300/300</p>
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