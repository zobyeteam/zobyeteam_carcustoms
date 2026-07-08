class PowerIcon extends HTMLElement {
    constructor() {
        super();
    }

    connectedCallback() {
        this.innerHTML = `
        <svg class="w-[1.822916666666667vw]" viewBox="0 0 35 35" fill="none"
            xmlns="http://www.w3.org/2000/svg">
            <rect width="35" height="35" transform="translate(0 0.00195312)" fill="white" />
            <path d="M14.625 6L6 18H14.625L8.875 30L29 15H17.5L26.125 6H14.625Z" fill="#2D2D2D" />
        </svg>
        `
    }
}

customElements.define('power-icon', PowerIcon)