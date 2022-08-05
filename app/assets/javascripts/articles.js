function getItemId(event) {
    return event.target.attributes['data-id'].value
}

function getRemoveUrl(id) {
    return `/articles/${id}`
}

function getCSRFToken() {
    return document.querySelector('meta[name="csrf-token"]').content
}

const CSRF_TOKEN_HEADER_KEY = 'X-CSRF-Token'


document.addEventListener('DOMContentLoaded', () => {
    document
        .querySelectorAll('button[data-action="remove"]')
        .forEach((button) => {
            console.log(button)
            button.addEventListener('click', async (event) => {
                const url = getRemoveUrl(getItemId(event));
                const responce = await fetch(url, {
                    method: 'delete',
                    headers: {
                        [CSRF_TOKEN_HEADER_KEY]: getCSRFToken()
                    }
                })
                if (responce.ok && responce.status < 400) {
                    document.location.reload();
                }
            })
        })
})