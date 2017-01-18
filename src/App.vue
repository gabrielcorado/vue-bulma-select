<template>
  <div class="hero is-primary is-fullheight" id="app">
    <div class="hero-head">
      <header class="nav">
        <div class="container">
          <div class="nav-center">
            <div class="nav-item">
              <h1 class="title is-marginless">Vue Bulma Select</h1>
              <h2 class="title is-6">Select components using Bulma as CSS framework</h2>
            </div>
          </div>
        </div>
      </header>
    </div>

    <div class="hero-body">
      <div class="container">
        <h2 class="title">Examples</h2>
        <sample
          title="Simple Select"
          desc="Just a replace to the regular <select>">
          <template slot="result">
            <bulma-select
              label="name"
              placeholder="Select your team"
              :options="options">
            </bulma-select>
          </template>

<template slot="source">&lt;bulma-select
  label="name"
  placeholder="Select your team"
  v-model="selection"
  :options="options"&gt;
&lt;/bulma-select&gt;</template>
        </sample>

        <sample
          title="Select with search"
          desc="Type to search in the options">
          <template slot="result">
            <bulma-select
              label="name"
              placeholder="Select your team"
              @type="search"
              :search="true"
              :options="searched">
            </bulma-select>
          </template>

<template slot="source">&lt;bulma-select
  label="name"
  placeholder="Select your team"
  v-model="selection"
  @type="search"
  :search="true"
  :options="options"&gt;
&lt;/bulma-select&gt;</template>
        </sample>

        <h2 class="title">Documentation</h2>
        <div class="sample__container">
          <h3 class="title is-4">&lt;bulma-select&gt;</h3>
          <h4 class="title is-6">Properties</h4>
          <table class="table">
            <thead>
              <tr>
                <th>Name</th>
                <th>Type</th>
                <th>Description</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>v-model</td>
                <td>Any</td>
                <td>Value selected.</td>
              </tr>
              <tr>
                <td>placeholder</td>
                <td>String</td>
                <td>Text that will be used as placeholder in the select.</td>
              </tr>
              <tr>
                <td>options</td>
                <td>Array[Any]</td>
                <td>Select options.</td>
              </tr>
              <tr>
                <td>label</td>
                <td>String</td>
                <td>If an Array of objects is passed as options, label is the object key that will be displayed.</td>
              </tr>
              <tr>
                <td>search</td>
                <td>Boolean</td>
                <td>If it has search or not.</td>
              </tr>
              <tr>
                <td>maxItems</td>
                <td>Number</td>
                <td>The max number of options that will be displayed.</td>
              </tr>
            </tbody>
          </table>

          <h4 class="title is-6">Events</h4>
          <table class="table">
            <thead>
              <tr>
                <th>Name</th>
                <th>Description</th>
                <th>Params</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>type</td>
                <td>When the search field recive input.</td>
                <td><strong>text: String</strong> - the text inputed</td>
              </tr>
            </tbody>
          </table>

          <h4 class="title is-6">Slots</h4>
          <table class="table">
            <thead>
              <tr>
                <th>Name</th>
                <th>Description</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>no-results</td>
                <td>When there is no options its displayed on the options container.</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <div class="hero-foot">
      <div class="container">
        <div class="has-text-centered is-fullwidth">
          Built by <a href="https://github.com/gabrielcorado">@gabrielcorado</a>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
// Load Components
import BulmaSelect from './components/bulma/Select'
import Sample from './site/Sample'

// Teams
import teams from './site/teams'

// Export main component
export default {
  name: 'app',
  components: {
    BulmaSelect,
    Sample
  },
  data () {
    // Nfl teams
    return {
      selection: undefined,
      options: teams,
      searched: Object.assign([], teams)
    }
  },
  methods: {
    //
    search (text) {
      //
      let down = text.toLowerCase()

      //
      this.searched = this.options.filter((i) => i.name.toLowerCase().includes(down))
    }
  }
}
</script>

<style lang="sass">
@import "~bulma"

.title, .nav-item
  display: block

.hero-foot
  padding: 10px 0
</style>
