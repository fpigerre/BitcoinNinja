masterChecked = true
apprenticeChecked = false

# jQuery $(document).ready()
$ ->
  master = $('#master')
  apprentice = $('#apprentice')

  apprentice.on 'click', (event) =>
    apprentice.css 'background-color': '#F7931A'
    apprentice.css 'color': 'white'

    master.css 'background-color': '#E7E7E7'
    master.css 'color': 'gray'

    document.getElementById('account_type').value = 'apprentice'
    apprenticeChecked = true

  master.on 'click', (event) =>
    master.css 'background-color': '#F7931A'
    master.css 'color': 'white'

    apprentice.css 'background-color': '#E7E7E7'
    apprentice.css 'color': 'gray'

    document.getElementById('account_type').value = 'master'
    masterChecked = truemaster