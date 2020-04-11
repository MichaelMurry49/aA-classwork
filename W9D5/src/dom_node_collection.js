class DOMNodeCollection {
    constructor($elements) {
        this.$elements = $elements;
    }

    html(arg) {
        if (arg === undefined) {
            return this.$elements[0].innerHTML
        } else {
            this.$elements.forEach(ele => {
                ele.innerHTML = arg      
            });
        }
    }

    empty() {
        this.$elements.forEach(el => {
            el.innerHTML = "";
        })
    }

    append(arg) {
        if (arg instanceof HTMLElement) { 
            this.$elements.forEach(el => {
                el.innerHTML += arg.innerHTML
            });
        } else if (typeof arg === 'string') {
            this.$elements.forEach(el => {
                el.innerHTML += arg;
            });
        }
    }

    attr() { 
        let arr = Array.from(arguments)
       if (arguments.length === 1) {
            this.$elements[0].getAttribute(arguments[0])
       } else if (arguments.length === 2) {

       }
    }
}

module.exports = DOMNodeCollection;

/* <span>Hello</span>
<div></div>
<div></div>
<div></div>
$("div").html("<span class='red'>Hello <b>Again</b></span>"); */