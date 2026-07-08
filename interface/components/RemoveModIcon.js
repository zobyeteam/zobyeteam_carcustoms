class removeModIcon extends HTMLElement {
    constructor() {
        super();
    }

    connectedCallback() {
        this.innerHTML = `
        <svg
            class="w-0 group-hover:w-[1.2vw] invisible group-hover:visible opacity-0 group-hover:opacity-100 duration-100 cursor-pointer"
            viewBox="0 0 23 23" fill="none" xmlns="http://www.w3.org/2000/svg">
            <circle cx="11.5" cy="11.5" r="11.5" fill="#E31937" />
            <rect x="18" y="13" width="13" height="3" transform="rotate(180 18 13)"
                fill="white" />
        </svg>
        `
    }
}

customElements.define('removemod-icon', removeModIcon)