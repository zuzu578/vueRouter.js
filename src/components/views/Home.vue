<template>
  <div class="title"> 
    <h1> welcome {{title2}}!</h1>
    <input type="text" v-model="input1"/>
    <!-- onclick 대신 vue 에서는 @click-->
    
    <button type="button" @click="getData">Get</button>
    <button type="button" @click="setData">Set</button>

    <select class="form-control" v-model="region" @change="changeRegion">
      <!-- list 를 반복적으로 출력할때 -->
      <option :key="i" v-for="(d,i) in options">{{d.t}} </option>

    </select>
    <!-- v-if : true 일때 table 을 show 해줌  조건에 따라 element 를 rendering 해줄지 말지를 결정 -->
    <table class="table table-bordered" v-if="tableShow">
      <tr :key="i" v-for="(d,i) in options"> 
        <td>{{d.t}} </td>
        <td>{{d.t}} </td>
        <td>{{d.t}} </td>
        </tr>
    </table>
  </div>

    
    
    
</template>
<script>
export default {
  //DataBinding (two-way)
  data(){
    return {
      title:"dev",
      title2:"developer",
      input1:"hello Develpoer",
      options:[
        {v:"F",t:"Front-end"},
        {v:"B",t:"Back-end"},
        {v:"D",t:"DBA"},
       
      ],
      region: "S",
      tableShow: true,
    };
  },
  //data value 모니터링 => data 를 입력할때마다 data의 변경을 catch 가능 
  watch:{
    input1(){
      console.log(this.input1);
    },
    title(){
      console.log(this.title);
    }
  },
  //function()
  methods:{
    getData(){
      alert(this.input1);
    },
    setData(){
      this.input1 = "초기화";
    },
    changeRegion(){
      alert(this.region);
    },
  },
  //lifeCycle
  beforeCreate()
  {
    console.log("beforeCreate");
  },
  beforeMount()
  {
    console.log("beforeMount");
  },
  mounted()
  {
    console.log("mounted");
  },
  beforeUpdate()
  {
    console.log("beforeUpdate");
  },
  updated()
  {
    console.log("updated");
  },
  beforeDestroy()
  {
    console.log("beforeDestroy");
  },
  destroyed()
  {
    console.log("destroyed");
  },

};
</script>