Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Mon, 30 Mar 2020 17:21:39 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v2 15/17] remoteproc: Correctly deal with MCU
 synchronisation when changing FW image
Message-ID: <20200330232139.GF31331@xps15>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-16-mathieu.poirier@linaro.org>
 <91d38ff6a39f4e07838d1e85c392eb8f@SFHDAG7NODE2.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91d38ff6a39f4e07838d1e85c392eb8f@SFHDAG7NODE2.st.com>
To: Loic PALLARDY <loic.pallardy@st.com>
Cc: "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>, "s-anna@ti.com" <s-anna@ti.com>, "peng.fan@nxp.com" <peng.fan@nxp.com>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Fabien DESSENNE <fabien.dessenne@st.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Mar 27, 2020 at 01:50:18PM +0000, Loic PALLARDY wrote:
> 
> 
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: mardi 24 mars 2020 22:46
> > To: bjorn.andersson@linaro.org
> > Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
> > anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
> > <arnaud.pouliquen@st.com>; Fabien DESSENNE
> > <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
> > Subject: [PATCH v2 15/17] remoteproc: Correctly deal with MCU
> > synchronisation when changing FW image
> > 
> > This patch prevents the firmware image from being displayed or changed
> > when
> > the remoteproc core is synchronising with an MCU. This is needed since
> > there is no guarantee about the nature of the firmware image that is loaded
> > by the external entity.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/remoteproc_sysfs.c | 25
> > ++++++++++++++++++++++++-
> >  1 file changed, 24 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_sysfs.c
> > b/drivers/remoteproc/remoteproc_sysfs.c
> > index 7f8536b73295..4956577ad4b4 100644
> > --- a/drivers/remoteproc/remoteproc_sysfs.c
> > +++ b/drivers/remoteproc/remoteproc_sysfs.c
> > @@ -13,9 +13,20 @@
> >  static ssize_t firmware_show(struct device *dev, struct device_attribute
> > *attr,
> >  			  char *buf)
> >  {
> > +	ssize_t ret;
> >  	struct rproc *rproc = to_rproc(dev);
> > 
> > -	return sprintf(buf, "%s\n", rproc->firmware);
> > +	/*
> > +	 * In most instances there is no guarantee about the firmware
> > +	 * that was loaded by the external entity.  As such simply don't
> > +	 * print anything.
> > +	 */
> > +	if (rproc_sync_with_mcu(rproc))
> > +		ret = sprintf(buf, "\n");
> Is it enough to provide empty name, or should we add a message to indicate that's name is unkown/undefined ?
>

Don't know... It is easy to find plenty of cases in sysfs where null values are
represented with a "\n", and just as many where "unknown", "undefined" or "-1"
are used. I know GKH prefers the least amount of information as possible, hence
going with a "\n".

Again, no strong opinion...

> Regards,
> Loic
> > +	else
> > +		ret = sprintf(buf, "%s\n", rproc->firmware);
> > +
> > +	return ret;
> >  }
> > 
> >  /* Change firmware name via sysfs */
> > @@ -33,6 +44,18 @@ static ssize_t firmware_store(struct device *dev,
> >  		return -EINVAL;
> >  	}
> > 
> > +	/*
> > +	 * There is no point in trying to change the firmware if the MCU
> > +	 * is currently running or if loading of the image is done by
> > +	 * another entity.
> > +	 */
> > +	if (rproc_sync_with_mcu(rproc)) {
> > +		dev_err(dev,
> > +			"can't change firmware while synchronising with
> > MCU\n");
> > +		err = -EBUSY;
> > +		goto out;
> > +	}
> > +
> >  	if (rproc->state != RPROC_OFFLINE) {
> >  		dev_err(dev, "can't change firmware while running\n");
> >  		err = -EBUSY;
> > --
> > 2.20.1
> 
