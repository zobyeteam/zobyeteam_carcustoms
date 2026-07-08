class DragIcon extends HTMLElement {
    constructor() {
        super();
    }

    connectedCallback() {
        this.innerHTML = `
        <svg class="w-[0.7vw]" viewBox="0 0 15 15" fill="none"
            xmlns="http://www.w3.org/2000/svg">
            <mask id="mask0_576_892" style="mask-type:luminance" maskUnits="userSpaceOnUse"
                x="0" y="0" width="15" height="15">
                <path d="M7.85742 0.714844V3.57199" stroke="white" stroke-linecap="round"
                    stroke-linejoin="round" />
                <path fill-rule="evenodd" clip-rule="evenodd"
                    d="M7.14355 7.14453L14.2864 8.5731L12.1436 10.0017L14.2864 12.1445L12.1436 14.2874L10.0007 12.1445L8.57213 14.2874L7.14355 7.14453Z"
                    fill="white" stroke="white" stroke-linecap="round"
                    stroke-linejoin="round" />
                <path
                    d="M12.9084 2.80664L10.8881 4.827M2.80699 12.9081L4.82734 10.8877M0.714844 7.85736H3.57199M2.80699 2.80664L4.82734 4.827"
                    stroke="white" stroke-linecap="round" stroke-linejoin="round" />
            </mask>
            <g mask="url(#mask0_576_892)">
                <path d="M-0.714844 -0.714844H16.428V16.428H-0.714844V-0.714844Z"
                    fill="#2D2D2D" />
            </g>
        </svg>
        `
    }
}

customElements.define('drag-icon', DragIcon)