<template>
  <div id="app">
    <h1>Vue Bulma Select</h1>
    <div>
      <bulma-select
        label="name"
        placeholder="Select your president"
        v-model="selection"
        :options="options">
      </bulma-select>
    </div>
    <input v-model="selection">
  </div>
</template>

<script>
// Load Components
import BulmaSelect from './components/bulma/Select'

// Export main component
export default {
  name: 'app',
  components: {
    BulmaSelect
  },
  data () {
    return {
      selection: undefined,
      options: [
        {id: 1, name: 'George'},
        {id: 2, name: 'Barack'},
        {id: 3, name: 'Donald'}
      ]
    }
  }
}
</script>

<style>
</style>
