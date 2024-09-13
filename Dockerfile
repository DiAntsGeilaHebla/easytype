# Step 1: Use an official Node.js image as the base image
FROM node:18

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy package.json and yarn.lock to the working directory
COPY package.json yarn.lock ./

# Step 4: Install dependencies
RUN yarn install

# Step 5: Copy the rest of the application code to the working directory
COPY . .

# Step 6: Lint the code
RUN yarn lint

# Step 7: Test the code
RUN yarn test

# Step 8: Build the application
RUN yarn build

# Step 9: Expose the application on port 3000 (if applicable)
EXPOSE 3000

# Step 10: Define the command to start the app
CMD ["yarn", "start"]
