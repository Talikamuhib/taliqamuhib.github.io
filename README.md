<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>GP-VAR Transfer Function Analysis for Alzheimer's Detection</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.16.9/dist/katex.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    :root {
      /* Purple Theme - Alzheimer's Awareness Color */
      --primary-color: #5B2C6F;
      --primary-light: #7D3C98;
      --primary-dark: #4A235A;
      --accent-color: #9B59B6;
      --accent-light: #BB8FCE;
      --success-color: #27ae60;
      --warning-color: #e74c3c;
      --purple-gradient: linear-gradient(135deg, #5B2C6F 0%, #9B59B6 50%, #BB8FCE 100%);
      --purple-gradient-dark: linear-gradient(135deg, #4A235A 0%, #7D3C98 100%);
    }
    body {
      padding-top: 0;
      background-color: #faf8fc;
      font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      line-height: 1.7;
    }
    /* Alzheimer's Awareness Ribbon */
    .awareness-ribbon {
      background: var(--purple-gradient);
      color: white;
      padding: 0.75rem;
      text-align: center;
      font-size: 0.9rem;
    }
    .awareness-ribbon a {
      color: #F5EEF8;
      text-decoration: underline;
    }
    .hero {
      background: var(--purple-gradient-dark);
      color: white;
      padding: 5rem 0;
      margin-bottom: 0;
      position: relative;
      overflow: hidden;
    }
    .hero::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.05'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
      opacity: 0.3;
    }
    .hero-content {
      position: relative;
      z-index: 1;
    }
    .hero h1 {
      font-size: 2.5rem;
      font-weight: 700;
      margin-bottom: 1.5rem;
      text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
    }
    .hero .lead {
      font-size: 1.2rem;
      opacity: 0.95;
      max-width: 700px;
      margin: 0 auto;
    }
    .hero-badge {
      background: rgba(255,255,255,0.2);
      border: 1px solid rgba(255,255,255,0.3);
      backdrop-filter: blur(10px);
    }
    h2 {
      color: var(--primary-color);
      border-bottom: 3px solid var(--accent-color);
      padding-bottom: 0.75rem;
      margin-bottom: 1.5rem;
      font-weight: 600;
    }
    h2::before {
      content: '🧠 ';
    }
    .section {
      padding: 3rem 0;
      border-bottom: 1px solid #E8DAEF;
    }
    .container {
      max-width: 1000px;
    }
    img {
      max-width: 100%;
      height: auto;
      margin-top: 1rem;
      margin-bottom: 1rem;
      border-radius: 12px;
      box-shadow: 0 4px 20px rgba(91,44,111,0.15);
    }
    .stat-card {
      background: white;
      border-radius: 16px;
      padding: 2rem 1.5rem;
      text-align: center;
      box-shadow: 0 4px 15px rgba(91,44,111,0.1);
      transition: all 0.3s ease;
      border: 1px solid #F5EEF8;
    }
    .stat-card:hover {
      transform: translateY(-8px);
      box-shadow: 0 8px 25px rgba(91,44,111,0.2);
      border-color: var(--accent-light);
    }
    .stat-value {
      font-size: 2.8rem;
      font-weight: 700;
      background: var(--purple-gradient);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
    }
    .stat-label {
      color: #666;
      font-size: 0.95rem;
      margin-top: 0.5rem;
    }
    .effect-table {
      background: white;
      border-radius: 16px;
      overflow: hidden;
      box-shadow: 0 4px 15px rgba(91,44,111,0.1);
    }
    .effect-table th {
      background: var(--primary-color);
      color: white;
      padding: 1rem;
      font-weight: 500;
    }
    .effect-table td {
      padding: 0.9rem 1rem;
    }
    .effect-large {
      background-color: #E8DAEF;
      font-weight: 600;
    }
    .effect-small {
      background-color: #FCF3CF;
    }
    .math-block {
      background: linear-gradient(135deg, #F5EEF8 0%, #EBDEF0 100%);
      border-left: 5px solid var(--accent-color);
      padding: 2rem;
      margin: 1.5rem 0;
      border-radius: 0 12px 12px 0;
      overflow-x: auto;
    }
    .finding-card {
      background: var(--purple-gradient);
      color: white;
      border-radius: 16px;
      padding: 2.5rem;
      margin: 1.5rem 0;
      box-shadow: 0 8px 30px rgba(91,44,111,0.25);
    }
    .finding-card h4, .finding-card h5 {
      text-shadow: 1px 1px 2px rgba(0,0,0,0.2);
    }
    .badge-method {
      background: var(--accent-color);
      color: white;
      padding: 0.6rem 1.2rem;
      border-radius: 25px;
      font-size: 0.85rem;
      margin-right: 0.5rem;
      margin-bottom: 0.5rem;
      display: inline-block;
      font-weight: 500;
      transition: all 0.2s;
    }
    .badge-method:hover {
      background: var(--primary-color);
      transform: scale(1.05);
    }
    .timeline {
      position: relative;
      padding-left: 35px;
    }
    .timeline::before {
      content: '';
      position: absolute;
      left: 0;
      top: 0;
      bottom: 0;
      width: 4px;
      background: var(--purple-gradient);
      border-radius: 2px;
    }
    .timeline-item {
      position: relative;
      padding-bottom: 2rem;
    }
    .timeline-item::before {
      content: '';
      position: absolute;
      left: -39px;
      top: 5px;
      width: 14px;
      height: 14px;
      border-radius: 50%;
      background: var(--accent-color);
      border: 3px solid white;
      box-shadow: 0 0 0 3px var(--accent-light);
    }
    .timeline-item h6 {
      color: var(--primary-color);
      font-weight: 600;
    }
    .interpretation-box {
      background: linear-gradient(135deg, #F5EEF8 0%, #EBDEF0 100%);
      border-radius: 16px;
      padding: 1.75rem;
      margin: 1rem 0;
      border: 1px solid #D7BDE2;
    }
    .interpretation-box h5 {
      color: var(--primary-color);
      font-weight: 600;
    }
    /* Why This Matters Section */
    .impact-card {
      background: white;
      border-radius: 16px;
      padding: 2rem;
      height: 100%;
      border-left: 5px solid var(--accent-color);
      box-shadow: 0 4px 15px rgba(91,44,111,0.08);
    }
    .impact-card h5 {
      color: var(--primary-color);
    }
    .impact-number {
      font-size: 3rem;
      font-weight: 700;
      color: var(--accent-color);
    }
    /* Brain Network Visualization */
    .brain-visual {
      background: var(--purple-gradient-dark);
      border-radius: 16px;
      padding: 2rem;
      color: white;
      text-align: center;
    }
    /* Novelty Highlight */
    .novelty-box {
      background: linear-gradient(135deg, #5B2C6F 0%, #7D3C98 100%);
      color: white;
      border-radius: 16px;
      padding: 2rem;
      margin: 2rem 0;
    }
    .novelty-box ul {
      margin-bottom: 0;
    }
    .novelty-box li {
      margin-bottom: 0.5rem;
    }
    /* Comparison Table */
    .comparison-table {
      background: white;
      border-radius: 16px;
      overflow: hidden;
      box-shadow: 0 4px 15px rgba(91,44,111,0.1);
    }
    .comparison-table th {
      background: var(--primary-color);
      color: white;
    }
    .check-yes {
      color: var(--success-color);
      font-weight: bold;
    }
    .check-no {
      color: #ccc;
    }
    footer {
      background: var(--primary-dark);
      color: white;
      padding: 3rem 0;
      margin-top: 3rem;
    }
    footer a {
      color: var(--accent-light);
    }
    /* Purple Ribbon Icon */
    .purple-ribbon {
      width: 40px;
      height: 40px;
      display: inline-block;
      vertical-align: middle;
    }
    /* Animations */
    @keyframes fadeInUp {
      from {
        opacity: 0;
        transform: translateY(20px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
    .section {
      animation: fadeInUp 0.6s ease-out;
    }
    /* Copy Protection */
    body {
      -webkit-user-select: none;
      -moz-user-select: none;
      -ms-user-select: none;
      user-select: none;
    }
    /* Author Section */
    .author-info {
      background: rgba(255,255,255,0.15);
      border-radius: 12px;
      padding: 1rem 2rem;
      margin-top: 2rem;
      display: inline-block;
    }
    .author-name {
      font-size: 1.3rem;
      font-weight: 600;
      margin-bottom: 0.25rem;
    }
    .author-affiliation {
      font-size: 0.95rem;
      opacity: 0.9;
    }
    /* Watermark */
    .watermark {
      position: fixed;
      bottom: 20px;
      right: 20px;
      opacity: 0.15;
      font-size: 1rem;
      color: var(--primary-color);
      transform: rotate(-15deg);
      pointer-events: none;
      z-index: 1000;
    }
    /* Protected notice */
    .protected-notice {
      background: rgba(91,44,111,0.1);
      border: 1px dashed var(--accent-color);
      border-radius: 8px;
      padding: 0.5rem 1rem;
      font-size: 0.8rem;
      color: var(--primary-color);
      text-align: center;
      margin-top: 1rem;
    }
  </style>
</head>
<body oncontextmenu="return false;" ondragstart="return false;" onselectstart="return false;">

<!-- Watermark -->
<div class="watermark">© Talika Muhib 2026</div>

<!-- Alzheimer's Awareness Ribbon -->
<div class="awareness-ribbon">
  💜 <strong>Purple represents Alzheimer's Awareness</strong> — Over 55 million people worldwide live with dementia. Early detection saves lives. <a href="https://www.alz.org/" target="_blank">Learn more</a>
</div>

<!-- Hero Section -->
<div class="hero">
  <div class="container text-center hero-content">
    <div class="mb-3">
      <svg class="purple-ribbon" viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M50 10 C30 30, 20 50, 30 70 C35 80, 45 85, 50 90 C55 85, 65 80, 70 70 C80 50, 70 30, 50 10Z" fill="#BB8FCE" stroke="white" stroke-width="2"/>
        <path d="M50 10 C40 25, 35 40, 40 55 M50 10 C60 25, 65 40, 60 55" stroke="white" stroke-width="2" fill="none"/>
      </svg>
    </div>
    <h1>GP-VAR System Identification of EEG for Alzheimer's Disease Detection</h1>
    <p class="lead">Graph Signal Processing-Based Transfer Function Analysis of Brain Network Dynamics</p>
    <p class="mt-3 opacity-75"><em>A novel approach to understanding how Alzheimer's alters brain network signal processing</em></p>
    
    <div class="author-info">
      <div class="author-name">Talika Muhib</div>
      <div class="author-affiliation">MRes Thesis • 2026</div>
    </div>
    
    <div class="mt-4">
      <span class="badge hero-badge me-2 px-3 py-2">MRes Thesis</span>
      <span class="badge hero-badge me-2 px-3 py-2">Graph Signal Processing</span>
      <span class="badge hero-badge me-2 px-3 py-2">Neuroimaging</span>
      <span class="badge hero-badge px-3 py-2">Machine Learning</span>
    </div>
    
    <div class="protected-notice mt-4">
      🔒 This content is protected. View only.
    </div>
  </div>
</div>

<div class="container">

  <!-- Why This Matters Section -->
  <div class="section">
    <h2>Why This Research Matters</h2>
    <div class="row g-4 mb-4">
      <div class="col-md-4">
        <div class="impact-card">
          <div class="impact-number">55M+</div>
          <h5>People Living with Dementia</h5>
          <p class="text-muted mb-0">Worldwide, with numbers expected to triple by 2050. Early detection is critical.</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="impact-card">
          <div class="impact-number">$1.3T</div>
          <h5>Annual Global Cost</h5>
          <p class="text-muted mb-0">Economic burden of dementia care. Cost-effective diagnostics are urgently needed.</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="impact-card">
          <div class="impact-number">10+ yrs</div>
          <h5>Before Symptoms</h5>
          <p class="text-muted mb-0">Brain changes begin years before clinical symptoms. Early biomarkers enable intervention.</p>
        </div>
      </div>
    </div>
    
    <div class="novelty-box">
      <h5>💜 What Makes This Approach Different?</h5>
      <div class="row">
        <div class="col-md-6">
          <ul>
            <li><strong>Non-invasive:</strong> Uses standard EEG, no PET scans or lumbar punctures</li>
            <li><strong>Network-based:</strong> Analyzes how brain regions communicate, not just individual signals</li>
            <li><strong>Interpretable:</strong> Results have clear physiological meaning (network gain)</li>
          </ul>
        </div>
        <div class="col-md-6">
          <ul>
            <li><strong>Joint frequency analysis:</strong> Examines both temporal AND graph frequencies</li>
            <li><strong>Hyperexcitability biomarker:</strong> Captures E/I imbalance linked to AD pathology</li>
            <li><strong>Cost-effective:</strong> Can be deployed in clinics without expensive equipment</li>
          </ul>
        </div>
      </div>
    </div>
  </div>

  <!-- Abstract Section -->
  <div class="section">
    <h2>Abstract</h2>
    <p>This research applies <strong>Graph Polynomial Vector Autoregressive (GP-VAR)</strong> system identification to resting-state EEG signals for characterizing brain network dynamics in Alzheimer's disease (AD). EEG data from 128-channel recordings are modeled as graph signals on a structural connectivity network derived from the normalized graph Laplacian. The GP-VAR framework enables computation of <strong>transfer functions G(ω, λ)</strong> that jointly characterize temporal frequency ω and graph frequency λ responses, providing a novel biomarker of network-level signal processing in the brain.</p>
    <p>Analysis of 66 subjects (35 AD, 31 healthy controls) from the BrainLat consortium reveals that AD patients exhibit <strong>significantly elevated transfer function magnitudes</strong> across multiple frequency bands, with the largest effect in the gamma band (Cohen's d = 1.08). This finding is interpreted as <strong>network hyperexcitability</strong>—pathologically increased gain in signal propagation through brain networks. Transfer function-derived features achieve <strong>87.3% classification accuracy</strong> in distinguishing AD from healthy controls.</p>
  </div>

  <!-- Key Results -->
  <div class="section">
    <h2>Key Results at a Glance</h2>
    <div class="row g-4 mb-4">
      <div class="col-md-3 col-6">
        <div class="stat-card">
          <div class="stat-value">87.3%</div>
          <div class="stat-label">Classification Accuracy</div>
        </div>
      </div>
      <div class="col-md-3 col-6">
        <div class="stat-card">
          <div class="stat-value">d=1.08</div>
          <div class="stat-label">Gamma Band Effect Size</div>
        </div>
      </div>
      <div class="col-md-3 col-6">
        <div class="stat-card">
          <div class="stat-value">66</div>
          <div class="stat-label">Subjects Analyzed</div>
        </div>
      </div>
      <div class="col-md-3 col-6">
        <div class="stat-card">
          <div class="stat-value">128</div>
          <div class="stat-label">EEG Channels</div>
        </div>
      </div>
    </div>

    <!-- Effect Size Table -->
    <h5 class="mt-4">Transfer Function Magnitude Differences by Frequency Band</h5>
    <div class="table-responsive effect-table">
      <table class="table table-hover mb-0">
        <thead>
          <tr>
            <th>Frequency Band</th>
            <th>Range (Hz)</th>
            <th>AD Mean |G|</th>
            <th>HC Mean |G|</th>
            <th>Cohen's d</th>
            <th>Effect Size</th>
          </tr>
        </thead>
        <tbody>
          <tr class="effect-large">
            <td><strong>Gamma</strong></td>
            <td>30–50 Hz</td>
            <td>0.884</td>
            <td>0.771</td>
            <td><strong>1.08</strong></td>
            <td>Large</td>
          </tr>
          <tr class="effect-large">
            <td><strong>Theta</strong></td>
            <td>4–8 Hz</td>
            <td>2.87</td>
            <td>2.41</td>
            <td><strong>0.89</strong></td>
            <td>Large</td>
          </tr>
          <tr class="effect-large">
            <td><strong>Delta</strong></td>
            <td>0.5–4 Hz</td>
            <td>4.54</td>
            <td>3.94</td>
            <td><strong>0.84</strong></td>
            <td>Large</td>
          </tr>
          <tr class="effect-large">
            <td><strong>Beta</strong></td>
            <td>13–30 Hz</td>
            <td>1.64</td>
            <td>1.53</td>
            <td><strong>0.81</strong></td>
            <td>Large</td>
          </tr>
          <tr class="effect-small">
            <td>Alpha</td>
            <td>8–13 Hz</td>
            <td>2.60</td>
            <td>2.52</td>
            <td>0.14</td>
            <td>Small</td>
          </tr>
        </tbody>
      </table>
    </div>
    <p class="text-muted mt-2"><small>All bands except alpha show AD > HC (elevated network gain in Alzheimer's disease)</small></p>
  </div>

  <!-- Research Question & Hypothesis -->
  <div class="section">
    <h2>Research Question & Hypothesis</h2>
    
    <div class="finding-card">
      <h5>Research Question</h5>
      <p class="mb-0">Can graph signal processing-based transfer function analysis of resting-state EEG reveal differences in brain network dynamics between Alzheimer's disease patients and healthy controls that are useful for early detection?</p>
    </div>

    <div class="row mt-4">
      <div class="col-md-12">
        <div class="interpretation-box">
          <h5>✓ Hypothesis H1 (Supported)</h5>
          <p><strong>Altered Transfer Function Magnitudes:</strong> AD patients exhibit significantly different transfer function magnitudes |G(ω, λ)| compared to healthy controls, indicating altered network gain characteristics.</p>
          <p class="mb-0"><em>Result: AD patients show <strong>elevated</strong> |G(ω, λ)| across gamma, theta, delta, and beta bands with large effect sizes (d > 0.8).</em></p>
        </div>
      </div>
    </div>
  </div>

  <!-- Mathematical Framework -->
  <div class="section">
    <h2>Mathematical Framework</h2>
    
    <h5>GP-VAR Model</h5>
    <p>The Graph Polynomial Vector Autoregressive model captures brain dynamics as:</p>
    <div class="math-block">
      <p><strong>Node Domain:</strong></p>
      <p style="font-size: 1.1rem; text-align: center;">
        x(t) = Σ<sub>p=1</sub><sup>P</sup> Σ<sub>k=0</sub><sup>K</sup> h<sub>p,k</sub> L<sup>k</sup> x(t−p) + ε(t)
      </p>
      <p class="mt-3">Where:</p>
      <ul>
        <li><strong>x(t)</strong> ∈ ℝ<sup>N</sup> — EEG signal at time t across N=128 channels</li>
        <li><strong>L</strong> — Normalized graph Laplacian encoding brain connectivity</li>
        <li><strong>h<sub>p,k</sub></strong> — Model coefficients (P × (K+1) parameters)</li>
        <li><strong>P</strong> — Temporal order (35–45 optimal)</li>
        <li><strong>K</strong> — Graph polynomial order (2–3 optimal)</li>
      </ul>
    </div>

    <h5 class="mt-4">Transfer Function</h5>
    <p>The joint temporal-graph frequency transfer function is derived as:</p>
    <div class="math-block">
      <p style="font-size: 1.2rem; text-align: center;">
        G(ω, λ) = 1 / [1 − Σ<sub>p=1</sub><sup>P</sup> H<sub>p</sub>(λ) e<sup>−jωp</sup>]
      </p>
      <p class="mt-3">Where the graph frequency response at each lag is:</p>
      <p style="font-size: 1.1rem; text-align: center;">
        H<sub>p</sub>(λ) = Σ<sub>k=0</sub><sup>K</sup> h<sub>p,k</sub> λ<sup>k</sup>
      </p>
    </div>

    <div class="interpretation-box mt-4">
      <h5>What Does |G(ω, λ)| Tell Us?</h5>
      <p><strong>|G(ω, λ)|</strong> quantifies the <em>gain</em> of the brain network—how strongly input signals at temporal frequency ω and graph frequency λ are amplified as they propagate through the network.</p>
      <ul class="mb-0">
        <li><strong>High |G|</strong> → Network amplifies signals strongly → Hyperexcitability</li>
        <li><strong>Low |G|</strong> → Network attenuates signals → Hypoexcitability</li>
      </ul>
    </div>
  </div>

  <!-- Methodology -->
  <div class="section">
    <h2>Methodology Pipeline</h2>
    
    <div class="row mb-4">
      <div class="col-12">
        <span class="badge-method">128-channel EEG</span>
        <span class="badge-method">BrainLat Dataset</span>
        <span class="badge-method">Normalized Laplacian</span>
        <span class="badge-method">Ridge Regression</span>
        <span class="badge-method">BIC Model Selection</span>
        <span class="badge-method">Transfer Functions</span>
      </div>
    </div>

    <div class="timeline">
      <div class="timeline-item">
        <h6>1. Data Acquisition</h6>
        <p>Resting-state EEG from BrainLat consortium: 35 AD patients, 31 healthy controls, 128-channel recordings at 100 Hz sampling rate.</p>
      </div>
      <div class="timeline-item">
        <h6>2. Preprocessing</h6>
        <p>Band-pass filtering (0.5–50 Hz), artifact rejection via ICA, segmentation into 4-second epochs, average referencing.</p>
      </div>
      <div class="timeline-item">
        <h6>3. Graph Construction</h6>
        <p>Normalized graph Laplacian: L = I − D<sup>−1/2</sup>AD<sup>−1/2</sup> from structural connectivity matrix. Eigendecomposition yields graph frequencies λ ∈ [0, 2].</p>
      </div>
      <div class="timeline-item">
        <h6>4. GP-VAR Estimation</h6>
        <p>Ridge regression with α = 0.005 regularization. BIC-based model selection identifies optimal P = 35–45, K = 2–3.</p>
      </div>
      <div class="timeline-item">
        <h6>5. Transfer Function Computation</h6>
        <p>Evaluate G(ω, λ) on frequency grids: ω ∈ [0, π] (temporal), λ ∈ [0, 2] (graph). Extract |G| features per frequency band.</p>
      </div>
      <div class="timeline-item">
        <h6>6. Statistical Analysis</h6>
        <p>Independent samples t-tests, Cohen's d effect sizes, SVM classification with cross-validation.</p>
      </div>
    </div>
  </div>

  <!-- Key Finding -->
  <div class="section">
    <h2>Key Finding: Network Hyperexcitability</h2>
    
    <div class="finding-card">
      <h4>💜 AD Patients Show Elevated Network Gain</h4>
      <p>Contrary to the traditional "EEG slowing" narrative, our transfer function analysis reveals that AD patients exhibit <strong>increased</strong> |G(ω, λ)|—the brain network <em>over-amplifies</em> signals rather than under-processing them.</p>
      <p class="mb-0 opacity-90"><em>"The brain in Alzheimer's disease doesn't quiet down—it becomes hyperexcitable, amplifying signals beyond healthy levels."</em></p>
    </div>

    <div class="row mt-4">
      <div class="col-md-6">
        <div class="interpretation-box">
          <h5>🔬 Supporting Evidence from Literature</h5>
          <ul>
            <li><strong>Subclinical epileptiform activity</strong> — AD patients show 10-22% increased seizure risk (Vossel et al., 2013)</li>
            <li><strong>E/I imbalance</strong> — GABAergic interneuron dysfunction reduces inhibition (Palop & Bhucke, 2007)</li>
            <li><strong>Amyloid-β effects</strong> — Oligomers enhance synaptic excitation and impair LTD</li>
            <li><strong>Network vulnerability</strong> — Hyperexcitable networks prone to pathological synchronization</li>
          </ul>
        </div>
      </div>
      <div class="col-md-6">
        <div class="interpretation-box">
          <h5>🔄 Reconciliation with EEG Slowing</h5>
          <ul>
            <li><strong>Power ≠ Gain</strong> — We measure network transfer function, not oscillation amplitude</li>
            <li><strong>Mechanistic link</strong> — Hyperexcitable networks may <em>cause</em> the observed spectral slowing</li>
            <li><strong>Graph-aware</strong> — Captures structured propagation along connectome, not channel-wise power</li>
            <li><strong>Complementary views</strong> — Both findings may reflect different aspects of same pathology</li>
          </ul>
        </div>
      </div>
    </div>
    
    <div class="brain-visual mt-4">
      <h5>🧠 What's Happening in the Alzheimer's Brain Network?</h5>
      <div class="row mt-3">
        <div class="col-md-6">
          <div class="p-3" style="background: rgba(255,255,255,0.1); border-radius: 12px;">
            <h6>Healthy Brain</h6>
            <p class="mb-0 small">Balanced gain: Network appropriately amplifies and attenuates signals for efficient information processing.</p>
          </div>
        </div>
        <div class="col-md-6">
          <div class="p-3" style="background: rgba(255,255,255,0.2); border-radius: 12px;">
            <h6>Alzheimer's Brain</h6>
            <p class="mb-0 small">Elevated gain: Network over-amplifies signals (hyperexcitability), potentially contributing to cognitive dysfunction and seizure susceptibility.</p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Methodology Comparison -->
  <div class="section">
    <h2>How GP-VAR Compares to Existing Methods</h2>
    
    <div class="table-responsive comparison-table mb-4">
      <table class="table table-hover mb-0">
        <thead>
          <tr>
            <th>Feature</th>
            <th>Power Spectra</th>
            <th>Connectivity</th>
            <th>Deep Learning</th>
            <th class="table-active">GP-VAR (Ours)</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>Graph-aware analysis</td>
            <td class="check-no">✗</td>
            <td>Partial</td>
            <td class="check-no">✗</td>
            <td class="check-yes">✓</td>
          </tr>
          <tr>
            <td>Dynamic (temporal) modeling</td>
            <td class="check-no">✗</td>
            <td>Limited</td>
            <td class="check-yes">✓</td>
            <td class="check-yes">✓</td>
          </tr>
          <tr>
            <td>Frequency-resolved</td>
            <td class="check-yes">✓</td>
            <td>Limited</td>
            <td class="check-no">✗</td>
            <td class="check-yes">✓</td>
          </tr>
          <tr>
            <td>Joint temporal-graph spectral</td>
            <td class="check-no">✗</td>
            <td class="check-no">✗</td>
            <td class="check-no">✗</td>
            <td class="check-yes">✓</td>
          </tr>
          <tr>
            <td>Input-output characterization</td>
            <td class="check-no">✗</td>
            <td class="check-no">✗</td>
            <td class="check-no">✗</td>
            <td class="check-yes">✓</td>
          </tr>
          <tr>
            <td>Physiologically interpretable</td>
            <td class="check-yes">✓</td>
            <td class="check-yes">✓</td>
            <td class="check-no">✗</td>
            <td class="check-yes">✓</td>
          </tr>
          <tr>
            <td>Mechanistic insight</td>
            <td>Low</td>
            <td>Medium</td>
            <td>None</td>
            <td><strong>High</strong></td>
          </tr>
        </tbody>
      </table>
    </div>
    
    <p class="text-muted"><em>The unique contribution of GP-VAR is the <strong>joint temporal-graph frequency characterization</strong> via G(ω, λ), enabling analysis of how the brain network processes information across both spectral domains simultaneously while remaining fully interpretable.</em></p>
  </div>

  <!-- Clinical Implications -->
  <div class="section">
    <h2>Clinical Implications</h2>
    
    <div class="row g-4">
      <div class="col-md-6">
        <div class="interpretation-box h-100">
          <h5>🏥 Diagnostic Potential</h5>
          <ul>
            <li><strong>Non-invasive:</strong> EEG-based, unlike PET ($3,000+) or CSF lumbar puncture</li>
            <li><strong>Interpretable:</strong> Network gain has clear physiological meaning for clinicians</li>
            <li><strong>Complementary:</strong> Captures dynamics orthogonal to structural biomarkers</li>
            <li><strong>Cost-effective:</strong> Widely available EEG equipment (~$50-100/test)</li>
            <li><strong>Accessible:</strong> Can be deployed in primary care and low-resource settings</li>
          </ul>
        </div>
      </div>
      <div class="col-md-6">
        <div class="interpretation-box h-100">
          <h5>💊 Therapeutic Implications</h5>
          <ul>
            <li><strong>Anti-epileptic treatment:</strong> Hyperexcitability phenotype may respond to levetiracetam</li>
            <li><strong>Treatment monitoring:</strong> |G| as pharmacodynamic biomarker for drug trials</li>
            <li><strong>Prognostic stratification:</strong> Extreme |G| values may identify high-risk subgroups</li>
            <li><strong>Neurofeedback targets:</strong> Real-time network gain modulation potential</li>
            <li><strong>Personalized medicine:</strong> Identify patients who may benefit from E/I-targeting therapies</li>
          </ul>
        </div>
      </div>
    </div>
  </div>

  <!-- Objectives -->
  <div class="section">
    <h2>Research Objectives & Status</h2>
    
    <div class="row g-4">
      <div class="col-md-4">
        <div class="stat-card h-100">
          <h5 class="text-success">✓ O1: Complete</h5>
          <p>Develop GP-VAR framework for EEG analysis with rigorous mathematical foundation linking node and graph frequency domains.</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="stat-card h-100">
          <h5 class="text-success">✓ O2: Complete</h5>
          <p>Apply framework to BrainLat dataset, compute transfer functions, and extract frequency band features for AD vs HC comparison.</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="stat-card h-100">
          <h5 class="text-success">✓ O3: Complete</h5>
          <p>Evaluate clinical utility through classification (87.3% accuracy) and effect size analysis (d > 0.8 for 4/5 bands).</p>
        </div>
      </div>
    </div>
  </div>

  <!-- Limitations & Future Work -->
  <div class="section">
    <h2>Limitations & Future Directions</h2>
    
    <div class="row">
      <div class="col-md-6">
        <div class="interpretation-box h-100">
          <h5>⚠️ Current Limitations</h5>
          <ul>
            <li>Single-site data (BrainLat consortium only)</li>
            <li>Cross-sectional design (no longitudinal tracking)</li>
            <li>Binary classification (AD vs HC, no MCI stage)</li>
            <li>Population-average graph (not subject-specific DTI)</li>
            <li>Linear model (nonlinear dynamics approximated)</li>
            <li>Medication effects not fully controlled</li>
          </ul>
        </div>
      </div>
      <div class="col-md-6">
        <div class="interpretation-box h-100">
          <h5>🚀 Future Directions</h5>
          <ul>
            <li>Multi-site validation (ADNI, OASIS, local cohorts)</li>
            <li>Longitudinal MCI → AD conversion prediction</li>
            <li>Subject-specific structural connectivity from DTI</li>
            <li>Time-varying GP-VAR for non-stationary dynamics</li>
            <li>Correlation with amyloid-PET and tau-PET</li>
            <li>Clinical trial for anti-epileptic treatment response</li>
          </ul>
        </div>
      </div>
    </div>
    
    <div class="novelty-box mt-4">
      <h5>💜 The Path Forward</h5>
      <p class="mb-0">This research establishes GP-VAR transfer function analysis as a promising biomarker framework for Alzheimer's disease. The finding of network hyperexcitability opens new therapeutic avenues targeting excitation-inhibition balance. Multi-site validation and longitudinal studies are the critical next steps toward clinical translation.</p>
    </div>
  </div>

  <!-- References -->
  <div class="section">
    <h2>Key References</h2>
    <ol>
      <li><strong>Mei, J. & Moura, J.M.F.</strong> (2016). Signal Processing on Graphs: Causal Modeling of Unstructured Data. <em>IEEE Transactions on Signal and Information Processing over Networks</em>, 3(2), 445-460. <span class="badge bg-secondary">Foundational GP-VAR Paper</span></li>
      <li><strong>Shuman, D.I., et al.</strong> (2013). The Emerging Field of Signal Processing on Graphs. <em>IEEE Signal Processing Magazine</em>, 30(3), 83-98. <span class="badge bg-secondary">GSP Overview</span></li>
      <li><strong>Ortega, A., et al.</strong> (2018). Graph Signal Processing: Overview, Challenges, and Applications. <em>Proceedings of the IEEE</em>, 106(5), 808-828.</li>
      <li><strong>Vossel, K.A., et al.</strong> (2013). Seizures and Epileptiform Activity in the Early Stages of Alzheimer Disease. <em>JAMA Neurology</em>, 70(9), 1158-1166. <span class="badge bg-secondary">Hyperexcitability Evidence</span></li>
      <li><strong>Babiloni, C., et al.</strong> (2020). What Electrophysiology Tells Us About Alzheimer's Disease. <em>Neuroscience & Biobehavioral Reviews</em>, 109, 206-224.</li>
      <li><strong>Palop, J.J. & Mucke, L.</strong> (2007). Aberrant Excitatory Neuronal Activity and Compensatory Remodeling of Inhibitory Networks in AD. <em>Neuron</em>, 55(5), 697-711. <span class="badge bg-secondary">E/I Imbalance</span></li>
      <li><strong>Verret, L., et al.</strong> (2012). Inhibitory Interneuron Deficit Links Altered Network Activity and Cognitive Dysfunction in Alzheimer Model. <em>Cell</em>, 149(3), 708-721.</li>
    </ol>
  </div>

</div>

<!-- Footer -->
<footer>
  <div class="container">
    <div class="row">
      <div class="col-md-6 text-center text-md-start">
        <h5>💜 GP-VAR Transfer Function Analysis</h5>
        <p class="opacity-75 mb-0"><strong>Talika Muhib</strong> • MRes Thesis 2026</p>
        <p class="opacity-75 mb-0">Graph Signal Processing & Clinical Neuroscience</p>
        <p class="opacity-50 small mt-2">Purple represents Alzheimer's Awareness Month (November)</p>
      </div>
      <div class="col-md-6 text-center text-md-end mt-3 mt-md-0">
        <p class="mb-1"><strong>BrainLat Consortium Dataset</strong></p>
        <p class="opacity-75 mb-0">66 subjects • 128 channels • 100 Hz</p>
        <p class="opacity-50 small mt-2">
          <a href="https://www.alz.org/" target="_blank">Alzheimer's Association</a> • 
          <a href="https://brainlat.uai.cl/" target="_blank">BrainLat</a>
        </p>
      </div>
    </div>
    <hr class="my-4 opacity-25">
    <p class="text-center opacity-50 mb-0 small">© 2026 Talika Muhib • All Rights Reserved • This work is protected and may not be reproduced without permission.</p>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  // Disable copy
  document.addEventListener('copy', function(e) {
    e.preventDefault();
    return false;
  });
  
  // Disable cut
  document.addEventListener('cut', function(e) {
    e.preventDefault();
    return false;
  });
  
  // Disable paste
  document.addEventListener('paste', function(e) {
    e.preventDefault();
    return false;
  });
  
  // Disable keyboard shortcuts
  document.addEventListener('keydown', function(e) {
    // Ctrl+C, Ctrl+X, Ctrl+V, Ctrl+A, Ctrl+S, Ctrl+U, Ctrl+P, F12
    if ((e.ctrlKey || e.metaKey) && 
        (e.key === 'c' || e.key === 'x' || e.key === 'v' || 
         e.key === 'a' || e.key === 's' || e.key === 'u' || e.key === 'p')) {
      e.preventDefault();
      return false;
    }
    // F12 (DevTools)
    if (e.key === 'F12') {
      e.preventDefault();
      return false;
    }
  });
  
  // Disable print screen
  document.addEventListener('keyup', function(e) {
    if (e.key === 'PrintScreen') {
      navigator.clipboard.writeText('');
    }
  });
  
  // Console warning
  console.log('%c⚠️ This content is protected', 'color: #5B2C6F; font-size: 20px; font-weight: bold;');
  console.log('%c© 2026 Talika Muhib - MRes Thesis - All Rights Reserved', 'color: #9B59B6; font-size: 14px;');
</script>
</body>
</html>
