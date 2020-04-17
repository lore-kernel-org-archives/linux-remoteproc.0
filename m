Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Fri, 17 Apr 2020 15:28:06 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v2 5/7] remoteproc: Restructure firmware name allocation
Message-ID: <20200417212806.GB10372@xps15>
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
 <20200415204858.2448-6-mathieu.poirier@linaro.org>
 <aa565fea-b1c4-9b5c-73ed-591244afee19@web.de>
 <e887c990-8cba-62b0-0f47-3ea0c166d603@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e887c990-8cba-62b0-0f47-3ea0c166d603@ti.com>
To: Suman Anna <s-anna@ti.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Elder <elder@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Apr 17, 2020 at 08:39:39AM -0500, Suman Anna wrote:
> Hi Markus,
> 
> On 4/16/20 1:26 AM, Markus Elfring wrote:
> > …
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -1984,14 +1984,14 @@ static int rproc_alloc_firmware(struct rproc *rproc,
> > >   {
> > >   	const char *p;
> > > 
> > > -	if (!firmware)
> > > +	if (firmware)
> > > +		p = kstrdup_const(firmware, GFP_KERNEL);
> > > +	else
> > >   		/*
> > >   		 * If the caller didn't pass in a firmware name then
> > >   		 * construct a default name.
> > >   		 */
> > >   		p = kasprintf(GFP_KERNEL, "rproc-%s-fw", name);
> > > -	else
> > > -		p = kstrdup_const(firmware, GFP_KERNEL);
> > 
> > Can the use of the conditional operator make sense at such source code places?
> > 
> > 	p = firmware ? kstrdup_const(…) : kasprintf(…);
> 
> For simple assignments, I too prefer the ternary operator, but in this case,
> I think it is better to leave the current code as is.

I agree with Suman, that's why I didn't use the conditional operator.

> 
> regards
> Suman
