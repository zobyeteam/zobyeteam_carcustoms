const app = Vue.createApp({
    data() {
        return {
            swiper: null,
            chameleonSwiper: null,
            paymentSwiper: null,
            shopListSwiper: null,

            playerName: null,
            sellerName: null,

            display: false,
            totalListDisplay: false,
            loadingShopDisplay: false,
            loadingCustomsDisplay: false,
            route: '',
            purchaseDisplay: false,
            colorCustomDisplay: false,
            colorCustomTypeDisplay: false,
            exitPopupConfirmDisplay: false,

            menuLabel: null,

            mainMenuBoxXAxis: 0,

            parentName: null,
            ownName: null,

            currentModIndex: null,
            ownedModIndex: null,

            paymentMethod: 'money',
            bankCharge: 0,
            jobDiscount: 0,

            selectedMod: {
                name: 'Engine1',
                label: 'ENGINE 1',
                price: 0,
            },

            keys: {
                OpenCustom: 'E',
                ApplyCustom: 'E',
                OpenShop: 'E',
                CancelUsedItem: 'X',
                ResetCamera: 'R',
                ToggleNuiFocus: 'G',
            },

            vehicleName: 'MODEL X',
            vehiclePlate: 'AAA 000',
            vehicleStatus: {
                acceleration: 4.0,
                maxSpeed: 3.6,
                breaks: 1.0,
                power: 4.5,
            },

            accounts: {
                money: 0,
                bank: 0,
            },

            primaryColor: '#e66465',
            secondaryColor: '#f6b73c',
            neonColor: '#f6b73c',
            tyreColor: '#f6b73c',
            xenonColor: '#f6b73c',
            wheelColor: '#f6b73c',
            interiorColor: '#f6b73c',
            pearlescentColor: '#f6b73c',

            customColor: '#E66465',

            menus: [],
            modList: [
                {
                    label: 'ABC',
                    price: 1000
                },
                {
                    label: 'ABC',
                    price: 1000
                },
                {
                    label: 'ABC',
                    price: 1000
                },
            ],
            modLength: 0,
            customizing: [
                {
                    label: 'ABC',
                    price: 1000
                },
                {
                    label: 'ABC',
                    price: 1000
                },
                {
                    label: 'ABC',
                    price: 1000
                },
            ],
            shouldShowModList: false,
            shopMenus: [],
            currentShopMenu: '',

            mainShopMenuName: null,
            subShopMenuName: null,

            selectedItem: {
                name: null,
                label: null,
                price: 0
            },

            tweenedTotalPrice: 0,
            tweenedPrice: 0,

            customColorModType: null,

            stancer: {
                suspensionHeight: 0,
                wheelWidth: 0,
                wheelSize: 0,
                wheelsOffset: 0,
                wheelsYRotation: 0,
            },
            stancerRange: {
                suspensionHeight: [-0.3, 0.3],
                wheelsOffset: [0.6, 1.05],
                wheelsYRotation: [-0.3, 0.3],
                wheelWidth: [0.25, 0.9],
                wheelSize: [0.5, 0.9],
            },
            stancerPrice: 0,

            chameleonList: [],
            currentVehicleColorType: 'primary',
            colorCustom: {
                primary: '#00FFFF',
                secondary: '#00FFFF',
                chameleon: '#000000',
            },

            colorPrimaryType: 0,
            colorSecondaryType: 0,
            currentDropdownColorType: 'classic',

            chameleonIndex: null,

            percentage: 0,
            currentInterval: null
        }
    },
    methods: {
        enterMenu(event, targetMenuName, modIndex, label, price) {
            this.mainMenuBoxXAxis = event.target.getBoundingClientRect().left;

            if (price || price == 0) {
                this.selectMod(targetMenuName || this.ownName || this.parentName, label, price)
            }

            if (this.parentName && (this.parentName == this.ownName || this.parentName == targetMenuName)) return;

            // Read why have this condition in file config.lua
            navigator.sendBeacon('https://zobyeteam_carcustoms/enterMenu', JSON.stringify({
                parentName: this.parentName,
                ownName: this.ownName,
                modIndex,
                targetMenuName
            }));
        },
        selectMod(name, label, price) {
            if (!price && price != 0) return;

            this.selectedMod = {
                name: name,
                label: label,
                price: price,
            }
        },
        removeMod(modType) {
            navigator.sendBeacon('https://zobyeteam_carcustoms/removeMod', JSON.stringify({
                modType,
                ownName: this.ownName,
            }));
        },
        backMenu() {
            this.selectedMod = {};
            this.purchaseDisplay = false;

            navigator.sendBeacon('https://zobyeteam_carcustoms/enterMenu', JSON.stringify({
                targetMenuName: this.parentName,
                parentName: this.parentName,
                isModMenu: this.shouldShowModList
            }))
        },
        purchase(modIndex) { // mod
            if (this.loadingCustomsDisplay) return;
            this.loadingCounter();

            this.loadingCustomsDisplay = true;
            this.purchaseDisplay = false;

            setTimeout(() => {
                this.loadingCustomsDisplay = false;
                this.totalListDisplay = false;

                const payType = ['money', 'bank'][this.paymentSwiper.activeIndex]

                navigator.sendBeacon('https://zobyeteam_carcustoms/purchase', JSON.stringify({
                    parentName: this.parentName,
                    ownName: this.ownName,
                    payType: payType,
                    // modIndex,
                }))


            }, 2000);
        },
        resetCamera() {
            if (!this.currentModIndex && this.currentModIndex != 0) return;

            navigator.sendBeacon('https://zobyeteam_carcustoms/resetCamera', JSON.stringify({
                parentName: this.parentName,
                ownName: this.ownName,
            }))
        },
        closeDisplay() {
            navigator.sendBeacon('https://zobyeteam_carcustoms/closeDisplay', JSON.stringify({
                route: app.route
            }))
        },
        buyItem() {
            if (!this.selectedItem.name) return;

            navigator.sendBeacon('https://zobyeteam_carcustoms/purchaseItem', JSON.stringify({
                shopMenu: this.currentShopMenu,
                itemName: this.selectedItem.name
            }))
        },
        applyCustomModColor() {
            navigator.sendBeacon('https://zobyeteam_carcustoms/applyCustomModColor', JSON.stringify({
                modType: this.customColorModType,
                color: hexToRgb(this.customColor)
            }));

            this.closeDisplay();
        },
        purchaseStancer() {
            navigator.sendBeacon('https://zobyeteam_carcustoms/purchaseStancer', JSON.stringify({
                suspensionHeight: this.stancer.suspensionHeight,
                wheelsOffset: this.stancer.wheelsOffset,
                wheelsYRotation: this.stancer.wheelsYRotation,
                wheelWidth: this.stancer.wheelWidth,
                wheelSize: this.stancer.wheelSize,
            }));
        },
        resetStancer() {
            navigator.sendBeacon('https://zobyeteam_carcustoms/resetStancer', JSON.stringify({}));
        },
        updateColors() {
            Coloris({
                el: '.coloris',
                theme: 'polaroid',
                alpha: false,
                focusInput: false,
            });
        },
        updateSwiper() {
            // this.swiper.params.slidesPerView = this.ownName ? 6 : 7;
            this.swiper.params.centerInsufficientSlides = !this.ownName;
            this.swiper.update();
        },
        nextSlide() {
            this.paymentSwiper.slideNext();
        },
        prevSlide() {
            this.paymentSwiper.slidePrev();
        },
        nextShopListSlide() {
            this.shopListSwiper.slideNext();
        },
        prevShopListSlide() {
            this.shopListSwiper.slidePrev();
        },
        selectShopMenu(name) {
            this.currentShopMenu = name;
            this.route = 'customShop';
            this.selectedItem = {
                name: null,
                label: null,
                price: null,
            }
        },
        selectItem(item) {
            this.selectedItem = {
                name: item.name,
                label: item.label,
                price: item.price,
            }
        },
        loadingCounter() {
            this.percentage = 0;
            const scaledDuration = (1450 / 100);

            this.currentInterval = setInterval(() => {
                if (this.percentage < 100) {
                    this.percentage++;
                } else {
                    clearInterval(this.currentInterval);
                }
            }, scaledDuration);
        },
    },
    computed: {
        shopItems() {
            let shop = this.shopMenus ? this.shopMenus.find((item) => item.name == this.currentShopMenu) : []
            return shop ? shop.items : []
        },
        totalPrice() {
            return Number(this.tweenedTotalPrice.toFixed(0)).toLocaleString('en-Us');
        },
        selectedItemPrice() {
            return Number(this.tweenedPrice.toFixed(0)).toLocaleString('en-Us')
        }
    },
    watch: {
        customizing(newValue) {
            // Do it about tweened total Price
            if (!newValue) return 0;
            let totalPrice = newValue.reduce((currentPrice, newData) => currentPrice + (newData?.price || 0), 0);

            gsap.to(this.$data, { duration: 1, tweenedTotalPrice: totalPrice })
        },
        selectedItem(newValue) {
            gsap.to(this.$data, { duration: 1, tweenedPrice: newValue.price })
        },
        primaryColor(value) {
            if (!this.display) return;
            navigator.sendBeacon('https://zobyeteam_carcustoms/updateCustomsColor', JSON.stringify({
                primary: hexToRgb(value),
                ownName: this.ownName
            }));
        },
        secondaryColor(value) {
            if (!this.display) return;
            navigator.sendBeacon('https://zobyeteam_carcustoms/updateCustomsColor', JSON.stringify({
                secondary: hexToRgb(value),
                ownName: this.ownName
            }));
        },
        neonColor(value) {
            if (!this.display) return;
            navigator.sendBeacon('https://zobyeteam_carcustoms/updateCustomsColor', JSON.stringify({
                neonColor: hexToRgb(value),
                ownName: this.ownName
            }));
        },
        xenonColor(value) {
            if (!this.display) return;
            navigator.sendBeacon('https://zobyeteam_carcustoms/updateCustomsColor', JSON.stringify({
                xenonColor: hexToRgb(value),
                ownName: this.ownName
            }));
        },
        tyreColor(value) {
            if (!this.display) return;
            navigator.sendBeacon('https://zobyeteam_carcustoms/updateCustomsColor', JSON.stringify({
                tyreColor: hexToRgb(value),
                ownName: this.ownName
            }));
        },
        wheelColor(value) {
            if (!this.display) return;
            navigator.sendBeacon('https://zobyeteam_carcustoms/updateCustomsColor', JSON.stringify({
                wheelColor: hexToRgb(value),
                ownName: this.ownName
            }));
        },
        interiorColor(value) {
            if (!this.display) return;
            navigator.sendBeacon('https://zobyeteam_carcustoms/updateCustomsColor', JSON.stringify({
                interiorColor: hexToRgb(value),
                ownName: this.ownName
            }));
        },
        pearlescentColor(value) {
            if (!this.display) return;
            navigator.sendBeacon('https://zobyeteam_carcustoms/updateCustomsColor', JSON.stringify({
                pearlescentColor: hexToRgb(value),
                ownName: this.ownName
            }));
        },
        'colorCustom.primary': function (value) {
            if (!this.display) return;
            if (this.justLoaded) return;
            navigator.sendBeacon('https://zobyeteam_carcustoms/updateCustomsColor', JSON.stringify({
                primary: hexToRgb(value)
            }));
        },
        'colorCustom.secondary': function (value) {
            if (!this.display) return;
            if (this.justLoaded) return;
            navigator.sendBeacon('https://zobyeteam_carcustoms/updateCustomsColor', JSON.stringify({
                secondary: hexToRgb(value)
            }));
        },
        'stancer.suspensionHeight': function (value) {
            navigator.sendBeacon('https://zobyeteam_carcustoms/updateStancerData', JSON.stringify({
                suspensionHeight: Number(value)
            }));
        },
        'stancer.wheelsOffset': function (value) {
            navigator.sendBeacon('https://zobyeteam_carcustoms/updateStancerData', JSON.stringify({
                wheelsOffset: Number(value)
            }));
        },
        'stancer.wheelsYRotation': function (value) {
            navigator.sendBeacon('https://zobyeteam_carcustoms/updateStancerData', JSON.stringify({
                wheelsYRotation: Number(value)
            }));
        },
        'stancer.wheelWidth': function (value) {
            navigator.sendBeacon('https://zobyeteam_carcustoms/updateStancerData', JSON.stringify({
                wheelWidth: Number(value),
            }));
        },
        'stancer.wheelSize': function (value) {
            navigator.sendBeacon('https://zobyeteam_carcustoms/updateStancerData', JSON.stringify({
                wheelSize: Number(value)
            }));
        },
    },
    mounted() {
        this.swiper = new Swiper("#mainSwiper", {
            setWrapperSize: true,
            forceToAxis: true,
            slidesPerView: 4,
            spaceBetween: 14,
            centerInsufficientSlides: false,
            keyboard: {
                enabled: true,
            },
            pagination: {
                el: ".swiper-slide",
                clickable: true,
            },
        });

        this.chameleonSwiper = new Swiper("#chameleonSwiper", {
            setWrapperSize: true,
            forceToAxis: true,
            slidesPerView: 7,
            spaceBetween: 16,
            keyboard: {
                enabled: true,
            },
            pagination: {
                el: ".swiper-slide",
                clickable: true,
            },
        });

        this.paymentSwiper = new Swiper("#paymentSwiper", {
            setWrapperSize: true,
            forceToAxis: true,
            slidesPerView: 1,
            spaceBetween: 16,
            loop: true,
            centerInsufficientSlides: true,
            keyboard: {
                enabled: true,
            },
            pagination: {
                el: ".swiper-slide",
                clickable: true,
            },
        });

        this.shopListSwiper = new Swiper("#shopListSwiper", {
            setWrapperSize: true,
            forceToAxis: true,
            slidesPerView: 5,
            spaceBetween: 0,
            centerInsufficientSlides: true,
            keyboard: {
                enabled: true,
            },
            pagination: {
                el: ".swiper-slide",
                clickable: true,
            },
        });
    },
    components: {
        ['main-icon-gradient-component']: MainIconGradientComponent,
        ['seleted-mod-icon']: SelectedModIcon
    }
}).mount('.wrapper');

function hexToRgb(hexColor) {
    hexColor = hexColor.replace("#", "");

    const r = parseInt(hexColor.substring(0, 2), 16);
    const g = parseInt(hexColor.substring(2, 4), 16);
    const b = parseInt(hexColor.substring(4, 6), 16);

    return [r, g, b];
}

function rgbToHex(r, g, b) {
    if ((!r && r != 0) || (!g && g != 0) || (!b && b != 0)) return '#FFFFFF';

    let hexR = r.toString(16);
    let hexG = g.toString(16);
    let hexB = b.toString(16);

    if (hexR.length == 1) { hexR = '0' + hexR }
    if (hexG.length == 1) { hexG = '0' + hexG }
    if (hexB.length == 1) { hexB = '0' + hexB }

    return `#${hexR}${hexG}${hexB}`
}

window.addEventListener('message', ({ data }) => {
    if (data.action === 'loadData') {
        app.justLoaded = true;
        setTimeout(() => {
            app.justLoaded = false;
        }, 200);
        if (data.type === 'custom') {
            app.shouldShowModList = data.isMod;
            if (data.isMod) {
                app.modList = data.menus;
                app.modLength = data.menus.length;
                if (app.ownName != data.ownName) {
                    app.swiper.slideTo(0, 0);
                }
            } else {
                app.modList = [];
                app.menus = data.menus;
            }
            app.parentName = data.parentName;
            app.ownName = data.ownName;
            app.currentModIndex = data.currentModIndex;
            app.ownedModIndex = data.ownedModIndex;
            app.bankCharge = data.bankCharge;
            app.jobDiscount = data.jobDiscount;
            app.menuLabel = data.menuLabel;
            app.keys = data.keys;

            app.vehicleName = data.vehicleName;
            app.vehiclePlate = data.vehiclePlate;
            app.vehicleStatus = data.vehicleStatus;

            app.accounts = data.accounts;
            app.playerName = data.playerName;
            app.sellerName = data.sellerName;

            if (data.vehicleColor) {
                // app.primaryColor = data.vehicleColor.primary ? rgbToHex(...data.vehicleColor.primary) : app.primaryColor;
                // app.secondaryColor = data.vehicleColor.secondary ? rgbToHex(...data.vehicleColor.secondary) : app.secondaryColor;
                // app.xenonColor = data.vehicleColor.xenonColor ? rgbToHex(...data.vehicleColor.xenonColor) : app.xenonColor;
                // app.neonColor = data.vehicleColor.neonColor ? rgbToHex(...data.vehicleColor.neonColor) : app.neonColor;
                // app.tyreColor = data.vehicleColor.tyreColor ? rgbToHex(...data.vehicleColor.tyreColor) : app.tyreColor;
                // app.wheelColor = data.vehicleColor.wheelColor ? rgbToHex(...data.vehicleColor.wheelColor) : app.wheelColor;

                app.primaryColor = rgbToHex(...data.vehicleColor.primary);
                app.secondaryColor = rgbToHex(...data.vehicleColor.secondary);
                app.xenonColor = rgbToHex(...data.vehicleColor.xenonColor);
                app.neonColor = rgbToHex(...data.vehicleColor.neonColor);
                app.tyreColor = rgbToHex(...data.vehicleColor.tyreColor);
                app.wheelColor = rgbToHex(...data.vehicleColor.wheelColor);
                app.interiorColor = rgbToHex(...data.vehicleColor.interiorColor);
                app.pearlescentColor = rgbToHex(...data.vehicleColor.pearlescentColor);
            }

            if ((data.currentModIndex || data.currentModIndex == 0)) {
                let modData;
                if (typeof data.currentModIndex == 'number' && data.ownName != 'WheelColor' && data.ownName != 'PearlescentColor' && data.ownName != 'InteriorColor') {
                    if (data.ownName == 'ColorChameleon') {
                        let index = data.currentModIndex >= 161 ? data.currentModIndex - 161 : 0
                        modData = data.menus[index];
                    } else {
                        modData = data.menus[data.currentModIndex + 1];
                    }
                } else {
                    modData = data.menus[0];
                }
                app.selectMod(modData && modData.name || data.ownName || data.parentName, modData && modData.label, modData && modData.price);
            }
        } else if (data.type === 'shop') {
            app.shopMenus = data.shopMenus;
            app.itemImagePath = data.itemImagePath;
            app.mainShopMenuName = data.mainShopMenuName;
            app.subShopMenuName = data.subShopMenuName;
            app.accounts = data.accounts;

            if (data.shopMenus[0]) {
                app.currentShopMenu = data.shopMenus[0].name;
            }
        } else if (data.type === 'customColor') {
            app.customColor = data.color ? rgbToHex(...data.color) : app.customColor;
            app.customColorModType = data.modType;
        } else if (data.type === 'stancer') {
            app.stancer = data.stancer;
            app.stancerRange = data.stancerRange;
            app.stancerPrice = data.price;
            app.accounts = data.accounts;
        } else if (data.type === 'colorCustom') {
            // app.currentVehicleColorType = 'primary';
            app.colorCustom.primary = data.primary ? rgbToHex(...data.primary) : app.colorCustom.primary;
            app.colorCustom.secondary = data.secondary ? rgbToHex(...data.secondary) : app.colorCustom.secondary;
            app.chameleonList = data.chameleonList;
            app.colorPrimaryType = data.colorPrimaryType;
            app.colorSecondaryType = data.colorSecondaryType;

            if (data.colorPrimaryType == 120) {
                app.currentDropdownColorType = 'chrome';
            } else if (data.colorPrimaryType == 0) {
                app.currentDropdownColorType = 'classic';
            } else if (data.colorPrimaryType == 12) {
                app.currentDropdownColorType = 'matte';
            } else if (data.colorPrimaryType == 117) {
                app.currentDropdownColorType = 'metals';
            }
        } else if (data.type === 'customizingList') {
            app.customizing = data.customizing;
        }

    } else if (data.action === 'resetCamera') {
        app.resetCamera();
    } else if (data.action === 'openDisplay') {
        app.route = data.route;
        app.display = true;
    }
    else if (data.action === 'closeDisplay') {
        app.display = false;
        app.currentModIndex = null;
        app.paymentMethod = 'money';
        app.selectedMod = {};
        app.purchaseDisplay = false;
        app.totalListDisplay = false;

        app.ownName = null;
        app.parentName = null;

        app.customizing = [];

        app.colorCustomDisplay = null;
        app.colorCustomTypeDisplay = null;

        app.currentVehicleColorType = 'primary';

        app.selectedItem = {
            name: null,
            label: null,
            price: 0
        }
    }
});

window.addEventListener('keydown', ({ key }) => {
    if (key === 'Escape' || key === 'Backspace') {
        if (app.loadingCustomsDisplay) return;
        if (app.loadingShopDisplay) return;
        if (app.route == 'customColor') return;
        if (!app.parentName && !app.ownName) {
            if (app.customizing[0] && app.route == 'custom') {
                app.exitPopupConfirmDisplay = true;
            } else {
                app.closeDisplay();
            }
        }
        app.backMenu();
    }
});
