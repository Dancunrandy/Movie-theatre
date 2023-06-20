// ProductionDetails.js
import React, { useEffect, useState } from 'react';
import { fetchProduction } from '../api';

const ProductionDetails = ({ match }) => {
  const [production, setProduction] = useState(null);

  useEffect(() => {
    const getProduction = async () => {
      const data = await fetchProduction(match.params.id);
      setProduction(data);
    };

    getProduction();
  }, [match.params.id]);

  if (!production) {
    return <div>Loading...</div>;
  }

  return (
    <div>
      <h2>{production.title}</h2>
      <p>{production.genre}</p>
      <p>{production.description}</p>
    </div>
  );
};

export default ProductionDetails;
