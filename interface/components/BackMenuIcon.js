class BackMenuIcon extends HTMLElement {
    constructor() {
        super();
    }

    connectedCallback() {
        this.innerHTML = `
        <svg class="w-[0.7291666666666667vw]" viewBox="0 0 14 22" fill="none"
            xmlns="http://www.w3.org/2000/svg">
            <path
                d="M5.09025 11L14 19.5559L11.4549 22L-4.80825e-07 11L11.4549 -5.00708e-07L14 2.44406L5.09025 11Z"
                fill="#00A3FF" />
        </svg>
        `
    }
}

customElements.define('backmenu-icon', BackMenuIcon)