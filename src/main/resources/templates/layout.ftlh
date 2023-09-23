<#macro layout>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"
              name="viewport">
        <meta content="ie=edge" http-equiv="X-UA-Compatible">
        <title>Http server Index page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
              integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
              crossorigin="anonymous">
        <link href="/static/style.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                crossorigin="anonymous"></script>
        <script src="/static/js/localStorage.js"></script>
        <meta name="_csrf_header" content="${_csrf.headerName}"/>
        <meta name="_csrf_token" content="${_csrf.token}"/>
    </head>

    <body style="background-color: #9de2ff;">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="/">Главное</a>
        <#--        <div class="collapse navbar-collapse" id="navbarSupportedContent">-->
        <#--            <ul class="navbar-nav mr-auto">-->
        <#--                <li class="nav-item active">-->
        <#--                    <a href="/vacancies/pages/0" class="nav-link"> <span-->
        <#--                                class="sr-only">(current)</span></a>-->
        <#--                </li>-->
        <#--            </ul>-->
        <#--        </div>-->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <#--            <#assign-->
            <#--            known = SPRING_SECURITY_CONTEXT??-->
            <#--            >-->
            <#--            <#if known>-->
            <#--                <#assign authentication = SPRING_SECURITY_CONTEXT.authentication>-->
            <#--                <#if authentication.isAuthenticated()>-->
            <#--                    <#list authentication.authorities as authority>-->
            <#--                        <#if authority == "employer">-->
            <#--                            <ul class="navbar-nav mr-auto">-->
            <#--                                <li class="nav-item active">-->
            <#--                                    <a href="/resume_list/0/salaryLevel"-->
            <#--                                       class="nav-link"><@spring.message 'navbar.navi.resumes'/> <span class="sr-only">(current)</span></a>-->
            <#--                                </li>-->
            <#--                            </ul>-->
            <#--                        </#if>-->
            <#--                    </#list>-->
            <#--                </#if>-->
            <#--            </#if>-->
            <#--&lt;#&ndash;            <#if springMacroRequestContext.getRequestUri()?matches("/vacancies" + ".*")>&ndash;&gt;-->
            <#--&lt;#&ndash;                <form class="form-inline my-2 my-lg-0" id="searching">&ndash;&gt;-->
            <#--&lt;#&ndash;                    <div class="form-group mr-1">&ndash;&gt;-->
            <#--&lt;#&ndash;                        <label for="rating" class="text-light mr-1"><@spring.message 'nav.navi.category'/></label>&ndash;&gt;-->
            <#--&lt;#&ndash;                        <select class="form-control" id="rating" name="category">&ndash;&gt;-->
            <#--&lt;#&ndash;                            <option label="All">0</option>&ndash;&gt;-->
            <#--&lt;#&ndash;                            <option label="IT">1</option>&ndash;&gt;-->
            <#--&lt;#&ndash;                            <option label="Driver">2</option>&ndash;&gt;-->
            <#--&lt;#&ndash;                            <option label="building">3</option>&ndash;&gt;-->
            <#--&lt;#&ndash;                        </select>&ndash;&gt;-->
            <#--&lt;#&ndash;                    </div>&ndash;&gt;-->
            <#--&lt;#&ndash;                    <div class="form-group mr-1">&ndash;&gt;-->
            <#--&lt;#&ndash;                        <label for="rating" class="text-light mr-1"><@spring.message 'nav.navi.sort'/></label>&ndash;&gt;-->
            <#--&lt;#&ndash;                        <select class="form-control" id="sort" name="sort">&ndash;&gt;-->
            <#--&lt;#&ndash;                            <option label="По окладу">salary</option>&ndash;&gt;-->
            <#--&lt;#&ndash;                            <option label="По опыту работы">expFrom</option>&ndash;&gt;-->
            <#--&lt;#&ndash;                            <option label="По дате">createdDate</option>&ndash;&gt;-->

            <#--&lt;#&ndash;                        </select>&ndash;&gt;-->
            <#--&lt;#&ndash;                    </div>&ndash;&gt;-->
            <#--&lt;#&ndash;                    <input name="name" class="form-control mr-sm-2" type="search" placeholder="Search"&ndash;&gt;-->
            <#--&lt;#&ndash;                           aria-label="Search" id="searchElement">&ndash;&gt;-->
            <#--&lt;#&ndash;                    <button class="btn btn-outline-success my-2 my-sm-0"&ndash;&gt;-->
            <#--&lt;#&ndash;                            type="submit"><@spring.message 'nav.navi.search'/></button>&ndash;&gt;-->
            <#--&lt;#&ndash;                </form>&ndash;&gt;-->
            <#--&lt;#&ndash;            </#if>&ndash;&gt;-->

            <#--            <#if springMacroRequestContext.getRequestUri()?matches("/resume_list" + ".*") >-->
            <#--                <form class="form-inline my-2 my-lg-0" id="sortingResumes">-->
            <#--                    <div class="form-group mr-1">-->
            <#--                        <label for="rating" class="text-light mr-1"><@spring.message 'nav.navi.sort'/></label>-->
            <#--                        <select class="form-control" id="sort" name="sort">-->
            <#--                            <option label="По окладу">salaryLevel</option>-->
            <#--                            <option label="По дате">createdDate</option>-->
            <#--                        </select>-->
            <#--                    </div>-->
            <#--                    <button class="btn btn-outline-success my-2 my-sm-0"-->
            <#--                            type="submit"><@spring.message 'nav.navi.sort'/></button>-->
            <#--                </form>-->
            <#--            </#if>-->


        </div>
        <#assign
        known = SPRING_SECURITY_CONTEXT??
        >

        <#if known>
            <#assign
            user = SPRING_SECURITY_CONTEXT.authentication.principal
            name = user.getUsername()
            >
            <a href="/sign_profile" class="text-light m-2 m-sm-0">Здравствуйте, ${name}!</a>
            <a href="/logout" class="btn btn btn-outline-light m-2"
               id="logout">Выход</a>
        <#else>
            <a href="/sign_in" class="btn btn btn-outline-light m-2">Вход</a>
            <a href="/sign_up" class="btn btn btn-outline-light m-2">Регистрация</a>
        </#if>


    </nav>
    <i class="m-5"></i>
    <div class="container w-100">
        <#nested>
    </div>
    </body>
    </html>
</#macro>