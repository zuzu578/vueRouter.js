<template>
  <div id="app">
    <Header />
    <div id="content" class="content">
      <router-view></router-view>
    </div>
  </div>
</template>

<script>
import Header from "./components/layout/Header.vue";
export default {
  name: "App",
  components: {
    Header,
  },
};
</script>

<style>
.title
{
  text-align: center;
  margin-top:60px;
}
.form-control{
  width:600px;
  margin:0 auto;
}
</style>