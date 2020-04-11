const DOMNODECollection = require('./dom_node_collection.js');

window.$l = function(arg) { 
    
        if (arg instanceof HTMLElement) {
            return new DOMNODECollection([arg]);
        } else if (typeof arg === 'string') {
            const elementList = document.querySelectorAll(arg);
            return new DOMNODECollection(Array.from(elementList))
        }

}

