import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "./load_diagnosis_item.js"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require.context('../images', true)
