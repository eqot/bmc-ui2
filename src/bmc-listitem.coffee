Polymer 'bmc-listitem',

  domReady: ->
    @$.remove.addEventListener 'click', @destroy.bind(@)

  destroy: (event) ->
    @.remove()

  setLabel: (text) ->
    @$.label.innerText = text
