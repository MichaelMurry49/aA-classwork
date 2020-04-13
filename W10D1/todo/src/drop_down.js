
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

export const dogLinkCreator = () => {
  let dogLinks = [];
  for (let k in dogs) {
    // dogLinks.push(`<li class='dog-link'> <a href='${dogs[k]}'>${k}</a></li>`);
    let tag = document.createElement("a");
    let liTag = document.createElement("LI");
    liTag.classList.add("dog-link");
    tag.innerHTML = k;
    tag.setAttribute("href", `${dogs[k]}`)
    liTag.append(tag);
    // liTag.innerHTML = 'Hello';
    dogLinks.push(liTag);
  }
  return dogLinks;
}

export const attachDogLinks = () => {
  let dogLinks = dogLinkCreator();
  let ul = document.querySelector("ul.drop-down-dog-list");
  for (let k of dogLinks) {
    ul.append(k);
  }
  return ul;
}

export const handleEnter = () => {
  let ul = attachDogLinks();
  // ul.removeClass("drop-down-dog-list");
  // ul.style.display = "none";
  let nav = document.querySelector("nav");
  nav.addEventListener("mouseenter", e => {
    ul.classList.add("show");
  }) 
}

export const handleLeave = () => {
  let ul = attachDogLinks();
  // ul.removeClass("drop-down-dog-list");
  // ul.style.display = "none";
  // let h3 = document.querySelector("nav.drop-down-dog-nav h3");
  let nav = document.querySelector("nav");
  
  nav.addEventListener("mouseleave", e => {
    ul.classList.remove("show");
  }) 
}


handleEnter();
handleLeave();
