<template>
  <div :class="containerClasses" >
    <input
      ref="search"
      :class="placeholderClasses"
      :readonly="!search"
      :value="textSelected"
      :placeholder="placeholder"
      @blur="close"
      @click.self="toggleOpened">

    <transition name="slide-fade">
      <div v-if="opened" :class="optionsClasses">
        <button
          v-for="(option, i) in options"
          @click="selectOption(i)"
          :class="['button is-white', selected === i ? 'is-info' : '', 'bulma-select__option']">
          {{ label !== undefined ? option[label] : option }}
        </button>
      </div>
    </transition>
  </div>
</template>

<script>
// Export the component itself
export default {
  name: 'bulma-select',
  props: {
    // Select placeholder
    placeholder: {
      type: String,
      default: 'Select...'
    },
    // Options
    options: {
      type: Array,
      default: () => []
    },
    // Options label
    label: {
      type: String
    },
    // v-model value
    value: {
      type: null,
      default: null
    },
    // Has search?
    search: {
      type: Boolean,
      default: false
    }
  },
  // Component inner state
  data () {
    //
    return {
      opened: false,
      selected: undefined
    }
  },
  // Computed properties
  computed: {
    // Container computed classes
    containerClasses () {
      return ['bulma-select__container', {'bulma-select__container--active': this.opened}]
    },
    // Placeholder computed classes
    placeholderClasses () {
      return ['bulma-select__placeholder button is-white', {'is-hovered': this.opened}]
    },
    // Options computed classes
    optionsClasses () {
      return [{'is-hovered': this.opened}, 'bulma-select__options']
    },
    // Selected item
    selectedItem () { return this.options[this.selected] },
    // Text for the selected option
    textSelected () {
      //
      if (this.selected === undefined || this.opened) { return '' }

      //
      return this.label !== undefined ? this.selectedItem[this.label] : this.selectedItem
    }
  },
  // Methods
  methods: {
    // Toggle the opened property
    toggleOpened () {
      this.opened ? this.close() : this.open()
    },
    // Open the select
    open () {
      // Primitive return
      if (this.opened) { return }

      // Definitions
      this.opened = true
      this.$refs.search.focus()
    },
    // Close the select
    close () {
      // Primitive return
      if (!this.opened) { return }

      // Definitions
      this.opened = false
      this.$refs.search.blur()
    },
    // Set the selected using v-model value
    selectVModel () {
      if (this.value === undefined) { return }
      this.selected = this.options.indexOf(this.value)
    },
    // Select a value based on the index
    selectOption (i) {
      // Select the item
      this.selected = i

      // Close the select
      this.close()
    }
  },
  // Watchers
  watch: {
    // Change the selected item
    selected () {
      // Emit!
      this.$emit('input', this.options[this.selected])
    },
    // Value changed
    value () {
      this.selectVModel()
    }
  },
  // When the component is created
  created () {
    // do it
    // this.selectVModel()
  }
}
</script>

<style lang="sass">
// Import bulma stuff
@import '~bulma/sass/utilities/_all'
@import "~bulma/sass/elements/button"
@import "~bulma/sass/elements/form"

//
.bulma-select
  &__container
    @extend .select
    position: relative
    width: 100%
    &:after
      transition: all 0.2s ease
    &--active
      &:after
        transform: rotate(-225deg)
        top: 60% !important
  &__placeholder
    @extend select
    box-sizing: border-box
    text-align: left
    width: 100%
    &.is-hovered
      border-radius: $input-radius $input-radius 0 0
  &__options
    +input
    display: block
    padding: 0
    z-index: 5
    width: 100%
    height: auto
    box-sizing: border-box
    border-top: 0
    border-radius: 0 0 $input-radius $input-radius
    position: absolute
  &__option
    width: 100%
    text-align: left
    border-radius: 0
    display: block

// Transition definition
.slide-fade
  &-enter-active
    transition: all 0.2s ease
  &-leave-active
    transition: all 0.1s cubic-bezier(1.0, 0.5, 0.8, 1.0)
  &-enter, &-leave-active
    padding-top: 10px
    opacity: 0
</style>
