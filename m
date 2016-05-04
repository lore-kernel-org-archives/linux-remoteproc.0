Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH 2/4] rpmsg: drop owner assignment from spi_drivers
References: <1462386855-17381-1-git-send-email-afd@ti.com>
 <1462386855-17381-2-git-send-email-afd@ti.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <572A45AA.4020303@ti.com>
Date: Wed, 4 May 2016 13:55:38 -0500
MIME-Version: 1.0
In-Reply-To: <1462386855-17381-2-git-send-email-afd@ti.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
To: "Andrew F. Davis" <afd@ti.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 05/04/2016 01:34 PM, Andrew F. Davis wrote:
> An rpmsg_driver does not need to set an owner, it will be populated by
> the driver core.

spi_drivers in patch subject??

regards
Suman

> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
>  Documentation/rpmsg.txt             | 1 -
>  samples/rpmsg/rpmsg_client_sample.c | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/Documentation/rpmsg.txt b/Documentation/rpmsg.txt
> index f7edc3a..1d88426 100644
> --- a/Documentation/rpmsg.txt
> +++ b/Documentation/rpmsg.txt
> @@ -249,7 +249,6 @@ MODULE_DEVICE_TABLE(rpmsg, rpmsg_driver_sample_id_table);
>  
>  static struct rpmsg_driver rpmsg_sample_client = {
>  	.drv.name	= KBUILD_MODNAME,
> -	.drv.owner	= THIS_MODULE,
>  	.id_table	= rpmsg_driver_sample_id_table,
>  	.probe		= rpmsg_sample_probe,
>  	.callback	= rpmsg_sample_cb,
> diff --git a/samples/rpmsg/rpmsg_client_sample.c b/samples/rpmsg/rpmsg_client_sample.c
> index 59b1344..82ed288 100644
> --- a/samples/rpmsg/rpmsg_client_sample.c
> +++ b/samples/rpmsg/rpmsg_client_sample.c
> @@ -77,7 +77,6 @@ MODULE_DEVICE_TABLE(rpmsg, rpmsg_driver_sample_id_table);
>  
>  static struct rpmsg_driver rpmsg_sample_client = {
>  	.drv.name	= KBUILD_MODNAME,
> -	.drv.owner	= THIS_MODULE,
>  	.id_table	= rpmsg_driver_sample_id_table,
>  	.probe		= rpmsg_sample_probe,
>  	.callback	= rpmsg_sample_cb,
> 
