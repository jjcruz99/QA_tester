describe("Pagina principal", () => { 

    beforeEach(() => {
        cy.visit('http://localhost:5173/');
    });

    it('examina el menu de navegacion', () => { 
        cy.get('.navbar')
            .should('exist')
            .and('be.visible');
    });

    it('inspecciona una imagen por su id', () => { 
            cy.get('#imagen01')
                .should('have.attr', 'alt', 'imagen opción 1');
    });

    it('validar que disponga inicio de sesión', () => { 
            cy.contains('Iniciar Sesión')
                .should('have.attr', 'href')
                .and('include', '/login');
    });

    it('Validar que disponga del boton opcion A', () => { 
            cy.get('a.btn').contains('opción A')
                .should('exist')
                .and('be.visible')
                .and('have.class', 'btn btn-primary')
                .and('not.have.class', 'card-title'); // Asegura que no tiene la clase 'card-title'
    });

});