import React, { useState, useMemo } from 'react';
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer, Cell } from 'recharts';

const EEGGeneralizationViz = () => {
  const [showViolin, setShowViolin] = useState(true);

  // Parse the CSV data
  const data = `subject_idx,subject_path,group,best_P,best_K,val_rNMSE,test_rNMSE,recording_length_s
0,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/AR/sub-30018/eeg/s6_sub-30018_rs-hep_eeg.set,AD,6,4,0.038343482585923405,0.025823276629006214,423.79296875
1,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/AR/sub-30026/eeg/s6_sub-30026_rs-hep_eeg.set,AD,6,3,0.02486200279987008,0.14724993255038166,396.40234375
2,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/AR/sub-30011/eeg/s6_sub-30011_rs-hep_eeg.set,AD,6,4,0.017823216710784472,0.0364232571631192,141.25
3,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/AR/sub-30009/eeg/s6_sub-30009_rs-hep_eeg.set,AD,6,3,0.014954779697183578,0.016315602840094263,404.361328125
4,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/AR/sub-30012/eeg/s6_sub-30012_rs-hep_eeg.set,AD,6,5,0.039708490526266016,0.029003141486982686,227.765625
5,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/AR/sub-30002/eeg/s6_sub-30002_rs-hep_eeg.set,AD,6,3,0.01597355668228086,0.014301497500380799,323.30859375
6,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/AR/sub-30017/eeg/s6_sub-30017_rs-hep_eeg.set,AD,6,3,0.024039216135374387,0.017564495618313303,249.845703125
7,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/AR/sub-30001/eeg/s6_sub-30001_rs-hep_eeg.set,AD,6,4,0.045788581208809805,0.039031434447518554,312.443359375
8,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/AR/sub-30029/eeg/s6_sub-30029_rs-hep_eeg.set,AD,6,3,0.017816721492068536,0.020562748861258504,454.7109375
9,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/AR/sub-30015/eeg/s6_sub-30015_rs-hep_eeg.set,AD,6,4,0.02544498343923258,0.0368991198952366,161.607421875
10,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/AR/sub-30013/eeg/s6_sub-30013_rs-hep_eeg.set,AD,6,3,0.024675053585297556,0.024908617994573983,370.64453125
11,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/AR/sub-30008/eeg/s6_sub-30008_rs-hep_eeg.set,AD,6,3,0.01787262922897857,0.018996974570644056,314.318359375
12,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/AR/sub-30031/eeg/s6_sub-30031_rs-hep_eeg.set,AD,6,4,0.02520675214561883,0.08568244658954546,412.6015625
13,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/AR/sub-30022/eeg/s6_sub-30022_rs-hep_eeg.set,AD,6,3,0.02348259174654378,0.025552206575205818,416.427734375
14,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/AR/sub-30020/eeg/s6_sub-30020_rs-hep_eeg.set,AD,6,4,0.02923791077817018,0.030227086643648197,345.4140625
15,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/AR/sub-30004/eeg/s6_sub-30004_rs-hep_eeg.set,AD,6,3,0.018578927406239315,0.015028435741446442,285.005859375
16,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/CL/sub-30003/eeg/s6_sub-30003_rs-hep_eeg.set,AD,6,3,0.02077694883335821,0.026837528705385055,438.392578125
17,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/CL/sub-30007/eeg/s6_sub-30007_rs-hep_eeg.set,AD,6,3,0.018177875585553293,0.02271477468259339,505.44921875
18,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/CL/sub-30005/eeg/s6_sub-30005_rs-hep_eeg.set,AD,6,3,0.01851048624014769,0.016574298930438085,581.51171875
19,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/CL/sub-30006/eeg/s6_sub-30006_rs-hep_eeg.set,AD,5,3,0.03359972146968053,0.04022559298184206,620.265625
20,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/CL/sub-30010/eeg/s6_sub-30010_rs-hep_eeg.set,AD,6,3,0.020413688212614207,0.03030030875234732,472.80859375
21,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/CL/sub-30014/eeg/s6_sub-30014_rs-hep_eeg.set,AD,6,3,0.013772487210330742,0.015052942201810074,545.166015625
22,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/CL/sub-30016/eeg/s6_sub-30016_rs-hep_eeg.set,AD,6,4,0.0274086089845884,0.042243252865029265,481.521484375
23,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/CL/sub-30019/eeg/s6_sub-30019_rs-hep_eeg.set,AD,5,3,0.053208196248570525,0.0598208982805121,527.822265625
24,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/CL/sub-30021/eeg/s6_sub-30021_rs-hep_eeg.set,AD,6,3,0.018401323164930566,0.022196976109132033,361.841796875
25,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/CL/sub-30023/eeg/s6_sub-30023_rs-hep_eeg.set,AD,6,3,0.0178568875315587,0.17931202368815707,165.744140625
26,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/CL/sub-30024/eeg/s6_sub-30024_rs-hep_eeg.set,AD,6,5,0.03472528516360214,0.05997089381368202,568.015625
27,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/CL/sub-30025/eeg/s6_sub-30025_rs-hep_eeg.set,AD,6,4,0.026577311538157143,0.04762376475838194,607.3984375
28,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/CL/sub-30027/eeg/s6_sub-30027_rs-hep_eeg.set,AD,6,5,0.02326055709453829,0.042414266174529,677.7421875
29,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/CL/sub-30028/eeg/s6_sub-30028_rs-hep_eeg.set,AD,6,3,0.028414367115332656,0.031282188716419676,579.099609375
30,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/CL/sub-30030/eeg/s6_sub-30030_rs-hep_eeg.set,AD,6,3,0.013527764387694777,0.012819838928219056,498.439453125
31,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/CL/sub-30032/eeg/s6_sub-30032_rs-hep_eeg.set,AD,6,3,0.020804922087416782,0.022252787084194356,560.27734375
32,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/CL/sub-30033/eeg/s6_sub-30033_rs-hep_eeg.set,AD,6,3,0.018158129750709642,0.023908563219520278,498.896484375
33,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/CL/sub-30034/eeg/s6_sub-30034_rs-hep_eeg.set,AD,6,3,0.019237990872718512,0.01838629853687236,580.21484375
34,/home/muhibt/project/filter_identification/data/synapse_data/1_AD/CL/sub-30035/eeg/s6_sub-30035_rs-hep_eeg.set,AD,6,4,0.035104272421635586,0.03741184029029295,414.5703125
35,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/AR/sub-10002/eeg/s6_sub-10002_rs_eeg.set,HC,6,4,0.029741596231114935,0.07437585988649865,364.423828125
36,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/AR/sub-10009/eeg/s6_sub-10009_rs_eeg.set,HC,6,3,0.019309740719313066,0.02498014583877315,377.0859375
37,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/AR/sub-100012/eeg/s6_sub-100012_rs_eeg.set,HC,6,3,0.02881888546059383,0.023365928648821383,345.58984375
38,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/AR/sub-100015/eeg/s6_sub-100015_rs_eeg.set,HC,6,3,0.021178216276203986,0.02246369308938128,410.142578125
39,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/AR/sub-100020/eeg/s6_sub-100020_rs_eeg.set,HC,6,3,0.02467544293935963,0.030035914742401828,328.59375
40,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/AR/sub-100035/eeg/s6_sub-100035_rs_eeg.set,HC,6,3,0.017640352660488905,0.018023001245281254,268.0859375
41,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/AR/sub-100028/eeg/s6_sub-100028_rs_eeg.set,HC,6,4,0.023471263758237375,0.023360154390677373,288.36328125
42,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/AR/sub-10006/eeg/s6_sub-10006_rs_eeg.set,HC,5,4,0.0438249182932645,0.0418284616946185,437.28515625
43,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/AR/sub-10007/eeg/s6_sub-10007_rs_eeg.set,HC,6,4,0.031665344599605585,0.026858896679221426,357.451171875
44,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/AR/sub-100033/eeg/s6_sub-100033_rs_eeg.set,HC,6,4,0.02260802565090324,0.03498338390259433,358.734375
45,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/AR/sub-100022/eeg/s6_sub-100022_rs_eeg.set,HC,6,3,0.018514198304789023,0.02280728586339994,445.595703125
46,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/AR/sub-100031/eeg/s6_sub-100031_rs_eeg.set,HC,6,4,0.02462248041509402,0.0503517929582774,358.15625
47,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/AR/sub-10003/eeg/s6_sub-10003_rs_eeg.set,HC,6,4,0.0269296363688849,0.035029522865752005,580.65234375
48,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/AR/sub-100026/eeg/s6_sub-100026_rs_eeg.set,HC,6,3,0.017086360686603737,0.01789798616268868,410.830078125
49,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/AR/sub-100030/eeg/s6_sub-100030_rs_eeg.set,HC,6,3,0.01719479217211232,0.020822829917981418,365.80078125
50,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/AR/sub-100018/eeg/s6_sub-100018_rs_eeg.set,HC,6,3,0.023086206547121756,0.019762053113190077,362.248046875
51,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/AR/sub-100024/eeg/s6_sub-100024_rs_eeg.set,HC,6,3,0.01855586124813858,0.016104664889995998,496.056640625
52,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/AR/sub-100038/eeg/s6_sub-100038_rs_eeg.set,HC,6,3,0.02109877926748989,0.10132664093546546,345.98046875
53,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/AR/sub-10004/eeg/s6_sub-10004_rs_eeg.set,HC,6,5,0.042183207976931585,0.05042429255241337,407.083984375
54,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/CL/sub-10001/eeg/s6_sub-10001_rs_eeg.set,HC,6,3,0.032786896947498805,0.03215912458756515,567.814453125
55,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/CL/sub-10005/eeg/s6_sub-10005_rs_eeg.set,HC,6,3,0.012866506828706515,0.013125436164727899,581.357421875
56,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/CL/sub-10008/eeg/s6_sub-10008_rs_eeg.set,HC,6,3,0.036115582392062535,0.06154507836240856,598.294921875
57,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/CL/sub-100010/eeg/s6_sub-100010_rs_eeg.set,HC,6,3,0.015987246065006084,0.01915550236029492,602.59375
58,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/CL/sub-100011/eeg/s6_sub-100011_rs_eeg.set,HC,6,3,0.020952726977690347,0.019802645749515176,604.197265625
59,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/CL/sub-100014/eeg/s6_sub-100014_rs_eeg.set,HC,6,4,0.031621944871829545,0.05470510374395452,527.37109375
60,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/CL/sub-100017/eeg/s6_sub-100017_rs_eeg.set,HC,6,3,0.01725011679922587,0.014318494500083202,591.810546875
61,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/CL/sub-100021/eeg/s6_sub-100021_rs_eeg.set,HC,6,4,0.04110468635579638,0.02781005469639375,570.560546875
62,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/CL/sub-100029/eeg/s6_sub-100029_rs_eeg.set,HC,6,3,0.02070297618143018,0.018274403416049457,663.298828125
63,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/CL/sub-100034/eeg/s6_sub-100034_rs_eeg.set,HC,6,4,0.02188121104060293,0.04917122924373573,590.1953125
64,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/CL/sub-100037/eeg/s6_sub-100037_rs_eeg.set,HC,6,4,0.02582962903479575,0.022697276351747533,544.16015625
65,/home/muhibt/project/filter_identification/data/synapse_data/5_HC/CL/sub-100043/eeg/s6_sub-100043_rs_eeg.set,HC,6,3,0.04398467326863196,0.10598887231444808,591.599609375`.trim().split('\n').slice(1).map(line => {
    const [idx, path, group, P, K, val, test, length] = line.split(',');
    return {
      group,
      P: parseInt(P),
      K: parseInt(K),
      test_rNMSE: parseFloat(test)
    };
  });

  // Calculate statistics
  const stats = useMemo(() => {
    const adData = data.filter(d => d.group === 'AD').map(d => d.test_rNMSE);
    const hcData = data.filter(d => d.group === 'HC').map(d => d.test_rNMSE);
    
    const calcStats = (arr) => {
      const sorted = [...arr].sort((a, b) => a - b);
      const n = sorted.length;
      return {
        min: sorted[0],
        q1: sorted[Math.floor(n * 0.25)],
        median: sorted[Math.floor(n * 0.5)],
        q3: sorted[Math.floor(n * 0.75)],
        max: sorted[n - 1],
        mean: arr.reduce((a, b) => a + b, 0) / n
      };
    };

    return {
      AD: calcStats(adData),
      HC: calcStats(hcData)
    };
  }, [data]);

  // Hyperparameter frequency data
  const hyperparamData = useMemo(() => {
    const pCounts = {};
    const kCounts = {};
    
    data.forEach(d => {
      pCounts[d.P] = (pCounts[d.P] || 0) + 1;
      kCounts[d.K] = (kCounts[d.K] || 0) + 1;
    });

    const pData = Object.entries(pCounts).map(([key, value]) => ({
      param: `P=${key}`,
      count: value,
      percentage: (value / data.length * 100).toFixed(1)
    }));

    const kData = Object.entries(kCounts).map(([key, value]) => ({
      param: `K=${key}`,
      count: value,
      percentage: (value / data.length * 100).toFixed(1)
    }));

    return { pData, kData };
  }, [data]);

  // Violin plot component
  const ViolinPlot = ({ group, stats, color, x }) => {
    const groupData = data.filter(d => d.group === group).map(d => d.test_rNMSE);
    const height = 200;
    const bandwidth = 0.015;
    
    // Kernel density estimation
    const kde = (values, bw) => {
      const min = Math.min(...values);
      const max = Math.max(...values);
      const points = [];
      const steps = 50;
      
      for (let i = 0; i <= steps; i++) {
        const x = min + (max - min) * i / steps;
        let density = 0;
        
        values.forEach(v => {
          const diff = (x - v) / bw;
          density += Math.exp(-0.5 * diff * diff);
        });
        
        density = density / (values.length * bw * Math.sqrt(2 * Math.PI));
        points.push({ x, density });
      }
      
      return points;
    };
    
    const kdePoints = kde(groupData, bandwidth);
    const maxDensity = Math.max(...kdePoints.map(p => p.density));
    const scale = 25 / maxDensity;
    
    const violinPath = kdePoints.map((p, i) => {
      const y = height - (p.x * 3000);
      const width = p.density * scale;
      return i === 0 ? `M ${x - width} ${y}` : `L ${x - width} ${y}`;
    }).join(' ') + 
    kdePoints.reverse().map(p => {
      const y = height - (p.x * 3000);
      const width = p.density * scale;
      return `L ${x + width} ${y}`;
    }).join(' ') + ' Z';

    return (
      <>
        <path d={violinPath} fill={color} opacity={0.6} />
        <line x1={x} y1={height - stats.min * 3000} x2={x} y2={height - stats.max * 3000} 
              stroke={color} strokeWidth={1.5} opacity={0.8} />
        <rect x={x - 8} y={height - stats.q3 * 3000} width={16} 
              height={(stats.q3 - stats.q1) * 3000} fill="white" stroke={color} strokeWidth={2} />
        <line x1={x - 8} y1={height - stats.median * 3000} x2={x + 8} 
              y2={height - stats.median * 3000} stroke={color} strokeWidth={3} />
        <circle cx={x} cy={height - stats.mean * 3000} r={4} fill={color} />
      </>
    );
  };

  const colors = {
    AD: '#e74c3c',
    HC: '#3498db'
  };

  return (
    <div className="w-full max-w-6xl mx-auto p-6 bg-white">
      <h2 className="text-2xl font-bold text-gray-800 mb-2">
        Model Generalization & Hyperparameter Stability
      </h2>
      <p className="text-sm text-gray-600 mb-6">
        Test rNMSE (LOSO CV) demonstrates low, balanced generalization error across groups; 
        hyperparameter modes (P=6, K=3) indicate stable model selection
      </p>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        {/* Main violin/box plot */}
        <div className="lg:col-span-2 bg-gray-50 p-6 rounded-lg border border-gray-200">
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-lg font-semibold text-gray-700">
              Test rNMSE Distribution by Group
            </h3>
            <button
              onClick={() => setShowViolin(!showViolin)}
              className="px-3 py-1 text-sm bg-blue-500 text-white rounded hover:bg-blue-600 transition-colors"
            >
              {showViolin ? 'Show Box' : 'Show Violin'}
            </button>
          </div>
          
          <svg width="100%" height="300" viewBox="0 0 400 250">
            <g transform="translate(50, 20)">
              {/* Y-axis */}
              <line x1={0} y1={0} x2={0} y2={200} stroke="#666" strokeWidth={2} />
              {[0, 0.05, 0.10, 0.15].map((val, i) => (
                <g key={i}>
                  <line x1={-5} y1={200 - val * 2000} x2={0} y2={200 - val * 2000} 
                        stroke="#666" strokeWidth={1} />
                  <text x={-10} y={200 - val * 2000 + 4} 
                        textAnchor="end" fontSize="12" fill="#666">
                    {val.toFixed(2)}
                  </text>
                </g>
              ))}
              <text x={-35} y={100} transform={`rotate(-90, -35, 100)`} 
                    textAnchor="middle" fontSize="14" fontWeight="bold" fill="#444">
                Test rNMSE
              </text>

              {/* X-axis */}
              <line x1={0} y1={200} x2={300} y2={200} stroke="#666" strokeWidth={2} />
              
              {/* Plots */}
              {showViolin ? (
                <>
                  <ViolinPlot group="AD" stats={stats.AD} color={colors.AD} x={100} />
                  <ViolinPlot group="HC" stats={stats.HC} color={colors.HC} x={200} />
                </>
              ) : (
                <>
                  {/* AD Box Plot */}
                  <g>
                    <line x1={100} y1={200 - stats.AD.min * 3000} x2={100} 
                          y2={200 - stats.AD.q1 * 3000} stroke={colors.AD} strokeWidth={2} />
                    <line x1={100} y1={200 - stats.AD.q3 * 3000} x2={100} 
                          y2={200 - stats.AD.max * 3000} stroke={colors.AD} strokeWidth={2} />
                    <rect x={75} y={200 - stats.AD.q3 * 3000} width={50} 
                          height={(stats.AD.q3 - stats.AD.q1) * 3000} 
                          fill={colors.AD} opacity={0.3} stroke={colors.AD} strokeWidth={2} />
                    <line x1={75} y1={200 - stats.AD.median * 3000} x2={125} 
                          y2={200 - stats.AD.median * 3000} stroke={colors.AD} strokeWidth={3} />
                    <circle cx={100} cy={200 - stats.AD.mean * 3000} r={5} fill={colors.AD} />
                  </g>
                  
                  {/* HC Box Plot */}
                  <g>
                    <line x1={200} y1={200 - stats.HC.min * 3000} x2={200} 
                          y2={200 - stats.HC.q1 * 3000} stroke={colors.HC} strokeWidth={2} />
                    <line x1={200} y1={200 - stats.HC.q3 * 3000} x2={200} 
                          y2={200 - stats.HC.max * 3000} stroke={colors.HC} strokeWidth={2} />
                    <rect x={175} y={200 - stats.HC.q3 * 3000} width={50} 
                          height={(stats.HC.q3 - stats.HC.q1) * 3000} 
                          fill={colors.HC} opacity={0.3} stroke={colors.HC} strokeWidth={2} />
                    <line x1={175} y1={200 - stats.HC.median * 3000} x2={225} 
                          y2={200 - stats.HC.median * 3000} stroke={colors.HC} strokeWidth={3} />
                    <circle cx={200} cy={200 - stats.HC.mean * 3000} r={5} fill={colors.HC} />
                  </g>
                </>
              )}

              {/* Labels */}
              <text x={100} y={220} textAnchor="middle" fontSize="14" 
                    fontWeight="bold" fill={colors.AD}>
                AD (n=35)
              </text>
              <text x={200} y={220} textAnchor="middle" fontSize="14" 
                    fontWeight="bold" fill={colors.HC}>
                HC (n=31)
              </text>
            </g>
          </svg>

          {/* Statistics table */}
          <div className="mt-4 grid grid-cols-2 gap-4 text-xs">
            <div>
              <h4 className="font-semibold text-red-600 mb-2">AD Statistics</h4>
              <div className="space-y-1 text-gray-700">
                <div>Mean: {stats.AD.mean.toFixed(4)}</div>
                <div>Median: {stats.AD.median.toFixed(4)}</div>
                <div>IQR: {(stats.AD.q3 - stats.AD.q1).toFixed(4)}</div>
              </div>
            </div>
            <div>
              <h4 className="font-semibold text-blue-600 mb-2">HC Statistics</h4>
              <div className="space-y-1 text-gray-700">
                <div>Mean: {stats.HC.mean.toFixed(4)}</div>
                <div>Median: {stats.HC.median.toFixed(4)}</div>
                <div>IQR: {(stats.HC.q3 - stats.HC.q1).toFixed(4)}</div>
              </div>
            </div>
          </div>
        </div>

        {/* Hyperparameter selection frequency */}
        <div className="bg-gray-50 p-6 rounded-lg border border-gray-200">
          <h3 className="text-lg font-semibold text-gray-700 mb-4">
            Hyperparameter Selection
          </h3>
          
          <div className="mb-6">
            <h4 className="text-sm font-medium text-gray-600 mb-2">Model Order (P)</h4>
            <ResponsiveContainer width="100%" height={120}>
              <BarChart data={hyperparamData.pData}>
                <CartesianGrid strokeDasharray="3 3" />
                <XAxis dataKey="param" tick={{ fontSize: 11 }} />
                <YAxis tick={{ fontSize: 11 }} />
                <Tooltip 
                  content={({ active, payload }) => {
                    if (active && payload && payload.length) {
                      return (
                        <div className="bg-white p-2 border border-gray-300 rounded shadow-sm text-xs">
                          <p className="font-semibold">{payload[0].payload.param}</p>
                          <p>Count: {payload[0].value}</p>
                          <p>Percentage: {payload[0].payload.percentage}%</p>
                        </div>
                      );
                    }
                    return null;
                  }}
                />
                <Bar dataKey="count" radius={[4, 4, 0, 0]}>
                  {hyperparamData.pData.map((entry, index) => (
                    <Cell key={`cell-${index}`} 
                          fill={entry.param === 'P=6' ? '#2ecc71' : '#95a5a6'} />
                  ))}
                </Bar>
              </BarChart>
            </ResponsiveContainer>
          </div>

          <div>
            <h4 className="text-sm font-medium text-gray-600 mb-2">Kernel Size (K)</h4>
            <ResponsiveContainer width="100%" height={120}>
              <BarChart data={hyperparamData.kData}>
                <CartesianGrid strokeDasharray="3 3" />
                <XAxis dataKey="param" tick={{ fontSize: 11 }} />
                <YAxis tick={{ fontSize: 11 }} />
                <Tooltip 
                  content={({ active, payload }) => {
                    if (active && payload && payload.length) {
                      return (
                        <div className="bg-white p-2 border border-gray-300 rounded shadow-sm text-xs">
                          <p className="font-semibold">{payload[0].payload.param}</p>
                          <p>Count: {payload[0].value}</p>
                          <p>Percentage: {payload[0].payload.percentage}%</p>
                        </div>
                      );
                    }
                    return null;
                  }}
                />
                <Bar dataKey="count" radius={[4, 4, 0, 0]}>
                  {hyperparamData.kData.map((entry, index) => (
                    <Cell key={`cell-${index}`} 
                          fill={entry.param === 'K=3' ? '#e67e22' : '#95a5a6'} />
                  ))}
                </Bar>
              </BarChart>
            </ResponsiveContainer>
          </div>

          <div className="mt-4 p-3 bg-blue-50 rounded text-xs text-gray-700">
            <p className="font-semibold mb-1">Key Findings:</p>
            <ul className="space-y-1 ml-3 list-disc">
              <li>P=6 selected in {hyperparamData.pData.find(d => d.param === 'P=6')?.percentage}% of folds</li>
              <li>K=3 selected in {hyperparamData.kData.find(d => d.param === 'K=3')?.percentage}% of folds</li>
              <li>Consistent selection indicates stable model architecture</li>
            </ul>
          </div>
        </div>
      </div>

      <div className="mt-6 p-4 bg-green-50 border border-green-200 rounded-lg">
        <p className="text-sm text-gray-700">
          <span className="font-semibold">Interpretation:</span> Low test rNMSE values 
          (AD: {stats.AD.median.toFixed(4)}, HC: {stats.HC.median.toFixed(4)} median) with 
          minimal group differences demonstrate robust generalization without overfitting. 
          Dominant selection of P=6 and K=3 across cross-validation folds confirms stable 
          hyperparameter optimization and model reliability.
        </p>
      </div>
    </div>
  );
};

export default EEGGeneralizationViz;
