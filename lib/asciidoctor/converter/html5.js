// Stub for the HTML5 converter — not yet converted from Ruby.
// Prevents ERR_MODULE_NOT_FOUND when the DefaultFactory lazily loads this module.
import { ConverterBase } from '../converter.js'

export default class Html5Converter extends ConverterBase {
  constructor (backend, opts = {}) {
    super(backend, opts)
  }
}
