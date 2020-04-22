Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Wed, 22 Apr 2020 15:29:27 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v2 15/17] remoteproc: Correctly deal with MCU
 synchronisation when changing FW image
Message-ID: <20200422212927.GA20503@xps15>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-16-mathieu.poirier@linaro.org>
 <91d38ff6a39f4e07838d1e85c392eb8f@SFHDAG7NODE2.st.com>
 <20200330232139.GF31331@xps15>
 <f08ca2c3-d2de-2b3c-4134-950ef0107029@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f08ca2c3-d2de-2b3c-4134-950ef0107029@ti.com>
To: Suman Anna <s-anna@ti.com>
Cc: Loic PALLARDY <loic.pallardy@st.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>, "peng.fan@nxp.com" <peng.fan@nxp.com>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Fabien DESSENNE <fabien.dessenne@st.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Suman,

On Tue, Mar 31, 2020 at 05:14:18PM -0500, Suman Anna wrote:
> Hi Mathieu,
> 
> On 3/30/20 6:21 PM, Mathieu Poirier wrote:
> > On Fri, Mar 27, 2020 at 01:50:18PM +0000, Loic PALLARDY wrote:
> >>
> >>> This patch prevents the firmware image from being displayed or changed
> >>> when
> >>> the remoteproc core is synchronising with an MCU. This is needed since
> >>> there is no guarantee about the nature of the firmware image that is loaded
> >>> by the external entity.
> >>>
> >>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >>> ---
> >>>  drivers/remoteproc/remoteproc_sysfs.c | 25
> >>> ++++++++++++++++++++++++-
> >>>  1 file changed, 24 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/remoteproc/remoteproc_sysfs.c
> >>> b/drivers/remoteproc/remoteproc_sysfs.c
> >>> index 7f8536b73295..4956577ad4b4 100644
> >>> --- a/drivers/remoteproc/remoteproc_sysfs.c
> >>> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> >>> @@ -13,9 +13,20 @@
> >>>  static ssize_t firmware_show(struct device *dev, struct device_attribute
> >>> *attr,
> >>>  			  char *buf)
> >>>  {
> >>> +	ssize_t ret;
> >>>  	struct rproc *rproc = to_rproc(dev);
> >>>
> >>> -	return sprintf(buf, "%s\n", rproc->firmware);
> >>> +	/*
> >>> +	 * In most instances there is no guarantee about the firmware
> >>> +	 * that was loaded by the external entity.  As such simply don't
> >>> +	 * print anything.
> >>> +	 */
> >>> +	if (rproc_sync_with_mcu(rproc))
> >>> +		ret = sprintf(buf, "\n");
> >> Is it enough to provide empty name, or should we add a message to indicate that's name is unkown/undefined ?
> >>
> > 
> > Don't know... It is easy to find plenty of cases in sysfs where null values are
> > represented with a "\n", and just as many where "unknown", "undefined" or "-1"
> > are used. I know GKH prefers the least amount of information as possible, hence
> > going with a "\n".
> > 
> > Again, no strong opinion...
> > 
> >> Regards,
> >> Loic
> >>> +	else
> >>> +		ret = sprintf(buf, "%s\n", rproc->firmware);
> >>> +
> >>> +	return ret;
> >>>  }
> >>>
> >>>  /* Change firmware name via sysfs */
> >>> @@ -33,6 +44,18 @@ static ssize_t firmware_store(struct device *dev,
> >>>  		return -EINVAL;
> >>>  	}
> >>>
> >>> +	/*
> >>> +	 * There is no point in trying to change the firmware if the MCU
> >>> +	 * is currently running or if loading of the image is done by
> >>> +	 * another entity.
> >>> +	 */
> >>> +	if (rproc_sync_with_mcu(rproc)) {
> >>> +		dev_err(dev,
> >>> +			"can't change firmware while synchronising with
> >>> MCU\n");
> >>> +		err = -EBUSY;
> >>> +		goto out;
> >>> +	}
> >>> +
> 
> So, I have done a patch sometime back to deny sysfs operations [1] (the
> primary usecase is for a rproc-client driver driven boot where auto-boot
> is not set) which is still a need for me. Do you see that as orthogonal
> to that, or can we leverage that here somehow. I cannot use the sync_
> conditions for my cases since they are not already booted before.

No matter how much I try to fit the functionality provided by the
"deny_sysfs_ops" flag in the patch you pointed out, I just can't come up with
something I am happy with.

The only thing the topics of remote processor synchronisation and kernel
initiated remote processor boot have in common is preventing sysfs access under
specific circumstances.  As such it is probably best to keep their implemenation
seperated for the time being.

Thanks,
Mathieu

> 
> Also, any reason why you want to do this check before the rproc->state
> unlike the logic around the 'state' file in the next patch?
> 
> [1] https://patchwork.kernel.org/patch/10601325/
> 
> regards
> Suman
> 
> >>>  	if (rproc->state != RPROC_OFFLINE) {
> >>>  		dev_err(dev, "can't change firmware while running\n");
> >>>  		err = -EBUSY;
> >>> --
> >>> 2.20.1
> >>
> 
