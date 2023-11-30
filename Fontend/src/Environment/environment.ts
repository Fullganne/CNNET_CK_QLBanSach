export const environment = {
    production: false,
    apiUrl: 'https://localhost:7009/api/Books',
    path: {
      home: 'Home/GetAll', 
      getById: 'Home/GetByMasv',
      page: 'Home/Page?pageNumber=1&pageSize=10', 
      search: 'Home/Search', 
      create: 'Home/Add', 
      edit: 'Home/Edit', 
      delete: 'Home/Delete'
    }
  };
