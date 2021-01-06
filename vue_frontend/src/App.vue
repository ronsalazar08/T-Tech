<template>
  <v-app id="inspire">
    <v-navigation-drawer
      v-model="drawer"
      :mini-variant.sync="mini"
      permanent
      app
    >
      <v-list-item class="px-2">
        <v-list-item-avatar>
          <v-img src="./assets/logo.png"></v-img>
        </v-list-item-avatar>

        <v-list-item-title>User Name</v-list-item-title>

        <v-btn
          icon
          @click.stop="mini = !mini"
        >
          <v-icon>mdi-chevron-left</v-icon>
        </v-btn>
      </v-list-item>

      <v-divider></v-divider>

      <v-list dense>
        <v-list-item
          v-for="item in items"
          :key="item.title"
          link
        >
          <v-list-item-icon>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar app @click.stop="mini = true">
      <!-- <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon> -->

      <v-toolbar-title>Torres Technology Center Corporation</v-toolbar-title>
    </v-app-bar>

    <v-main>
      <v-container
      @click.stop="mini = true"
      class="grey lighten-5"
    >
      <v-data-table
        :headers="headers"
        :items="employee_data"
        :items-per-page="5"
        class="elevation-1"
      ></v-data-table>
    </v-container>
    </v-main>
  </v-app>
</template>

<script>
  import { getAPI } from "./axios-api";

  export default {
    data: () => ({
      drawer: true,
      items: [
        { title: 'Home', icon: 'mdi-home-city' },
        { title: 'My Account', icon: 'mdi-account' },
        { title: 'Users', icon: 'mdi-account-group-outline' },
      ],
      mini: true,
      headers: [
        // {
        //   text: 'Name',
        //   align: 'start',
        //   sortable: false,
        //   value: 'name',
        // },
        { text: 'Face ID', value: 'face_id' },
        { text: 'ID Number', value: 'id_number' },
        { text: 'Firstname', value: 'firstname' },
        { text: 'Middlename', value: 'middlename' },
        { text: 'Lastname', value: 'lastname' },
        { text: 'Company', value: 'company' },
        { text: 'Position', value: 'position' },
        { text: 'Shift', value: 'shift' },
      ],
      employee_data: [],
    }),
    // async created() {
    //   var response = await fetch('http://10.44.2.159/api/contractor_employee/');
    //   this.employee_data = await response.json();
    // }
    created() {
     this.employee_list();
    },
    methods: {
      employee_list() {
         getAPI.get('/api/contractor_employee/',)
        .then(response => {
          this.employee_data = response.data
        })
        .catch(err=> {
          console.log(err)
        })
      }
    }
  }
</script>