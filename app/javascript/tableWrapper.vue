<template>
  <div id="tablewrapper">
    <table>
      <thead>
        <tr>
          <th @click="sort('name')">Nom</th>
          <th @click="sort('price')">Prix</th>
          <th @click="sort('user')">Utilisateur</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="d in sortedTable" :key="d.id">
          <td>{{ d.name }}</td>
          <td>{{ d.price }}</td>
          <td>{{ d.user }}</td>
        </tr>
      </tbody>
    </table>
    <div class="table-pagination">
      <button @click="prevPage">Previous</button>
      <span>Page {{ currentPage }} sur {{ totalPage() }}</span>
      <button @click="nextPage">Next</button>
    </div>
  </div>
</template> 

<script>
  export default {
    props: {
      tableData: {
        type: Array
      }

    },
    data: function () {
      return({
        currentSort: 'name',
        currentSortDir: 'asc',
        pageSize: 20,
        currentPage: 1
      })
    },
    methods: {
      sort:function(field) {
        if(field === this.currentSort) {
          this.currentSortDir = this.currentSortDir === 'asc' ? 'desc' : 'asc'
        }
        this.currentSort = field
      },
      nextPage:function() {
        if((this.currentPage*this.pageSize) < this.tableData.length) this.currentPage++;
      },
      prevPage:function() {
        if(this.currentPage > 1) this.currentPage--;
      },
      totalPage:function() {
        return Math.ceil(this.tableData.length / this.pageSize)
      }
    },
    computed: {
      sortedTable:function() {
        return this.tableData.sort((a,b) => {
          let modifier = 1;
          if(this.currentSortDir === 'desc') modifier = -1;
          if(a[this.currentSort] < b[this.currentSort]) return -1 * modifier;
          if(a[this.currentSort] > b[this.currentSort]) return 1 * modifier;
          return 0;
        }).filter((row, index) => {
          let start = (this.currentPage-1)*this.pageSize;
          let end = this.currentPage*this.pageSize;
          if(index >= start && index < end) return true;
        });
      }
    }
  }
</script>

<style scoped>
  table {
    border: 1px solid;
    border-spacing: 0px;
  }
  td, th {
    border: 0.5px solid;
  }
  th:hover {
    cursor: pointer;
  }
  #tablewrapper {
    margin: 50px;
  }
  th {
    font-size: 20px;
    text-align: center;
  }
  td {
    font-size: 16px;
  }

  .table-pagination {
    text-align: center;
    font-size: 18px;
  }
</style>
