// ProductionList.js
import React, { useEffect, useState } from 'react';
import { fetchProductions, deleteProduction } from '../api';

const ProductionList = () => {
  const [productions, setProductions] = useState([]);

  useEffect(() => {
    const getProductions = async () => {
      const data = await fetchProductions();
      setProductions(data);
    };

    getProductions();
  }, []);

  const handleDelete = async (id) => {
    await deleteProduction(id);
    setProductions(productions.filter((p) => p.id !== id));
  };

  return (
    <div>
      <h2>Productions</h2>
      {productions.map((production) => (
        <div key={production.id}>
          <h3>{production.title}</h3>
          <p>{production.genre}</p>
          <button onClick={() => handleDelete(production.id)}>Delete</button>
        </div>
      ))}
    </div>
  );
};

export default ProductionList;
