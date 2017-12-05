Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 4 Dec 2017 22:46:11 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 3/5] remoteproc: Pass type of shutdown to subdev remove
Message-ID: <20171205064611.GM28761@minitux>
References: <20171130011644.9421-1-bjorn.andersson@linaro.org>
 <20171130011644.9421-4-bjorn.andersson@linaro.org>
 <6d6d01bb-f8f4-3380-c9ee-3d14c707bdf0@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d6d01bb-f8f4-3380-c9ee-3d14c707bdf0@st.com>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc: Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, Chris Lew <clew@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 01 Dec 06:50 PST 2017, Arnaud Pouliquen wrote:

> hello Bjorn,
> 
> Sorry for these late remarks/questions
> 

No worries, I'm happy to see you reading the patch!

> 
> On 11/30/2017 02:16 AM, Bjorn Andersson wrote:
[..]
> > diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
[..]
> > @@ -785,17 +785,17 @@ static int rproc_probe_subdevices(struct rproc *rproc)
> >  
> >  unroll_registration:
> >  	list_for_each_entry_continue_reverse(subdev, &rproc->subdevs, node)
> > -		subdev->remove(subdev);
> > +		subdev->remove(subdev, false);
> Why do you need to do a non graceful remove in this case? This could
> lead to side effect like memory leakage...
> 

Regardless of this being true or false resources should always be
reclaimed.

The reason for introducing this is that the modem in the Qualcomm
platforms implements persistent storage and it's preferred to tell it to
flush the latest data to the storage server (on the Linux side) before
pulling the plug. But in the case of a firmware crash this mechanism
will not be operational and there's no point in attempting this
"graceful shutdown".

[..]
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > index 44e630eb3d94..20a9467744ea 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -456,7 +456,7 @@ struct rproc_subdev {
> >  	struct list_head node;
> >  
> >  	int (*probe)(struct rproc_subdev *subdev);
> > -	void (*remove)(struct rproc_subdev *subdev);
> > +	void (*remove)(struct rproc_subdev *subdev, bool graceful);
> What about adding a new ops instead of a parameter, like a recovery
> callback?
> 

I think that for symmetry purposes it should be probe/remove in both
code paths. A possible alternative to the proposal would be to introduce
an operation "request_shutdown()" the would be called in the proposed
graceful code path.


However, in the Qualcomm SMD and GLINK (conceptually equivalent to
virtio-rpmsg) it is possible to open and close communication channels
and it's conceivable to see that the graceful case would close all
channels cleanly while the non-graceful case would just remove the rpmsg
devices (and leave the channel states/memory as is).

In this case a "request_shutdown()" would complicate things, compared to
the boolean.

Regards,
Bjorn
