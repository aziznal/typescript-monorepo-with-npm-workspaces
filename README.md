# Typescript monorepo with npm workspaces and Nx

This repo is an example of how to create a typescript monorepo using npm workspaces and nx.

Nx is mainly used to scaffold the whole thing. the `nx.json` file can be used
for further configuration ([docs](https://nx.dev/reference/nx-json))

## Contents

This includes two applications, a frontend and a backend, as well as library which they both import.

This includes support for when the library is changed to cause re-builds for the importing applications / libraries.

You can read about how this is done in the article: https://medium.com/p/b271d81837e7
