function makeGrid(rows, cols){
    const container = document.getElementById('container');

    container.style.grid(rows)
    container.style.gridTemplateColumns = "repeat(16,1fr)"

}

 
makeGrid(15,15)