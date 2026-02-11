// load-test/k6.js - Enterprise Load Validation
import http from 'k6/http';
import { sleep, check } from 'k6';

export const options = {
  vus: 50,        // 50 virtual users
  duration: '30s', // 30 seconds
  thresholds: {
    http_req_duration: ['p(95)<200'],  // 95% under 200ms
    http_req_failed: ['rate<0.01'],    // 99% success
  },
};

export default function () {
  const res = http.get('https://ti7j58f13f.execute-api.us-east-1.amazonaws.com/api/orders');
  
  check(res, {
    'status is 200': (r) => r.status === 200,
    'response time < 250ms': (r) => r.timings.duration < 250,
  });
  
  sleep(1);
}
