import React from 'react';
import { Link } from 'react-router-dom';
import './Auth.css'; // Same CSS file for shared styles

function Register() {
  return (
    <div className="auth-container">
      <h1 className="logo">LogWiz</h1>
      <form className="auth-form">
        <input type="text" placeholder="Name" className="auth-input" />
        <input type="email" placeholder="Email" className="auth-input" />
        <input type="password" placeholder="Password" className="auth-input" />
        <button type="submit" className="auth-button">Register</button>
        <p className="auth-text">
          Already have an account? <Link to="/">Login here</Link>
        </p>
      </form>
    </div>
  );
}

export default Register;
