Date: Mon, 13 Feb 2017 08:58:08 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [bug report] rpmsg: Handle invalid parameters in public API
Message-ID: <20170213165808.GP27837@minitux>
References: <20170211084030.GA18105@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170211084030.GA18105@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Sat 11 Feb 00:40 PST 2017, Dan Carpenter wrote:

> Hello Bjorn Andersson,
> 
> The patch 93e9324431c9: "rpmsg: Handle invalid parameters in public
> API" from Oct 18, 2016, leads to the following static checker warning:
> 
> 	drivers/rpmsg/rpmsg_core.c:421 rpmsg_dev_probe()
> 	error: 'ept' dereferencing possible ERR_PTR()
> 
> drivers/rpmsg/rpmsg_core.c
>     60   * Drivers should provide their @rpdev channel (so the new endpoint would belong
>     61   * to the same remote processor their channel belongs to), an rx callback
>     62   * function, an optional private data (which is provided back when the
>     63   * rx callback is invoked), and an address they want to bind with the
>     64   * callback. If @addr is RPMSG_ADDR_ANY, then rpmsg_create_ept will
>     65   * dynamically assign them an available rpmsg address (drivers should have
>     66   * a very good reason why not to always use RPMSG_ADDR_ANY here).
>     67   *
>     68   * Returns a pointer to the endpoint on success, or NULL on error.
>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>     69   */
>     70  struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev,
>     71                                          rpmsg_rx_cb_t cb, void *priv,
>     72                                          struct rpmsg_channel_info chinfo)
>     73  {
>     74          if (WARN_ON(!rpdev))
>     75                  return ERR_PTR(-EINVAL);
> 
> The callers aren't expecting error pointers.  I could filter out this
> one because Smatch knows it's impossible for that caller because rpdev
> isn't NULL, but I feel like this should really return NULL.
> 

I think it would make sense to report an ERR_PTR() from
rpmsg_create_ept(), but that's not what's currently expected.

I applied a patch, correcting the return value, to linux-next.

Thanks,
Bjorn
