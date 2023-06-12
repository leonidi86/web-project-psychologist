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
        var input = document.getElementById("phone");
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
        <p><input type="text" size="50" id="nickname" name="nickname" placeholder="Ваше имя" required></p>

        <p style="position: relative;">
            <textarea rows="2" id="review" name="review" placeholder="Описание (максимальное кол-во символов 300)"
                required oninput="countCharacters()"
                style="min-width: 281px; max-width: 281px; width: 100%; min-height: 187px; max-height: 267px; height: 187px;"></textarea>
            <span id="counter" style="position: absolute; bottom: 5px; right: 870px;">300/300</span>
        </p>

        <p><input type="text" size="50" id="phone" name="phone" placeholder="Ваш номер телефона" required></p>
        <p><input type="text" size="50" id="email" name="email" placeholder="Ваша почта" required></p>

        <div class="rating-area">
            <input type="radio" id="star-5" name="rating" value="5">
            <label for="star-5" title="Оценка «5»"></label>
            <input type="radio" id="star-4" name="rating" value="4">
            <label for="star-4" title="Оценка «4»"></label>
            <input type="radio" id="star-3" name="rating" value="3">
            <label for="star-3" title="Оценка «3»"></label>
            <input type="radio" id="star-2" name="rating" value="2">
            <label for="star-2" title="Оценка «2»"></label>
            <input type="radio" id="star-1" name="rating" value="1">
            <label for="star-1" title="Оценка «1»"></label>
        </div>
        <p><input type="submit" class="button4" value="Добавить отзыв" style="margin: 10px 0;"></p>
    </form>

    <h2>Все отзывы:</h2>
    <list2>
        <ul class="review-list">
        % for review in reviews:
        <li><strong style="font-weight: bold;">{{ review['nickname'] }}</strong><br>
        Дата: {{ review['timestamp'] }}<br>
        Оценка: {{ review['rating'] }}<br>
        Описание: {{ review['review'] }}</li>
        <!-- Список всех отзывов -->
        % end
         </ul>
    </list2>
    
    <style>
        .review-list li {
            word-wrap: break-word;
            max-width: 400px;
        }
    </style>
            
</body>

</html>