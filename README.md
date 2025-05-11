![Add a subheading (8)](https://github.com/user-attachments/assets/168bc19e-9b6f-43cd-955b-5472cc89a33c)

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>EEG Graph Signal Processing for Alzheimer's Detection</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      padding-top: 2rem;
      background-color: #f8f9fa;
    }
    h1, h2 {
      color: #0d6efd;
    }
    .section {
      padding: 2rem 0;
      border-bottom: 1px solid #dee2e6;
    }
    .container {
      max-width: 960px;
    }
    img {
      max-width: 100%;
      height: auto;
      margin-top: 1rem;
      margin-bottom: 1rem;
      border-radius: 8px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
  </style>
</head>
<body>

<div class="container">
  <header class="mb-5 text-center">
    <h1>Graph Spectral EEG Biomarkers for Early Alzheimer's Detection</h1>
    <p class="lead">Using Graph Signal Processing (GSP) on EEG data for early Alzheimer's diagnosis</p>
  </header>

  <div class="section">
    <h2>Abstract</h2>
    <p>This project applies graph signal processing (GSP) to resting-state EEG signals for early detection of Alzheimer's disease. EEG data from 128-channel setups are modeled as signals on a graph derived from inter-channel Pearson correlations. Using graph spectral tools like the Graph Fourier Transform (GFT), and filters such as FIR and Chebyshev, we aim to extract biomarkers that can distinguish early Alzheimer's patients from healthy controls.</p>
  </div>

  <div class="section">
    <h2>Introduction</h2>
    <p>Alzheimer’s disrupts the brain’s connectivity even before structural changes appear. EEG is a non-invasive way to capture these disruptions. Traditional analyses overlook spatial dependencies across channels. We propose using GSP to process EEG as graph signals, revealing spatial-frequency information that can be used for early diagnosis.</p>
    ![image](https://github.com/user-attachments/assets/d4c42f0c-6195-4b7b-a010-5ee4f84cf8b2)  <p class="text-muted text-center">Figure: 128-channel EEG cap layout</p>
  </div>

  <div class="section">
    <h2>Objectives</h2>
    <ul>
      <li>Model EEG data as graph signals using Pearson correlation.</li>
      <li>Analyze EEG energy in the graph-frequency domain using GFT.</li>
      <li>Apply graph filters (FIR, Chebyshev) to isolate graph bands.</li>
      <li>Extract energy features and identify spectral biomarkers.</li>
      <li>Compare energy distributions between AD and control groups.</li>
      <li>Train machine learning models for classification.</li>
    </ul>
  </div>

  <div class="section">
    <h2>Methodology</h2>
    <ul>
      <li><strong>Preprocessing:</strong> Filtering (0.5–40 Hz), re-referencing, ICA for artifact removal.</li>
      <li><strong>Graph construction:</strong> Pearson correlation matrix (128×128) as adjacency.</li>
      <li><strong>Graph spectrum:</strong> Laplacian eigendecomposition to obtain eigenmodes and frequencies.</li>
      <li><strong>GFT:</strong> Project EEG frames onto graph-frequency basis.</li>
      <li><strong>Filtering:</strong> FIR and Chebyshev polynomial filters to extract low/high-frequency components.</li>
      <li><strong>Energy feature extraction:</strong> Sum of squared GFT coefficients per band.</li>
    </ul>
    <img src="https://raw.githubusercontent.com/mne-tools/mne-python/main/doc/_static/gfp.png" alt="Example GFT energy distribution">
    <p class="text-muted text-center">Figure: Example graph-frequency energy plot (simulated)</p>
  </div>

  <div class="section">
    <h2>Expected Outcomes</h2>
    <ul>
      <li>AD patients will show reduced low-graph-frequency energy (less global coherence).</li>
      <li>Greater high-graph-frequency energy in AD (fragmented spatial signals).</li>
      <li>Effective features for classifying AD vs controls.</li>
      <li>Improved early detection pipeline using GSP tools.</li>
    </ul>
  </div>

  <div class="section">
    <h2>Suggested Figures</h2>
    <ul>
      <li>EEG electrode layout (128-channel cap)</li>
      <li>Functional connectivity matrix (heatmap of correlations)</li>
      <li>Laplacian eigenmodes visualized on the scalp</li>
      <li>Graph frequency energy distributions (AD vs Control)</li>
      <li>Filtered EEG snapshots (low-pass vs high-pass graph filters)</li>
    </ul>
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Correlation_heatmap.svg/512px-Correlation_heatmap.svg.png" alt="Connectivity heatmap">
    <p class="text-muted text-center">Figure: Sample adjacency matrix heatmap (illustrative)</p>
  </div>

  <div class="section">
    <h2>References</h2>
    <ol>
      <li>Shuman et al., IEEE Signal Processing Magazine, 2013.</li>
      <li>R. Sharma and H. K. Meena, Biomed. Signal Process. Control, 2025.</li>
      <li>Abd El-Aty et al., Computers in Biology and Medicine, 2025.</li>
      <li>Alzheimer’s Disease EEG Consortium, J. Dementia and Alzheimer’s Disease, 2025.</li>
      <li>Miri et al., OHBM, 2023.</li>
    </ol>
  </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
