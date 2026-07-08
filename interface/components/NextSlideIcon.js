class NextSlideIcon extends HTMLElement {
    constructor() {
        super();
    }

    connectedCallback() {
        this.innerHTML = `
        <svg class="w-[1.7291666666666667vw] cursor-pointer z-10"
            viewBox="0 0 30 22" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path
                d="M30.5 0.0449084L2.50011 0.0449125L13.5001 11.0007L2.50011 22.0003L30.5 22.0007L30.5 0.0449084Z"
                fill="url(#paint0_linear_417_1542)" />
            <path
                d="M8.90975 11L-8.46841e-07 19.5559L2.54513 22L14 11L2.54513 -5.00709e-07L-9.8857e-08 2.44406L8.90975 11Z"
                fill="#00A3FF" />
            <defs>
                <linearGradient id="paint0_linear_417_1542" x1="31" y1="11" x2="2" y2="11"
                    gradientUnits="userSpaceOnUse">
                    <stop offset="0.927535" stop-color="#00A3FF" stop-opacity="0" />
                    <stop offset="1" stop-color="#00A3FF" stop-opacity="0.6" />
                </linearGradient>
            </defs>
        </svg>
        `
    }
}

customElements.define('nextslide-icon', NextSlideIcon)