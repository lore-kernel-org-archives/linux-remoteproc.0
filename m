Date: Sun, 19 Apr 2020 22:17:23 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 5/7] remoteproc: Restructure firmware name allocation
Message-ID: <20200420051720.GE1516868@builder.lan>
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
 <20200415204858.2448-6-mathieu.poirier@linaro.org>
 <9a4b6342-750e-284a-2343-8151b478589b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a4b6342-750e-284a-2343-8151b478589b@linaro.org>
To: Alex Elder <elder@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, ohad@wizery.com, s-anna@ti.com, Markus.Elfring@web.de, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 15 Apr 14:23 PDT 2020, Alex Elder wrote:

> On 4/15/20 3:48 PM, Mathieu Poirier wrote:
> > Improve the readability of function rproc_alloc_firmware() by using
> > a non-negated condition.
> > 
> > Suggested-by: Alex Elder <elder@linaro.org>
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> 
> If it were me, I'd move the comment above the if statement and
> perhaps reword it a little bit to describe what's happening.
> But no matter, this looks good.
> 

This would also avoid the fact that we have a multiline block without
braces (which isn't needed, but looks odd to me). So that sounds like a
good idea.

Regards,
Bjorn

> Reviewed-by: Alex Elder <elder@linaro.org>
> 
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index ebaff496ef81..0bfa6998705d 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1984,14 +1984,14 @@ static int rproc_alloc_firmware(struct rproc *rproc,
> >  {
> >  	const char *p;
> >  
> > -	if (!firmware)
> > +	if (firmware)
> > +		p = kstrdup_const(firmware, GFP_KERNEL);
> > +	else
> >  		/*
> >  		 * If the caller didn't pass in a firmware name then
> >  		 * construct a default name.
> >  		 */
> >  		p = kasprintf(GFP_KERNEL, "rproc-%s-fw", name);
> > -	else
> > -		p = kstrdup_const(firmware, GFP_KERNEL);
> >  
> >  	if (!p)
> >  		return -ENOMEM;
> > 
> 
