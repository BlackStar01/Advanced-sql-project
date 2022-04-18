function createTable(data) {

    if(document.querySelector('table') == null)
    {
        console.log(document.querySelector('table'))
    }
    else
    {
        document.querySelector('table').remove()
    }

    const body = document.getElementById("main")
    const table = document.createElement('table');

    body.appendChild(table);

    const row = document.createElement('tr');
    table.appendChild(row)

    for (let element in data[0]) {
        console.log(element)
        const colummnhead = document.createElement('th');
        colummnhead.textContent = element
        row.appendChild(colummnhead)
    }

    for (let element of data) {
        const row = document.createElement('tr');
        table.appendChild(row)

        for (let item in element) {
            const colummn = document.createElement('td');
            colummn.textContent = element[item]
            row.appendChild(colummn)
        }
    }


}
