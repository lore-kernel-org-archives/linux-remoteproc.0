Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 5 Dec 2017 09:17:17 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 3/5] remoteproc: Pass type of shutdown to subdev remove
Message-ID: <20171205171717.GN28761@minitux>
References: <20171130011644.9421-1-bjorn.andersson@linaro.org>
 <20171130011644.9421-4-bjorn.andersson@linaro.org>
 <6d6d01bb-f8f4-3380-c9ee-3d14c707bdf0@st.com>
 <20171205064611.GM28761@minitux>
 <516ab4fc-f1c9-574b-3ca7-a6c3c6667358@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <516ab4fc-f1c9-574b-3ca7-a6c3c6667358@st.com>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc: Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, Chris Lew <clew@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 05 Dec 02:54 PST 2017, Arnaud Pouliquen wrote:

> 
> 
> On 12/05/2017 07:46 AM, Bjorn Andersson wrote:
> > On Fri 01 Dec 06:50 PST 2017, Arnaud Pouliquen wrote:
> > 
> >> hello Bjorn,
> >>
> >> Sorry for these late remarks/questions
> >>
> > 
> > No worries, I'm happy to see you reading the patch!
> > 
> >>
> >> On 11/30/2017 02:16 AM, Bjorn Andersson wrote:
> > [..]
> >>> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> > [..]
> >>> @@ -785,17 +785,17 @@ static int rproc_probe_subdevices(struct rproc *rproc)
> >>>  
> >>>  unroll_registration:
> >>>  	list_for_each_entry_continue_reverse(subdev, &rproc->subdevs, node)
> >>> -		subdev->remove(subdev);
> >>> +		subdev->remove(subdev, false);
> >> Why do you need to do a non graceful remove in this case? This could
> >> lead to side effect like memory leakage...
> >>
> > 
> > Regardless of this being true or false resources should always be
> > reclaimed.
> > 
> > The reason for introducing this is that the modem in the Qualcomm
> > platforms implements persistent storage and it's preferred to tell it to
> > flush the latest data to the storage server (on the Linux side) before
> > pulling the plug. But in the case of a firmware crash this mechanism
> > will not be operational and there's no point in attempting this
> > "graceful shutdown".
> I understand your usecase for Qualcomm, but in rproc_probe_subdevices
> there is not crash of the remote firmware , so remove should be graceful.
> 

Now I get your point, sorry. I agree with you, as this is triggering a
clean stop of the system this should be marked "graceful".

Will update, thanks.

> > 
> > [..]
> >>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> >>> index 44e630eb3d94..20a9467744ea 100644
> >>> --- a/include/linux/remoteproc.h
> >>> +++ b/include/linux/remoteproc.h
> >>> @@ -456,7 +456,7 @@ struct rproc_subdev {
> >>>  	struct list_head node;
> >>>  
> >>>  	int (*probe)(struct rproc_subdev *subdev);
> >>> -	void (*remove)(struct rproc_subdev *subdev);
> >>> +	void (*remove)(struct rproc_subdev *subdev, bool graceful);
> >> What about adding a new ops instead of a parameter, like a recovery
> >> callback?
> >>
> > 
> > I think that for symmetry purposes it should be probe/remove in both
> > code paths. A possible alternative to the proposal would be to introduce
> > an operation "request_shutdown()" the would be called in the proposed
> > graceful code path.
> > 
> > 
> > However, in the Qualcomm SMD and GLINK (conceptually equivalent to
> > virtio-rpmsg) it is possible to open and close communication channels
> > and it's conceivable to see that the graceful case would close all
> > channels cleanly while the non-graceful case would just remove the rpmsg
> > devices (and leave the channel states/memory as is).
> > 
> > In this case a "request_shutdown()" would complicate things, compared to
> > the boolean.
> > 
> I would be more for a specific ops that inform sub-dev on a crash. This
> would allow sub-dev to perform specific action (for instance dump) and
> store crash information, then on remove, sub_dev would perform specific
> action.

There is a separate discussion (although dormant) on how to gather core
dumps, which should cover these cases.

> This could be something like "trigger_recovery" that is propagated to
> the sub-dev.
> 

Right, this step does make sense, but is the opposite of what I need -
i.e. a means to trigger a clean shutdown.

> That would sound more flexible from my point of view.
> 

At this point I see this flexibility as unnecessary complexity, if such
need show up (beyond the core dump gathering) we should bring this up
again.

Regards,
Bjorn
