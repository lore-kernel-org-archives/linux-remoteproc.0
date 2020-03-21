Date: Sat, 21 Mar 2020 10:57:33 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5] remoteproc: Fix NULL pointer dereference in
 rproc_virtio_notify
Message-ID: <20200321175729.GA52762@builder>
References: <20200306070325.15232-1-NShubin@topcon.com>
 <20200306072452.24743-1-NShubin@topcon.com>
 <6c7ef4f2-6f71-c2fb-b2e9-ad7cbeb7cfbc@st.com>
 <20200310120846.GA19430@topcon.com>
 <507197c5412e4b438aeb5c527be74b3a@SFHDAG3NODE1.st.com>
 <20200311200107.GZ1214176@minitux>
 <f6de2571-3541-7004-bc57-92cb3fef2c71@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6de2571-3541-7004-bc57-92cb3fef2c71@st.com>
To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc: Nikita Shubin <nshubin@topcon.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 17 Mar 07:24 PDT 2020, Arnaud POULIQUEN wrote:
> On 3/11/20 9:01 PM, Bjorn Andersson wrote:
> > On Tue 10 Mar 06:19 PDT 2020, Arnaud POULIQUEN wrote:
> >>> On Mon, Mar 09, 2020 at 03:22:24PM +0100, Arnaud POULIQUEN wrote:
> >>>> On 3/6/20 8:24 AM, Nikita Shubin wrote:
[..]
> >>>>> diff --git a/drivers/remoteproc/remoteproc_virtio.c
> >>>>> b/drivers/remoteproc/remoteproc_virtio.c
> >>>>> index 8c07cb2ca8ba..31a62a0b470e 100644
> >>>>> --- a/drivers/remoteproc/remoteproc_virtio.c
> >>>>> +++ b/drivers/remoteproc/remoteproc_virtio.c
> >>>>> @@ -334,6 +334,13 @@ int rproc_add_virtio_dev(struct rproc_vdev
> >>> *rvdev, int id)
> >>>>>  	struct rproc_mem_entry *mem;
> >>>>>  	int ret;
> >>>>>
> >>>>> +	if (rproc->ops->kick == NULL) {
> >>>>> +		ret = -EINVAL;
> >>>>> +		dev_err(dev, ".kick method not defined for %s",
> >>>>> +				rproc->name);
> >>>>> +		goto out;
> >>>>> +	}
> >>>>> +
> >>>> Should the kick ops be mandatory for all the platforms? How about making
> >>> it optional instead?
> >>>
> >>> Hi, Arnaud.
> >>>
> >>> It is not mandatory, currently it must be provided if specified vdev entry is in
> >>> resourse table. Otherwise it looks like there is no point in creating vdev.
> >>
> >> Yes, my question was about having it optional for vdev also. A platform could implement the vdev
> >> without kick mechanism but by polling depending due to hardware capability...
> >> This could be an alternative avoiding to implement a dummy function in platform driver.
> >>
> > 
> > Is this a real thing or a theoretical suggestion?
> Only a theoretical suggestion, trigged by the IMX platform patchset which implement a "temporary" dummy kick.
> and based on OpenAMP lib implementation which does not request a doorbell.
> Anyway no issue to keep it mandatory here. 
> 

Thanks for confirming. I've applied the patch, with Mathieu's ack, and
we can loosen up this requirement when we need it in the future.

Regards,
Bjorn
