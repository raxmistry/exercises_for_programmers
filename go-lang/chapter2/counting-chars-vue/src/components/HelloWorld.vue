<template>
    <div class="hello">
        <p>Please enter some text</p>
        <input id="inp" placeholder="Enter something" @input="countMyChars">
        <p>Count of characters : {{returnCount()}}</p>
    </div>
</template>

<script>
export default {
    name: 'HelloWorld',
    props: {

    },
    data: function() {
        return {
            count: "0"
        }
    },
    methods: {
        countMyChars : function(event) {
            var data = document.getElementById("inp").value 
            console.log(data)
            var url = "http://localhost:8080/" + data
            console.log(url)
            this.axios.get(url).then( (response) => {
                console.log(response.data)
                this.count = response.data;
            });
        },
        returnCount : function( ) {
            return this.count;
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
