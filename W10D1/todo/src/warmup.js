
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
    let pString = '<p>' + string + '</p>';
    htmlElement.innerHTML = pString;
};

htmlGenerator('Party Time.', partyHeader);