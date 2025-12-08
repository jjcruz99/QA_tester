describe('pagina principal', () => { 

    // Ejecuta esto antes de cada prueba 
    // para evitar repetir código
    beforeEach(() => {
        cy.visit('http://localhost:5173/');
    });

    it('validar que disponga inicio de sesión', () => { 
            cy.contains('Iniciar Sesión')
    });

    it('Validar que disponga del boton opcion A', () => { 
            cy.get('a.btn').contains('opción A')
    });

});