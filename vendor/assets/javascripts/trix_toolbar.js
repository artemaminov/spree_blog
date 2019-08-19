Trix.config.textAttributes.heading2 = { tagName: "h2", inheritable: true };
Trix.config.textAttributes.heading3 = { tagName: "h3", inheritable: true };
Trix.config.textAttributes.sup = { tagName: "sup", inheritable: true };
Trix.config.textAttributes.sub = { tagName: "sub", inheritable: true };

addEventListener("trix-initialize", function(event) {
    let element = event.target;
    let editor = element.editor;
    let toolbarElement = element.toolbarElement;
    let groupElement = toolbarElement.querySelector(".trix-button-group--block-tools");
    let headingElement = groupElement.querySelector(".trix-button--icon-heading-1");

    groupElement.insertAdjacentHTML("beforeend",'<button type="button" class="trix-button" data-trix-attribute="sup" title="Sup" tabindex="-1"><sup>SUP</sup></button>');
    groupElement.insertAdjacentHTML("beforeend",'<button type="button" class="trix-button" data-trix-attribute="sub" title="Sub" tabindex="-1"><sub>SUB</sub></button>');
    headingElement.insertAdjacentHTML("afterend",'<button type="button" class="trix-button" data-trix-attribute="heading3" title="Heading 3" tabindex="-1">H3</button>');
    headingElement.insertAdjacentHTML("afterend",'<button type="button" class="trix-button" data-trix-attribute="heading2" title="Heading 2" tabindex="-1">H2</button>');

    let selectedAttributes = new Set;
    function updateSelectedAttributes() {
        let selectedAttributes = new Set;
        let selectedRange = editor.getSelectedRange();
        if (selectedRange[0] === selectedRange[1]) { selectedRange[1]++ }

        let selectedPieces = editor.getDocument().getDocumentAtRange(selectedRange).getPieces();
        selectedPieces.forEach(function(piece) {
            Object.keys(piece.getAttributes()).forEach(function(attribute) {
                selectedAttributes.add(attribute);
            })
        });
    }

    function enforceExclusiveAttributes() {
        if (editor.attributeIsActive("sup") && selectedAttributes.has("sub")) {
            updateSelectedAttributes();
            editor.deactivateAttribute("sub");
        } else if (editor.attributeIsActive("sub") && selectedAttributes.has("sup")) {
            updateSelectedAttributes();
            editor.deactivateAttribute("sup");
        }
    }

    updateSelectedAttributes();
    element.addEventListener("trix-selection-change", updateSelectedAttributes);
    element.addEventListener("trix-change", enforceExclusiveAttributes);
});