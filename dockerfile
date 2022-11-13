FROM nginx:1.17.17-alpine
COPY --from=build /usr/local/app/dist/projet /usr/share/nginx/html
EXPOSE 80
CMD ["nginx" , "-g" , "daemon off;"]
