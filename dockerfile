FROM nginx:1.17.1-alpine
COPY ./dist/projet /usr/share/nginx/html
EXPOSE 4321
CMD ["nginx" , "-g" , "daemon off;"]
