// Import required libraries
const fetch = require('node-fetch');
const fs = require('fs');
const { parseString } = require('xml2js');

// Function to import RSS feed
async function importRSS() {
    // Fetch the RSS feed from WordPress
    const response = await fetch('http://yourwordpresssite.com/feed'); // Replace with your actual RSS feed URL
    const data = await response.text();
    
    // Parse the XML response
    parseString(data, (err, result) => {
        if (err) throw err; // Handle parse error
        const posts = result.rss.channel[0].item; // Get the posts from the RSS feed
        
        // Loop through each post
        posts.forEach(post => {
            const title = post.title[0].replace(/\s+/g, '-'); // Format the title for the file name
            const markdownContent = `---
title: "${post.title[0]}"
date: "${post.pubDate[0]}"
---
${post.description[0]}`;  // Content of the Markdown file

            // Write the content to a Markdown file
            fs.writeFileSync(`content/posts/${title}.md`, markdownContent.trim());
        });
    });
}

// Run the RSS import function
importRSS();

