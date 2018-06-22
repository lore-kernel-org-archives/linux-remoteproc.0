Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 22 Jun 2018 15:53:53 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v1 1/2] imx-rproc: dt: provide new remote-nodes option
Message-ID: <20180622225353.GL3402@tuxbook-pro>
References: <20180615115731.18424-1-o.rempel@pengutronix.de>
 <6888c986-1e6b-81dd-fb3a-e27218b1785a@st.com>
 <20180615163733.4bmpuag5dbzdqw2n@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180615163733.4bmpuag5dbzdqw2n@pengutronix.de>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Arnaud Pouliquen <arnaud.pouliquen@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>, kernel@pengutronix.de, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, dl-linux-imx <linux-imx@nxp.com>, Fabien DESSENNE <fabien.dessenne@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 15 Jun 09:37 PDT 2018, Oleksij Rempel wrote:

> Hi Arnaud,
> 
> On Fri, Jun 15, 2018 at 03:21:19PM +0200, Arnaud Pouliquen wrote:
> > Hi Oleksij,
> > 
> > Nice to see that we have the same needs.
> > We push several month ago an RFC based on something similar but i hope
> > more generic...
> > could you have a look?
> > 
> > https://www.spinics.net/lists/linux-remoteproc/msg01823.html
> 
> I took a look at dt binding.
> It would be really better to not redefine device nodes again.

Defining new nodes next to the proper (disabled) ones would only
duplicate the data and doesn't provide the means for preventing
conflicting usage.

> DT is providing HW description and if it is still the same IP core
> then most probably it is still the same from all CPUs.

The problem I see is that for every convenient case there's a lot of
cases where this doesn't work.

> Most probably there is different interrupt controller and memory
> offset, but all other parts should be the same.

This conclusion is what I've come to as well; clocks seems simple and
then it gets complicated. So what we would end up with is a mechanism
where we rely on some properties of the remote node representing the
resources of the remote processor, but other doesn't.

This becomes very complex to maintain...

> In long term it would be great to reduce duplicated information which is
> needed to added system developer.
> 

Agreed, but I don't think that adding a partial view of the remote
processor to the local system's hardware definition is going to make it
easier for said developer.

> > Could be nice if we could find a generic solution...
> 
> I would be happy to have generic solution. 
> 

Me too, and based on our discussions on the subject I think it's
important that we consider how to handle dynamically controlled
resources (though some RPMSG based resource management protocol) as
well - I don't want one mechanism for static clocks and a completely
different for dynamically controlled clocks.

Regards,
Bjorn
