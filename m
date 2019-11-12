Date: Tue, 12 Nov 2019 10:22:42 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2] remoteproc: stm32: fix probe error case
Message-ID: <20191112182239.GA21530@yoga>
References: <1570433991-16353-1-git-send-email-fabien.dessenne@st.com>
 <20191111220416.GB3108315@builder>
 <392808fa-1504-233f-234b-0cca21886c17@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <392808fa-1504-233f-234b-0cca21886c17@st.com>
To: Fabien DESSENNE <fabien.dessenne@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, Loic PALLARDY <loic.pallardy@st.com>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 12 Nov 06:09 PST 2019, Fabien DESSENNE wrote:

> Hi Bjorn,
> 
> 
> On 11/11/2019 11:04 PM, Bjorn Andersson wrote:
> > On Mon 07 Oct 00:39 PDT 2019, Fabien Dessenne wrote:
> >
> >> If the rproc driver is probed before the mailbox driver and if the rproc
> >> Device Tree node has some mailbox properties, the rproc driver probe
> >> shall be deferred instead of being probed without mailbox support.
> >>
> >> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> >> ---
> >> Changes since v1: test IS_ERR() before checking PTR_ERR()
> >> ---
> >>   drivers/remoteproc/stm32_rproc.c | 10 ++++++++--
> >>   1 file changed, 8 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> >> index 2cf4b29..a507332 100644
> >> --- a/drivers/remoteproc/stm32_rproc.c
> >> +++ b/drivers/remoteproc/stm32_rproc.c
> >> @@ -310,7 +310,7 @@ static const struct stm32_mbox stm32_rproc_mbox[MBOX_NB_MBX] = {
> >>   	}
> >>   };
> >>   
> >> -static void stm32_rproc_request_mbox(struct rproc *rproc)
> >> +static int stm32_rproc_request_mbox(struct rproc *rproc)
> >>   {
> >>   	struct stm32_rproc *ddata = rproc->priv;
> >>   	struct device *dev = &rproc->dev;
> >> @@ -329,10 +329,14 @@ static void stm32_rproc_request_mbox(struct rproc *rproc)
> >>   
> >>   		ddata->mb[i].chan = mbox_request_channel_byname(cl, name);
> >>   		if (IS_ERR(ddata->mb[i].chan)) {
> >> +			if (PTR_ERR(ddata->mb[i].chan) == -EPROBE_DEFER)
> >> +				return -EPROBE_DEFER;
> > If for some reason you get EPROBE_DEFER when i > 0 you need to
> > mbox_free_channel() channels [0..i) before returning.
> 
> The mailbox framework returns EPROBE_DIFFER to inform that the mailbox 
> provider has not registered yet. I do not expected to have a success 
> followed by a EPROBE_DEFER error.
> 
> But in the very special case where we use two different mailbox 
> providers this may happen.
> 

I agree, it's unlikely to ever cause any problems...

> I will send an updated version, thanks for pointing this.
> 

I appreciate that.

Thanks,
Bjorn

> BR
> 
> Fabien
> 
> >
> > Regards,
> > Bjorn
> >
> >>   			dev_warn(dev, "cannot get %s mbox\n", name);
> >>   			ddata->mb[i].chan = NULL;
> >>   		}
> >>   	}
> >> +
> >> +	return 0;
> >>   }
> >>   
> >>   static int stm32_rproc_set_hold_boot(struct rproc *rproc, bool hold)
> >> @@ -596,7 +600,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
> >>   	if (ret)
> >>   		goto free_rproc;
> >>   
> >> -	stm32_rproc_request_mbox(rproc);
> >> +	ret = stm32_rproc_request_mbox(rproc);
> >> +	if (ret)
> >> +		goto free_rproc;
> >>   
> >>   	ret = rproc_add(rproc);
> >>   	if (ret)
> >> -- 
> >> 2.7.4
> >>
