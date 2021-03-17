const listDiv = document.querySelector('.list');
const addItemInput = document.querySelector('.addItemInput');
// const addItemButton = document.querySelector('button.addItemButton');
// const removeItemButton = document.querySelector('button.removeItemButton');

// addItemButton.addEventListener('click', () => {
//     let list = document.getElementById('categoryList');
//     let li = document.createElement('li');
//     li.textContent = addItemInput.value;
//     let appendedItem = list.appendChild(li);
//     addItemInput.value = '';
// });

// removeItemButton.addEventListener('click', () => {
//     let list = document.getElementById('categoryList');
//     let li = document.querySelector('li:last-child');
//     list.removeChild(li);
// });

listDiv.addEventListener('mouseover', (event) => {
    if (event.target.tagName == 'LI') {
        event.target.style.color = 'white';
    }
});

listDiv.addEventListener('mouseout', (event) => {
    if (event.target.tagName == 'LI') {
        event.target.style.color = 'black';
    }
});