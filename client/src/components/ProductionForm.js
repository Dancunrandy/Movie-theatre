// ProductionForm.js
import React, { useState } from 'react';
import { createProduction } from '../api';

const ProductionForm = () => {
  const [title, setTitle] = useState('');
  const [genre, setGenre] = useState('');
  const [budget, setBudget] = useState(0);

  const handleSubmit = async (e) => {
    e.preventDefault();

    const productionData = { title, genre, budget };

    const newProduction = await createProduction(productionData);
    // Handle the new production, e.g., add it to a list

    setTitle('');
    setGenre('');
    setBudget(0);
  };

  return (
    <div>
      <h2>Add Production</h2>
      <form onSubmit={handleSubmit}>
        <label>
          Title:
          <input
            type="text"
            value={title}
            onChange={(e) => setTitle(e.target.value)}
          />
        </label>
        <label>
          Genre:
          <input
            type="text"
            value={genre}
            onChange={(e) => setGenre(e.target.value)}
          />
        </label>
        <label>
          Budget:
          <input
            type="number"
            value={budget}
            onChange={(e) => setBudget(Number(e.target.value))}
          />
        </label>
        <button type="submit">Create</button>
      </form>
    </div>
  );
};

export default ProductionForm;
