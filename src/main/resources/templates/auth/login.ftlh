<#import "../layout.ftlh" as main>

<@main.layout>
    <form action="/sign_in" class="mb-5" method="post" id="login-form">
        <div class="form-outline mb-4">
            <input type="text" name="username" class="form-control"/>
            <label class="form-label" for="form2Example1">Ваш код</label>
        </div>
        <div class="form-outline mb-4">
            <input type="password" name="password" id="form2Example2" class="form-control"/>
            <label class="form-label" for="form2Example2">Пароль</label>
        </div>
        <#if _csrf??>
            <input type="hidden" name="${(_csrf.parameterName)!'csrf-param-name'}"
                   value="${(_csrf.token)!'csrf-token'}"/>
        </#if>
        <button type="submit" class="btn btn-primary btn-block mb-4">Войти</button>
    </form>
<#--    <a href="/forgot_password">Forgot password?</a>-->
    <script>
        document.getElementById('login-form').addEventListener('submit', onLoginHandler)
        let user = {};

        function onLoginHandler(event) {
            let form = event.target;
            let userFormData = new FormData(form)
            user = Object.fromEntries(userFormData)
            saveUser(user);

        }
    </script>
</@main.layout>