import { Controller } from 'stimulus'
import '../../stylesheets/static.scss'

export default class extends Controller {
  connect() {
    console.log('Hello, Stimulus again!', this.element)
  }
}
