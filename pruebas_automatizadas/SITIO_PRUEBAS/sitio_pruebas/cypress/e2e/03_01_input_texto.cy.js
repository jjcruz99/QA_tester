describe('formulario de registro', () => { 

    beforeEach(()=> { 
        cy.visit('http://localhost:5173');// Asegura que cada prueba comience en la página de registro
        cy.get('[href="/register"]').click(); // Navega a la página de registro
    });

    it('debe mostrar error si el nombre es menor a 3 caracteres', () => { 
        cy.get('#name').type('Al'); // Ingresa un nombre con menos de 3 caracteres seleccionado por id
        cy.get('form').submit(); // Envía el formulario
        cy.get('.text-danger') // Selecciona el mensaje de error
            .should('exist')
            .and('be.visible')
            .and('contain.text', 'El nombre debe tener al menos 3 caracteres');
    });

    it('no debe generar error con un nombre válido', () => {
        cy.get('input[name="name"]').type('Alejandro Ramírez'); // Ingresa un nombre válido seleccionado por atributo name
        cy.get('form').submit(); // Envía el formulario
        cy.get('#root > div > form > div:nth-child(1) > div') // Selecciona el mensaje de error solo para el campo nombre con un selector específico
            .should('not.exist'); // Asegura que no exista ningún mensaje de error
    });

    it('debe mostrar error si las contraseñas no coinciden', () => {
        cy.get('input[name="password"]').type('password123'); // Ingresa la contraseña);
        cy.get('input[name="confirmPassword"]').type('password124'); // Ingresa una confirmación de contraseña diferente
        cy.get('form').submit(); // Envía el formulario
        cy.get('#root > div > form > div:nth-child(5) > div') // Selecciona el mensaje de error solo para el campo de confirmación de contraseña con un selector específico
            .should('exist')
            .and('be.visible')
            .and('contain.text', 'Las contraseñas no coinciden');
    });

    it('validar un registro exitoso', () => { 
        cy.get('input[name="name"]').type('Alejandro Ramírez'); // Ingresa un nombre válido
        cy.get('input[name="email"]').type('alejo@email.com'); // Ingresa un email válido
        cy.get('input[name="phone"]').type('555-2233'); // Ingresa un teléfono válido
        cy.get('input[name="password"]').type('password123'); // Ingresa la contraseña
        cy.get('input[name="confirmPassword"]').type('password123'); // Ingresa la misma contraseña en confirmación

        cy.get('form').submit(); // Envía el formulario

        cy.contains('Gracias por registrarte') // Selecciona el mensaje de éxito
            .should('be.visible') // Asegura que el mensaje sea visible
            .and('contain.text','alejo@email.com'); // Asegura que el mensaje contenga el email ingresado
    });

    it('validar que se envien los datos y metodo correcto', () => { 

        const customTimeout = 20000; // Define un tiempo de espera personalizado de 10 segundos

        //validar que se haya enviado la solicitud con los datos y metodo correcto
        cy.intercept('POST', '/api/registro', (req) => { 
            expect(req.body).to.include({ 
                name: 'Alejandro Ramírez',
                email: 'alejo@email.com',
                phone: '555-2233',
                password: 'password123',
                confirmPassword: 'password123'
            });
        }).as('postRegister');// Asigna un alias a la intercepción
                
        cy.get('input[name="name"]').type('Alejandro Ramírez'); // Ingresa un nombre válido
        cy.get('input[name="email"]').type('alejo@email.com'); // Ingresa un email válido
        cy.get('input[name="phone"]').type('555-2233'); // Ingresa un teléfono válido
        cy.get('input[name="password"]').type('password123'); // Ingresa la contraseña
        cy.get('input[name="confirmPassword"]').type('password123'); // Ingresa la misma contraseña en confirmación

        cy.get('form').submit(); // Envía el formulario

        // Espera a que la solicitud interceptada se complete con 404
        // cy.wait('@postRegister').then(({response}) => { 
        //     expect(response.statusCode).to.equal(404); // Asegura que la respuesta tenga el código de estado 404
        // });

        cy.wait('@postRegister').its('response.statusCode').should('eq', 404);

        // cy.wait('@postRegister', { timeout: customTimeout }).then(({ response }) => { 
        //         expect(response.statusCode).to.equal(404); 
        // });  

    });     


});