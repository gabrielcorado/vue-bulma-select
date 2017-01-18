<template>
  <div class="sample__container">
    <h3 class="title is-4 is-marginless">{{ title }}</h3>
    <h4 class="title is-6">{{ desc }}</h4>

    <div class="tabs is-boxed is-marginless">
      <ul>
        <li :class="[active === 0 ? 'is-active' : '']">
          <a @click="change(0)"><span>Result</span></a>
        </li>
        <li :class="[active === 1 ? 'is-active' : '']">
          <a @click="change(1)"><span>Source</span></a>
        </li>
      </ul>
    </div>

    <div class="sample__tabs-body">
      <transition mode="out-in" name="slide-fade">
        <slot v-if="active === 0" name="result"></slot>
        <div v-else-if="active === 1">
          <pre><code><slot name="source"></slot></pre></code>
        </div>
      </transition>
    </div>
  </div>
</template>

<script>
// Export the component
export default {
  name: 'sample',
  props: {
    title: String,
    desc: String
  },
  data () {
    return {
      active: 0
    }
  },
  methods: {
    // Change the active tab
    change (i) { this.active = i }
  }
}
</script>

<style lang="sass">
.sample
  &__container
    padding: 10px
    border: 1px solid rgba(255, 255, 255, 0.2)
    border-radius: 3px
    margin: 0 0 20px
    &:last-child
      margin: 0
  &__tabs
    &-body
      padding: 10px
      background: #fff
      border-radius: 0 0 3px 3px

// Transition definition
.slide-fade
  &-enter-active
    transition: all 0.3s ease
  &-leave-active
    transition: all 0.1s cubic-bezier(1.0, 0.5, 0.8, 1.0)
  &-enter, &-leave-active
    padding-left: 10px
    opacity: 0
</style>
