<template>
    <div id="app-2">
  <span v-bind:title="message">
    Hover your mouse over me for a few seconds
    to see my dynamically bound title!
  </span>
</div>
</template>

<script>
import OtherComponent from './OtherComponent.vue';

export default {
    data(){
        return{
greeting: 'hello ',
        }
components:{

           }
    }
}
</script>
