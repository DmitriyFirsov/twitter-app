function getRemoveUrl(event) {
    return event.target.attributes['data-url'].value
}

const CSRF_TOKEN_HEADER_KEY = 'X-CSRF-Token';

function getCSRFToken() {
    return document.querySelector('meta[name="csrf-token"]').content
}

/**
 *
 * @param {Node | ChildNode} node
 * @return boolean
 */
function isHtmlElement(node) {
    return node.nodeType === Node.ELEMENT_NODE;
}

/**
 * @returns {HTMLElement[]}
 */
function findAllRemoveButtons() {
    const buf = [];
    document
        .querySelectorAll('button[data-action="remove"]')
        .forEach((node) => {
            if (isHtmlElement(node)) {
                buf.push(node)
            }
        })
    return buf;
}

function onDomLoaded(cb) {
    document.addEventListener('DOMContentLoaded', cb)
}

function reloadPage() {
    document.location.reload();
}

function isResponceSuccess(responce) {
    return responce.ok && responce.status < 400
}

async function removeHandler(event) {
    const url = getRemoveUrl(event);

    const responce = await fetch(url, {
        method: 'delete',
        headers: {
            [CSRF_TOKEN_HEADER_KEY]: getCSRFToken()
        }
    })

    if (isResponceSuccess(responce)) {
        reloadPage()
    }
}

onDomLoaded(() => {
    findAllRemoveButtons()
        .forEach((button) => {
            button.addEventListener('click', removeHandler)
        })
})
