import React, { useState, useEffect } from 'react';
import axios from 'axios'
import '@coreui/coreui/dist/css/coreui.min.css'
import {CCardHeader,CButton, CCardFooter,CCardBody, CCardTitle, CCard, CCardText} from '@coreui/react';
import Button from 'react-bootstrap/Button';

import 'bootstrap/dist/css/bootstrap.min.css';

// import './button.module.css'
function Cards() {
  const [data, setData] = useState({ data: [] });
  const [searchTerm, setSearchTerm] = useState('');

  useEffect(() => {
    const fetchData = async () => {
      const result = await axios(
        'https://nith-portal-11-qsje.onrender.com/api/v1/form/show',
      );

      setData(result.data);
    };

    fetchData();
  }, []);
  const handleSearchInput = (e) => {
    setSearchTerm(e.target.value);
  }

  const handleSearch = () => {
    const filteredData = data.data.filter((item) => {
      return item.Name.toLowerCase().includes(searchTerm.toLowerCase());
    });
    setData({ data: filteredData });
  }
  const myStyle= {
    padding: "10px",
    
    // width:"33%"
  }
  const style={
    padding: "10px",
  }
  const searchDiv={
    // width: '34%',
    // marginRight: 'auto',
    // marginLeft: '300px',
    // borderRadius: '100px'
  }

    return (
       <div style={myStyle}>
     <div class="input-group mb-3 d-flex justify-content-between" style={searchDiv}>
  <input
    type="text"
    class="form-control"
    placeholder="Search by name"
    aria-label="Search by name"
    aria-describedby="search-addon"
    onChange={handleSearchInput}
  />
  <div class="input-group-append">
    <button
      class="btn btn-outline-secondary"
      type="button"
      id="search-addon"
      onClick={handleSearch}
    >
      Search
    </button>
  </div>
</div>
     {data.data.map(item => (
     <CCard className="text-center" style={style}>
  <CCardHeader>{item.Name}</CCardHeader>
  <CCardBody>
    <CCardTitle>{item.RoomNum}</CCardTitle>
    <CCardText>{item.address}</CCardText>
  </CCardBody>
  <CCardFooter className="text-medium-emphasis"><Button variant="outline-success">Approve</Button></CCardFooter>
</CCard>
      
         ))} 
      </div>
    );
  }

export default Cards;
  
  