import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["topSpacer", "bottomSpacer", "mainNav", "mainFooter", "bodyHeight"]

    connect() {
        this.adjustSpacing();
        window.addEventListener('resize', () => this.adjustSpacing());
    }

    adjustSpacing() {
        let navHeight = this.mainNavTarget ? this.mainNavTarget.offsetHeight : 0;
        let footerHeight = this.mainFooterTarget ? this.mainFooterTarget.offsetHeight : 0;
        let totalHeight = navHeight + footerHeight;

        if (this.hasTopSpacerTarget) {
            this.topSpacerTarget.style.height = `${navHeight}px`;
        }
        if (this.hasBottomSpacerTarget) {
            this.bottomSpacerTarget.style.minHeight = `${footerHeight}px`;
        }

        // this.bodyHeightTarget.style.height = `calc(100vh - ${totalHeight}px)`;
    }
}
