Polymer 'bmc-ui',

  domReady: ->
    boxes = @$.base.querySelectorAll('.box')
    for box in boxes
      box.appendChild @createList()
      box.appendChild @createTextArea()

  createList: ->
    list = document.createElement 'ul'
    list.classList.add 'list'

    return list

  createListItem: (text) ->
    listItem = document.createElement 'li'
    listItem.classList.add 'list-item'
    listItem.innerText = text

    removeButton = document.createElement 'span'
    removeButton.classList.add 'remove-button'
    removeButton.innerHTML = '&times;'
    removeButton.addEventListener 'click', @removeListItem
    listItem.appendChild removeButton

    return listItem

  removeListItem: (event) ->
    listItem = event.target.parentElement
    listItem.remove()

  createTextArea: ->
    textArea = document.createElement 'textarea'
    textArea.classList.add 'textarea'
    textArea.addEventListener 'keydown', @onKeyDown.bind(@)

    return textArea

  onKeyDown: (event) ->
    if event.keyCode is 13    # Return key
      event.preventDefault()
      @addText event

  addText: (event) ->
    element = event.target
    list = element.previousSibling

    text = element.value
    if text.length > 0
      list.appendChild @createListItem text

    # Clear text area
    element.value = ''
