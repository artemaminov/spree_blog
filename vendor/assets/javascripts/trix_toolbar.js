Trix.config.textAttributes.heading = { tagName: "h4", inheritable: false };
Trix.config.textAttributes.sub = { tagName: "sub", inheritable: true };
Trix.config.textAttributes.sub = { tagName: "sub", inheritable: true };

addEventListener("trix-initialize", function(event) {
    let buttonHTML, buttonHTMLHeading, buttonGroup;

    buttonHTML  = '<button type="button" class="trix-button" data-trix-attribute="sup" title="Sup"><sup>SUP</sup></button>';
    buttonHTML += '<button type="button" class="trix-button"data-trix-attribute="sub" title="Sub"><sub>SUB</sub></button>';
    buttonHTMLHeading  = '<button type="button" class="trix-button"data-trix-attribute="heading" title="Heading">H</button>';

    buttonGroup = event.target.toolbarElement.querySelector(".trix-button-group--text-tools");
    buttonGroup.insertAdjacentHTML("beforeend", buttonHTML);
    buttonGroup.insertAdjacentHTML("afterbegin", buttonHTMLHeading)
});

// addEventListener("trix-initialize", function(event) {
//     var element = event.target
//     var editor = element.editor
//     var toolbarElement = element.toolbarElement
//     var groupElement = toolbarElement.querySelector(".button_group.text_tools")
//
//     groupElement.insertAdjacentHTML("beforeend", '<button type="button" data-trix-attribute="sup"><sup>SUP</sup></button>')
//     groupElement.insertAdjacentHTML("beforeend",'<button type="button" data-trix-attribute="sub"><sub>SUB</sub></button>')
//
//     var selectedAttributes = new Set
//     function updateSelectedAttributes() {
//         selectedAttributes = new Set
//
//         var selectedRange = editor.getSelectedRange()
//         if (selectedRange[0] === selectedRange[1]) { selectedRange[1]++ }
//
//         var selectedPieces = editor.getDocument().getDocumentAtRange(selectedRange).getPieces()
//         selectedPieces.forEach(function(piece) {
//             Object.keys(piece.getAttributes()).forEach(function(attribute) {
//                 selectedAttributes.add(attribute)
//             })
//         })
//     }
//
//     function enforceExclusiveAttributes() {
//         if (editor.attributeIsActive("sup") && selectedAttributes.has("sub")) {
//             editor.deactivateAttribute("sub")
//             updateSelectedAttributes()
//         } else if (editor.attributeIsActive("sub") && selectedAttributes.has("sup")) {
//             editor.deactivateAttribute("sup")
//             updateSelectedAttributes()
//         }
//     }
//
//     updateSelectedAttributes()
//     element.addEventListener("trix-selection-change", updateSelectedAttributes)
//     element.addEventListener("trix-change", enforceExclusiveAttributes)
// })