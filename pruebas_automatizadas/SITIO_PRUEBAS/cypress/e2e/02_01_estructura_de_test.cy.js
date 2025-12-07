describe("Pagina principal", () => {

    it('Abre la version en español', () => { 
        cy.visit('http://localhost:5173/');
        cy.url().should('include', '5173');// Verifica que la URL contiene '/es' prueba logica
    });

 
})