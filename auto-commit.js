const fs = require('fs');
const { execSync } = require('child_process');
const path = require('path');

const DATA_FILE = path.join(__dirname, 'commit-data.txt');

function makeCommit() {
  try {
    // 현재 날짜와 시간을 파일에 추가
    const timestamp = new Date().toISOString();
    const content = `Auto commit - ${timestamp}\n`;

    fs.appendFileSync(DATA_FILE, content);
    console.log(`Data written: ${content.trim()}`);

    // Git add
    execSync('git add .', { stdio: 'inherit' });

    // Git commit
    const commitMessage = `Auto commit: ${timestamp}`;
    execSync(`git commit -m "${commitMessage}"`, { stdio: 'inherit' });

    // Git push
    execSync('git push', { stdio: 'inherit' });

    console.log('Successfully committed and pushed!');
  } catch (error) {
    console.error('Error during auto-commit:', error.message);
    process.exit(1);
  }
}

makeCommit();
