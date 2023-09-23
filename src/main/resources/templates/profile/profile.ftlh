<#import "../layout.ftlh" as main>
<@main.layout>
<section class="vh-100">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-md-9 col-lg-8 col-xl-6">
                <div class="card" style="border-radius: 15px;">
                    <div class="card-body p-4">
                        <div class="d-flex text-black">
                            <div class="flex-shrink-0">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-profiles/avatar-1.webp"
                                     alt="Generic placeholder image" class="img-fluid mr-2"
                                     style="width: 180px; border-radius: 10px;">
                            </div>
                            <div class="flex-grow-1 ms-3">
                                    <#assign
                                    user = SPRING_SECURITY_CONTEXT.authentication.principal
                                    name = user.getUsername()
                                    >
                                    <h5 class="mb-1">${name}</h5>
                                <div class="d-flex justify-content-start rounded-3 p-2 mb-2"
                                     style="background-color: #efefef;">
                                    <div>
                                        <p class="small text-muted mb-1">Количество транзакций</p>
                                        <p class="mb-0">0</p>
                                        <p class="small text-muted mb-1">Ваш баланс:</p>
                                        <p class="mb-0" id="balance"></p>
                                    </div>

                                </div>
                                <div class="d-flex pt-1">
                                    <button type="button" class="btn btn-primary flex-grow-1 ml-1" data-bs-toggle="modal"
                                            data-bs-target="#exampleModal">Произвести транзакцию</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
    <div class="container">
        <div class="row">
            <div class="col-12 mb-3 mb-lg-5">
                <div class="position-relative card table-nowrap table-card">
                    <div class="card-header align-items-center">
                        <h5 class="mb-0">Transactions Journal</h5>
                    </div>
                    <div class="table-responsive">
                        <table class="table mb-0">
                            <thead class="small text-uppercase bg-body text-muted">
                            <tr>
                                <th>Sender</th>
                                <th>Date</th>
                                <th>Recipient</th>
                                <th>Amount</th>
                                <th>Status</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list users.transactionList as transaction>
                            <tr class="align-middle">
                                <td>
                                    ${transaction.sender.name}
                                </td>
                                <td>${transaction.createdDate.dayOfMonth}-${transaction.createdDate.month}-${transaction.createdDate.year}</td>
                                <td>${transaction.recipient.name}</td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <span><i class="fa fa-arrow-up" aria-hidden="true"></i></span>
                                        <span>${transaction.sum}</span>
                                    </div>
                                </td>
                                <td>
                                    <span class="badge fs-6 fw-normal bg-tint-success text-success">Completed</span>
                                </td>
                            </tr>
                            </#list>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer text-end">
                        <a href="#!" class="btn btn-gray">View All Transactions</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal" tabindex="-1" id="exampleModal" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Тип транзакции</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="modalBody">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" id="exchange">Перевод денег контрагенту</button>
                    <button type="button" class="btn btn-secondary" id="payment">Оплата услуг</button>                </div>
            </div>
        </div>
    </div>
    <script>
        const csrfHeader = document.querySelector('meta[name="_csrf_header"]').getAttribute('content');
        const csrfToken = document.querySelector('meta[name="_csrf_token"]').getAttribute('content');
        document.getElementById("exchange").addEventListener("click",function ()
        {
            createPaymentForm()
        })
        document.getElementById("payment").addEventListener("click",function ()
        {
            createService()
        })

        setInterval(function ()
        {
            let params = new URLSearchParams({
                id: readUser().username
            })
            let response = fetch("/getUserById?" + params.toString()).then(response => response.json()).then(json => changeBalance(json))
        },10000)

        function createPaymentForm()
        {
            document.getElementById("modalBody").innerHTML = ""
            // Создаем элемент section
            const section = document.createElement('section');
            section.classList.add('gradient-custom');

// Создаем элемент container
            const container = document.createElement('div');
            container.classList.add('container-fluid');

// Создаем элемент row
            const row = document.createElement('div');
            row.classList.add('row', 'd-flex', 'justify-content-center');

// Создаем элемент col-md-7
            const colMd7 = document.createElement('div');
            colMd7.classList.add('col-12');

// Создаем элемент card
            const card = document.createElement('div');
            card.classList.add('card');
            card.style.borderRadius = '15px';

// Создаем элемент card-body
            const cardBody = document.createElement('div');
            cardBody.classList.add('card-body', 'p-4');

// Создаем элемент form
            const form = document.createElement('form');

// Создаем элемент для ввода имени владельца карты
            const cardHolderInput = document.createElement('input');
            cardHolderInput.setAttribute('type', 'text');
            cardHolderInput.id = 'typeName';
            cardHolderInput.classList.add('form-control', 'form-control-lg');
            cardHolderInput.setAttribute('size', '17');
            cardHolderInput.placeholder = "1234 5678 9012 3457";

// Создаем метку для ввода имени владельца карты
            const cardHolderLabel = document.createElement('label');
            cardHolderLabel.classList.add('form-label');
            cardHolderLabel.setAttribute('for', 'typeName');
            cardHolderLabel.textContent = "Введите номер получателя";

// Добавляем имя владельца и метку в div с классом form-outline
            const cardHolderDiv = document.createElement('div');
            cardHolderDiv.classList.add('form-outline');
            cardHolderDiv.appendChild(cardHolderInput);
            cardHolderDiv.appendChild(cardHolderLabel);

// Создаем элемент для ввода срока действия карты
            const expirationInput = document.createElement('input');
            expirationInput.setAttribute('type', 'text');
            expirationInput.id = 'balance';
            expirationInput.classList.add('form-control', 'form-control-lg');
            expirationInput.placeholder = 'Сумма перевода';

// Создаем метку для ввода срока действия карты
            const expirationLabel = document.createElement('label');
            expirationLabel.classList.add('form-label');
            expirationLabel.setAttribute('for', 'typeExp');
            expirationLabel.textContent = 'Expiration';




// Создаем кнопку
            const button = document.createElement('button');
            button.setAttribute('type', 'button');
            button.classList.add('btn', 'btn-info', 'btn-lg', 'btn-rounded','mt-2');
            button.textContent = 'Перевести'

            button.addEventListener("click",function ()
            {
                let params = new URLSearchParams({
                    recipient: cardHolderInput.value,
                    sender: readUser().username,
                    sum: expirationInput.value
                })
                const requestOptions = {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                        [csrfHeader]: csrfToken,
                    },
                    body: params.toString(),
                };

                let transact = fetch("/transaction" ,requestOptions)
            .then(response => {
                if (response.status === 200) {
                } else {
                }
            }).catch(error => {
                });
            })

// Создаем иконку для кнопки
            const icon = document.createElement('i');
            icon.classList.add('fas', 'fa-arrow-right');

// Добавляем иконку в кнопку
            button.appendChild(icon);

// Добавляем все созданные элементы в DOM
            form.appendChild(cardHolderDiv);
            form.appendChild(expirationInput);
            form.appendChild(button);
            cardBody.appendChild(form);
            card.appendChild(cardBody);
            colMd7.appendChild(card);
            row.appendChild(colMd7);
            container.appendChild(row);
            section.appendChild(container);

// Добавляем созданный section в body
            document.getElementById("modalBody").appendChild(section);


        }

        function changeBalance(user)
        {
            console.log(user)
            document.getElementById("balance").innerText = user.balance
        }

        function createService()
        {
            document.getElementById("modalBody").innerHTML = ""
            // Находим элемент, к которому хотим добавить форму (замените 'elementId' на реальный идентификатор элемента)
            var targetElement = document.getElementById("modalBody");

// Создаем новый элемент формы
            var formElement = document.createElement('form');
            formElement.className = 'mb-5';

// Создаем дочерние элементы формы
            var divFormGroup = document.createElement('div');
            divFormGroup.className = 'form-group';

            var labelElement = document.createElement('label');
            labelElement.setAttribute('for', 'rating');
            labelElement.textContent = 'Услуги';

            var selectElement = document.createElement('select');
            selectElement.className = 'form-control';
            selectElement.id = 'type';
            selectElement.name = 'type';

            var option1 = document.createElement('option');
            option1.textContent = 'Megacom';

            var option2 = document.createElement('option');
            option2.textContent = 'O';

            var option3 = document.createElement('option');
            option3.textContent = 'Aknet';

            var option4 = document.createElement('option');
            option4.textContent = 'Jet';

            var inputElement = document.createElement('input');
            inputElement.type = 'number';
            inputElement.name = 'sum';
            inputElement.className = 'form-control';
            inputElement.placeholder = 'Сумма';

            var buttonElement = document.createElement('button');
            buttonElement.type = 'submit';
            buttonElement.className = 'btn btn-success';
            buttonElement.classList.add("mt-2")

            buttonElement.textContent = 'Оплатить';
            buttonElement.addEventListener("click",function ()
            {
                let params = new URLSearchParams({
                    sum: inputElement.value,
                    companyName: selectElement.value,
                    userCode: readUser().username
                })
                const requestOption = {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                        [csrfHeader]: csrfToken,
                    },
                    body: params.toString(),
                };
                let response = fetch("/servicePayment",requestOption)
                window.location.href = '/sign_profile';

            })

// Добавляем созданные элементы в иерархию
            selectElement.appendChild(option1);
            selectElement.appendChild(option2);
            selectElement.appendChild(option3);
            selectElement.appendChild(option4);

            divFormGroup.appendChild(labelElement);
            divFormGroup.appendChild(selectElement);

            formElement.appendChild(divFormGroup);
            formElement.appendChild(inputElement);
            formElement.appendChild(buttonElement);

// Добавляем форму к целевому элементу
            targetElement.appendChild(formElement);

        }

    </script>
</@main.layout>