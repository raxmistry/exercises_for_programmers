<template>
  <div class="hello">
      <input v-model="message" placeholder="Enter something" @input="countMyChars">
  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  props: {
  },
    methods: {
        countMyChars : function(event) {
            var data = event.data
            console.log(data)
            var url = "http://localhost:8080/" + data
            console.log(url)
            this.axios.get(url).then( (response) => {
                console.log(response.data)
            });
        }
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
