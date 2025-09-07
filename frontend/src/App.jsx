import { useEffect, useState } from "react";
import { createClient } from "@supabase/supabase-js";
import "./App.css";
import "./index.css";

// ⚡ Replace with your own Supabase project URL + anon key
const SUPABASE_URL = "https://dismdkkmjmudjmjfebsr.supabase.co";
const SUPABASE_ANON_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRpc21ka2ttam11ZGptamZlYnNyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTUxMjcyMjcsImV4cCI6MjA3MDcwMzIyN30.Jaf7sD-Y5IMbM3hhcR4aik9jmUIfTczyOsRzKpUXd1E";

const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

export default function App() {
  const [assets, setAssets] = useState([]);

  // Fetch assets from Supabase
  useEffect(() => {
    async function fetchAssets() {
      const { data, error } = await supabase.from("assets").select("*");
      if (error) {
        console.error("Error fetching assets:", error.message);
      } else {
        setAssets(data);
      }
    }
    fetchAssets();
  }, []);

  return (
    <div className="">
      <h1 className="">Asset Tag Database</h1>
      <table border="1" cellPadding="10">
        <thead>
          <tr>
            <th>Asset Tag</th>
            <th>PR #</th>
            <th>Status</th>
            <th>PO</th>
            <th>SN</th>
            <th>Model</th>
            <th>Manufacturer</th>
            <th>Dept</th>
            <th>Date Created</th>
            <th>Notes</th>
          </tr>
        </thead>
        <tbody>
          {assets.map((asset) => (
            <tr key={asset.id}>
              <td>{asset.asset_tag}</td>
              <td>{asset.pr}</td>
              <td>{asset.status}</td>
              <td>{asset.po}</td>
              <td>{asset.sn}</td>
              <td>{asset.model}</td>
              <td>{asset.manufacturer}</td>
              <td>{asset.dept}</td>
              <td>{new Date(asset.date_created).toLocaleString()}</td>
              <td>{asset.notes}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

