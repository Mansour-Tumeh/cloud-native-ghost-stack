FROM ghost:5-alpine

ENV NODE_ENV=production

ENV security__staffDeviceVerification=false

COPY ./my-tailwind-theme /var/lib/ghost/content/themes/my-tailwind-theme

EXPOSE 2368