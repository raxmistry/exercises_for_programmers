<template>
    <div>
        <div class="left-pad"/>
            <div class="hello">
                <p>Please enter some text</p>
                <input id="inp" placeholder="Enter something" @input="countMyChars">
                <div class="result">
                    <p>Count of characters : {{returnCount()}}</p>
                </div>
            </div>

            <div class="right-pad"/>
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
.hello {
    margin: 0% 40% 0% 40%;
    background-color: LightSteelBlue;
    border-radius: 5px;
    box-shadow: 1px 1px 15px 1px Gray;
}
input {
    padding: 10px;
    font: 2em;
}
p {
    padding: 30px 5px 5px 10px;
    font: 15px ;
    font-weight: bold;
}
.left-pad {
    margin: 5% 30 5% 30%;
}
.right-pad {
    margin: 5% 30 5% 30%;
}
.result {
    background-color: MidnightBlue;
    color: white;
    border-radius: 5px;
}
</style>
