<#import "../layout.ftlh" as main>
<@main.layout>
    <form action="/sign_up" class="mb-5" method="post">
        <input id="username" type="text" name="name" class="form-control mt-1" placeholder="имя пользователя">
        <#if _csrf??>
            <input type="hidden" name="${(_csrf.parameterName)!'csrf-param-name'}"
                   value="${(_csrf.token)!'csrf-token'}"/>
        </#if>
        <input type="password" name="password" class="form-control mt-1" placeholder="Пароль">
        <button type="submit" class="btn btn-success mt-2">Регистрация</button>
    </form>

</@main.layout>