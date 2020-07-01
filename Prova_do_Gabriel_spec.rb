describe 'Prova do Gabriel', :gabriel do
    
    it 'cadastro com sucesso' do
    
    visit 'https://www.invertexto.com/gerador-email-temporario' #visita um gerador de email
    click_button 'copiar' #copia o email criado
    
    visit 'https://srbarriga.herokuapp.com/cadastro' #visita a página de cadastro
    
    find('input[name=nome]').set 'Tester' #encontra o campo de nome e o preenche
    sleep 1 #pausa para acompanhar o script
    
    email = find('input[id=email]') #encontra o campo de email e o preenche
    email.send_keys([:control, "v"]) #cola o email adquirido do gerador de emails
    sleep 1 #pausa para acompanhar o script

    find('input[name=senha]').set '123456' #encontra o campo de senha e o preenche
    sleep 1 #pausa para acompanhar o script
    
    click_button 'Cadastrar' #envia o formulário para o sistema
    
    expect(page).to have_content 'Usuário inserido com sucesso' #valida se o sistema cadastrou o usuário do jeito certo
    sleep 3
    
    email.send_keys([:control, "v"]) #cola o email adquirido do gerador de emails
    sleep 1 #pausa para acompanhar o script
    
    find('input[name=senha]').set '123456' #encontra o campo de senha e o preenche
    sleep 1 #pausa para acompanhar o script

    click_button 'Entrar'
    sleep 1 #pausa para acompanhar o script
    expect(page).to have_content 'Bem vindo, Tester!'

    visit 'https://srbarriga.herokuapp.com/addConta' #visita a pagina de cadastro de conta
    find('input[name=nome]').set 'Gabriel' #cria uma conta com o nome gabriel
        sleep 1 #acompanhar o script
        click_button 'Salvar' #salva a conta
    

    visit 'https://srbarriga.herokuapp.com/addConta' #visita a pagina de cadastro de conta
    find('input[name=nome]').set 'Rosma' #cria uma conta com o nome
        sleep 1 #acompanhar o script
        click_button 'Salvar' #salva a conta


    visit 'https://srbarriga.herokuapp.com/addConta' #visita a pagina de cadastro de conta
    find('input[name=nome]').set 'Gold Member' #cria uma conta com o nome
        sleep 1 #acompanhar o script
        click_button 'Salvar' #salva a conta


    visit 'https://srbarriga.herokuapp.com/addConta' #visita a pagina de cadastro de conta
    find('input[name=nome]').set 'User' #cria uma conta com o nome
        sleep 1 #acompanhar o script
        click_button 'Salvar' #salva a conta


    expect(page).to have_content 'Gabriel' #valida se a conta está na página
    expect(page).to have_content 'Rosma' #valida se a conta está na página
    expect(page).to have_content 'Gold Member' #valida se a conta está na página
    expect(page).to have_content 'User' #valida se a conta está na página

        visit 'https://srbarriga.herokuapp.com/movimentacao'
        
        tipo = find ('select[id=tipo]') #criando variavel de tipo despesa ou receita
        tipo.click
        select('Despesa', from: 'tipo')
        sleep 1 #acompanhar o script
        
        datamov = find ('input[id=data_transacao]') #criando variavel de tipo data do fato
        datamov.set '02/06/2020'
        sleep 1 #acompanhar o script

        datapag = find ('input[id=data_pagamento]') #criando variavel de tipo data de pagamento
        datapag.set '17/06/2020'
        sleep 1 #acompanhar o script

        descr = find ('input[id=descricao]') #criando variavel de tipo descricao
        descr.set 'Almoço do Gabriel'
        sleep 1 #acompanhar o script

        interes = find ('input[id=interessado]') #criando variavel de tipo interessado
        interes.set 'Auditeste'
        sleep 1 #acompanhar o script

        valorvar = find ('input[id=valor]') #criando variavel de tipo valor do fato
        valorvar.set '25'
        sleep 1 #acompanhar o script

        contaop = find ('select[id=conta]') #criando variavel de tipo pessoa que executou o fato
        contaop.click
        select('Gabriel', from: 'conta')
        sleep 1 #acompanhar o script

        pagamos = find ('input[id=status_pago]') #criando variavel de status pago
        naopagamos = find ('input[id=status_pendente]') #criando variavel de status nao pago
        pagamos.click
        sleep 1 #acompanhar o script

        click_button 'Salvar'


        visit 'https://srbarriga.herokuapp.com/movimentacao'
        tipo.click
        select('Despesa', from: 'tipo')
        datamov.set '02/06/2020'
        datapag.set '17/06/2020'
        descr.set 'Almoço do Rosma'
        interes.set 'Auditeste'
        valorvar.set '20'
        contaop.click
        select('Rosma', from: 'conta')
        pagamos.click
        sleep 1
        click_button 'Salvar'
        sleep 1

        visit 'https://srbarriga.herokuapp.com/movimentacao'
        tipo.click
        select('Receita', from: 'tipo')
        datamov.set '15/06/2020'
        datapag.set '25/06/2020'
        descr.set 'Recebimento do cliente'
        interes.set 'Auditeste'
        valorvar.set '250'
        contaop.click
        select('User', from: 'conta')
        pagamos.click
        sleep 1
        click_button 'Salvar'
        sleep 1
        
        visit 'https://srbarriga.herokuapp.com/movimentacao'
        tipo.click
        select('Receita', from: 'tipo')
        datamov.set '30/06/2020'
        datapag.set '30/07/2020'
        descr.set 'Pacote Gold'
        interes.set 'Auditeste'
        valorvar.set '2500'
        contaop.click
        select('Gold Member', from: 'conta')
        naopagamos.click
        sleep 1
        click_button 'Salvar'
        sleep 1

        visit 'https://srbarriga.herokuapp.com/extrato'
        sleep 2
        find ('select[id=mes]')
        select('Junho', from: 'mes')

        click_button 'Buscar'
        sleep 5



    end




end