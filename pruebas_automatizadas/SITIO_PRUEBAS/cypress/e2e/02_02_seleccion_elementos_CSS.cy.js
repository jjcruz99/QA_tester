describe("Pagina principal", () => {

    it('examina el menu de navegacion', () => { 
        cy.visit('http://localhost:5173/');
        cy.get('.navbar')
    });
})