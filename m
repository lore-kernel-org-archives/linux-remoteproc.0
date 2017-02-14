Return-Path: <dan.carpenter@oracle.com>
Date: Tue, 14 Feb 2017 10:28:33 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] rpmsg: Handle invalid parameters in public API
Message-ID: <20170213193610.GE4162@mwanda>
References: <20170211084030.GA18105@mwanda>
 <20170213165808.GP27837@minitux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170213165808.GP27837@minitux>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Feb 13, 2017 at 08:58:09AM -0800, Bjorn Andersson wrote:
> >     70  struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev,
> >     71                                          rpmsg_rx_cb_t cb, void *priv,
> >     72                                          struct rpmsg_channel_info chinfo)
> >     73  {
> >     74          if (WARN_ON(!rpdev))
> >     75                  return ERR_PTR(-EINVAL);
> > 
> > The callers aren't expecting error pointers.  I could filter out this
> > one because Smatch knows it's impossible for that caller because rpdev
> > isn't NULL, but I feel like this should really return NULL.
> > 
> 
> I think it would make sense to report an ERR_PTR() from
> rpmsg_create_ept(), but that's not what's currently expected.
> 

It sounds like you're trying to argue or persuade me but that's like
arguing with a fruit fly.  Complete waste of time.  I have invested
zero thought into this and had literally already forgotten sending this
email.  Just do whatever you think is best.  ;)

regards,
dan carpenter
