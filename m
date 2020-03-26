Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v2] rpmsg: core: Add wildcard match for name service
References: <20200310155058.1607-1-mathieu.poirier@linaro.org>
From: Suman Anna <s-anna@ti.com>
Message-ID: <591bd727-32af-9ea2-8c46-98f46ee3711e@ti.com>
Date: Thu, 26 Mar 2020 10:06:09 -0500
MIME-Version: 1.0
In-Reply-To: <20200310155058.1607-1-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Mathieu Poirier <mathieu.poirier@linaro.org>, ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Mathieu,

On 3/10/20 10:50 AM, Mathieu Poirier wrote:
> Adding the capability to supplement the base definition published
> by an rpmsg_driver with a postfix description so that it is possible
> for several entity to use the same service.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Acked-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

So, the concern I have here is that we are retrofitting this into the
existing 32-byte name field, and the question is if it is going to be
enough in general. That's the reason I went with the additional 32-byte
field with the "rpmsg: add a description field" patch.

regards
Suman

> ---
> Changes for V2:
> - Added Arnaud's Acked-by.
> - Rebased to latest rproc-next.
> 
>  drivers/rpmsg/rpmsg_core.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index e330ec4dfc33..bfd25978fa35 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -399,7 +399,25 @@ ATTRIBUTE_GROUPS(rpmsg_dev);
>  static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
>  				  const struct rpmsg_device_id *id)
>  {
> -	return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) == 0;
> +	size_t len = min_t(size_t, strlen(id->name), RPMSG_NAME_SIZE);
> +
> +	/*
> +	 * Allow for wildcard matches.  For example if rpmsg_driver::id_table
> +	 * is:
> +	 *
> +	 * static struct rpmsg_device_id rpmsg_driver_sample_id_table[] = {
> +	 *      { .name = "rpmsg-client-sample" },
> +	 *      { },
> +	 * }
> +	 *
> +	 * Then it is possible to support "rpmsg-client-sample*", i.e:
> +	 *	rpmsg-client-sample
> +	 *	rpmsg-client-sample_instance0
> +	 *	rpmsg-client-sample_instance1
> +	 *	...
> +	 *	rpmsg-client-sample_instanceX
> +	 */
> +	return strncmp(id->name, rpdev->id.name, len) == 0;
>  }
>  
>  /* match rpmsg channel and rpmsg driver */
> 
