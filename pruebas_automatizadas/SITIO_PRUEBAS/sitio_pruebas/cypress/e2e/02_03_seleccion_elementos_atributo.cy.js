describe('pagina principal', () => { 

    it('inspecciona una imagen por su id', () => { 
            cy.visit('http://localhost:5173/');
            cy.get('#imagen01');
    });

    it('inspecciona una imagen por su alt', () => { 
            cy.visit('http://localhost:5173/');
            cy.get('[alt="imagen opción 1"]');
    });
});