import React from 'react';
import { Link } from 'react-router-dom';
import './Auth.css'; // We'll create this CSS file for styling

function Login() {
  return (
    <div className="auth-container">
      <h1 className="logo">LogWiz</h1>
      <form className="auth-form">
        <input type="email" placeholder="Email" className="auth-input" />
        <input type="password" placeholder="Password" className="auth-input" />
        <button type="submit" className="auth-button">Login</button>
        <p className="auth-text">
          Don't have an account? <Link to="/register">Register here</Link>
        </p>
      </form>
    </div>
  );
}

export default Login;
