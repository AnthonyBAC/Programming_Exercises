const container = document.getElementById("container");

let mouseDown = false;
window.addEventListener('mousedown', () => {
  mouseDown = true;
});
window.addEventListener('mouseup', () => {
  mouseDown = false;
});
window.addEventListener('mouseleave', () => {
  mouseDown = false;
});

const grid_size_title = document.getElementById("grid_size_title");

function updateSizeDisplay(size) {
  grid_size_title.textContent = `Size: ${size} x ${size}`;
}

function createGrid(size) {
 
    container.innerHTML = "";
    const squares = 620 / size;

    updateSizeDisplay(size);

    for (let i = 0; i < size * size; i++) {
        const square = document.createElement('div');
        square.classList.add('grid-square');
        square.style.width = `${squares}px`;
        square.style.height = `${squares}px`;

        square.addEventListener('mouseover', () => {
            if (mouseDown) {
                square.style.backgroundColor = 'black';
            }
        });

        container.appendChild(square);
    }
}

createGrid(16);

const change_size = document.getElementById("change_size");
const reset = document.getElementById("reset");

change_size.addEventListener('click', () => {
    const size = prompt("Ingrese el tamaño del cuadrado");
    if (size < 1 || size > 100 || isNaN(size)) {
        alert("Por favor, ingrese un número entre 1 y 100");
    } else {
        updateSizeDisplay(size);
        createGrid(size);
    }
});

reset.addEventListener('click', () => {
    createGrid(16);
});