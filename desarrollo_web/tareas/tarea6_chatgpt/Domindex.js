const mousePositionElement = document.getElementById("mousePosition");

document.addEventListener("mousemove", function(event) {
    const mouseX = event.clientX;
    const mouseY = event.clientY;
    mousePositionElement.textContent = "Posición del mouse: " + mouseX + ", " + mouseY;
});


const form = document.getElementById("form1");
const fnameInput = document.getElementById("form-fname");
const lnameInput = document.getElementById("form-lname");
const submitButton = document.getElementById("form1-submit");

submitButton.addEventListener("click", function(event) {
    event.preventDefault(); // Evita que se realice el envío del formulario por defecto

    const fname = fnameInput.value;
    const lname = lnameInput.value;
    const fullName = fname + " " + lname;

    const fullNameElement = document.createElement("p");
    fullNameElement.textContent = "Nombre completo: " + fullName;

    form.appendChild(fullNameElement);
});

const table = document.getElementById("sampleTable");
    const insertRowButton = document.getElementById("btn-insert-r");
    const insertColumnButton = document.getElementById("btn-insert-c");

    insertRowButton.addEventListener("click", function() {
        //Agregar una fila por cada columna existente
        const newRow = table.insertRow(); // Insertar una nueva fila en la tabla
        const columns = table.rows[0].cells.length; // Obtener el número de columnas de la primera fila
        for (let i = 0; i < columns; i++) {
            const newRowCell = newRow.insertCell(); // Insertar una nueva celda en la nueva fila
            newRowCell.textContent = "New row"; // Establecer el contenido de la nueva celda
        }
        
    });

    insertColumnButton.addEventListener("click", function() {
        const rows = table.rows; // Obtener todas las filas existentes en la tabla
        for (let i = 0; i < rows.length; i++) {
            const newColCell = rows[i].insertCell(); // Insertar una nueva celda en cada fila existente
            newColCell.textContent = "New column"; // Establecer el contenido de la nueva celda
        }
    });

    const tabla = document.getElementById("myTable");
    const changeButton = document.getElementById("btn-change");

    changeButton.addEventListener("click", function() {
        const rowIndex = parseInt(document.getElementById("rowIndex").value) - 1; // Restamos 1 para obtener el índice basado en 0
        const colIndex = parseInt(document.getElementById("colIndex").value) - 1; // Restamos 1 para obtener el índice basado en 0
        const newValue = document.getElementById("newValue").value;

        const cell = tabla.rows[rowIndex]?.cells[colIndex]; // Acceder a la celda de la tabla en la posición especificada

        if (cell) {
            cell.textContent = newValue;
        }
    });


    const colorSelect = document.getElementById("colorSelect");
    const addColorButton = document.getElementById("btn-add-color");
    const removeColorButton = document.getElementById("btn-rmv-color");

    addColorButton.addEventListener("click", function() {
        const colors = ["Blue", "Yellow", "Orange", "Purple"]; // Array de colores posibles
        const randomColor = colors[Math.floor(Math.random() * colors.length)]; // Seleccionar un color aleatorio

        const option = document.createElement("option"); // Crear un elemento <option>
        option.textContent = randomColor; // Establecer el texto del elemento <option>
        colorSelect.appendChild(option); // Agregar el elemento <option> al <select>
    });

    removeColorButton.addEventListener("click", function() {
        if (colorSelect.options.length > 0) {
            colorSelect.removeChild(colorSelect.lastElementChild); // Eliminar el último elemento <option> del <select>
        }
    });



    const imagenGato = document.getElementById("imagenGato");

    imagenGato.addEventListener("mouseenter", function() {
        const minWidth = 300;
        const maxWidth = 600;
        const minHeight = 300;
        const maxHeight = 600;

        const width = Math.floor(Math.random() * (maxWidth - minWidth + 1)) + minWidth;
        const height = Math.floor(Math.random() * (maxHeight - minHeight + 1)) + minHeight;

        const newSrc = `http://placekitten.com/${width}/${height}`;

        const newImage = new Image();
        newImage.src = newSrc;

        newImage.addEventListener("load", function() {
            imagenGato.src = newSrc;
        });
    });