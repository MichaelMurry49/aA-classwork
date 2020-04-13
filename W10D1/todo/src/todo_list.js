let todos = [];
let ul = document.querySelector(".todos");
let form = document.querySelector(".add-todo-form");


class ToDo{
    constructor(name, done){
        this.name = name;
        this.done = done;
    }
    
}

const addTodo = () => {
        let inputField = document.getElementsByName("add-todo")[0];
        // let inputField = querySelecter("name[add-todo]")
        console.log(inputField)
        let toDoObj = new ToDo(inputField.value, false);
        todos.push(toDoObj);
        inputField.value = "";
        // localStorage.setItem('todo',toDoObj.name);
          
        populateList(todos);
        
}

const populateList = (todos) => {
    // addTodo();
    // todos.map(el => {
        let el = todos[todos.length -1]
        let label = document.createElement("label");
        let checkbox = document.createElement("input");
        checkbox.setAttribute("type", "checkbox");
        let li = document.createElement("li");
        label.innerHTML = el.name;
        li.append(label);
        li.append(checkbox);
        ul.append(li);
    // });
}

const createToDo = () => {
    let button = document.querySelectorAll("input")[1];
    button.addEventListener("click", e => {
        addTodo();
    }) 
}

createToDo();