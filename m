Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 6 Dec 2017 13:53:17 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 3/5] remoteproc: Pass type of shutdown to subdev remove
Message-ID: <20171206215317.GS28761@minitux>
References: <20171130011644.9421-1-bjorn.andersson@linaro.org>
 <20171130011644.9421-4-bjorn.andersson@linaro.org>
 <6d6d01bb-f8f4-3380-c9ee-3d14c707bdf0@st.com>
 <20171205064611.GM28761@minitux>
 <516ab4fc-f1c9-574b-3ca7-a6c3c6667358@st.com>
 <20171205171717.GN28761@minitux>
 <0c4e7c5a-bfbf-cc41-756c-9b1f0ebfc5ef@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c4e7c5a-bfbf-cc41-756c-9b1f0ebfc5ef@st.com>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc: Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, Chris Lew <clew@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 06 Dec 00:55 PST 2017, Arnaud Pouliquen wrote:

> Hello,
> 
> I saw your new version but i 'm answering to this one to continue
> discussion.
> 

That's fine.

> On 12/05/2017 06:17 PM, Bjorn Andersson wrote:
> > On Tue 05 Dec 02:54 PST 2017, Arnaud Pouliquen wrote:
> >> On 12/05/2017 07:46 AM, Bjorn Andersson wrote:
> >>> On Fri 01 Dec 06:50 PST 2017, Arnaud Pouliquen wrote:
> >>>>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> >>>>> index 44e630eb3d94..20a9467744ea 100644
> >>>>> --- a/include/linux/remoteproc.h
> >>>>> +++ b/include/linux/remoteproc.h
> >>>>> @@ -456,7 +456,7 @@ struct rproc_subdev {
> >>>>>  	struct list_head node;
> >>>>>  
> >>>>>  	int (*probe)(struct rproc_subdev *subdev);
> >>>>> -	void (*remove)(struct rproc_subdev *subdev);
> >>>>> +	void (*remove)(struct rproc_subdev *subdev, bool graceful);
> >>>> What about adding a new ops instead of a parameter, like a recovery
> >>>> callback?
> >>>>
> >>>
> >>> I think that for symmetry purposes it should be probe/remove in both
> >>> code paths. A possible alternative to the proposal would be to introduce
> >>> an operation "request_shutdown()" the would be called in the proposed
> >>> graceful code path.
> >>>
> >>>
> >>> However, in the Qualcomm SMD and GLINK (conceptually equivalent to
> >>> virtio-rpmsg) it is possible to open and close communication channels
> >>> and it's conceivable to see that the graceful case would close all
> >>> channels cleanly while the non-graceful case would just remove the rpmsg
> >>> devices (and leave the channel states/memory as is).
> >>>
> >>> In this case a "request_shutdown()" would complicate things, compared to
> >>> the boolean.
> >>>
> >> I would be more for a specific ops that inform sub-dev on a crash. This
> >> would allow sub-dev to perform specific action (for instance dump) and
> >> store crash information, then on remove, sub_dev would perform specific
> >> action.
> > 
> > There is a separate discussion (although dormant) on how to gather core
> > dumps, which should cover these cases.
> > 
> >> This could be something like "trigger_recovery" that is propagated to
> >> the sub-dev.
> >>
> > 
> > Right, this step does make sense, but is the opposite of what I need -
> > i.e. a means to trigger a clean shutdown.
> Could you clarify this point? i do not see my proposal as the opposite.
> In your proposal:
> - rproc_trigger_recovery: graceful is set to false
> - rproc_shutdown: Graceful is set to true
> 

Correct

> My proposal is to call an new ops (if defined) before the stop in
> rproc_trigger_recovery. If you set a local variable in Qualcomm subdev
> drivers this should do the job for your need.
> 

In all use cases that comes to mind the gracefulness makes one step of
the teardown operation kick in/be optional, it's not a separate
operation. I don't see the benefit of enforcing the subdev to keep this
state.

> I tried to have a look in Qualcomm part to understand implementation.
> but seems that you just add the parameter for time being.
> 

The following patch, adding sysmon, make use of this. But I have yet to
post patches that affects the SMD and GLINK implementations.

> I think that main point that bother me here, is the that the "graceful"
> mode should be the normal mode. And in your implementation this look
> like the exception mode.

I agree, I consider the recovery path to be the exception, but I'm not
seeing the necessity of making the "true" state of this parameter mean
"yes we have an exception".

Regardless of the value here, the remove() function's purpose is to
clean up resources/state. But in the case of a graceful shutdown (i.e.
not recovery path) the subdevices can be expected to tear things down in
a fashion that permits the remote side to act, so if anything this
"true" would imply that this extra steps should be taken.

> Perhaps more a feeling than anything else...but if you decide to keep
> argument i would propose to inverse logic using something like
> "rproc_crashed"  instead of "graceful".
> 

The difference between "this is a graceful shutdown, let's inform the
remote" and "this is not a crash, let's inform the remote". The prior
sounds much more to the point in my view.

> > 
> >> That would sound more flexible from my point of view.
> >>
> > 
> > At this point I see this flexibility as unnecessary complexity, if such
> > need show up (beyond the core dump gathering) we should bring this up
> > again.
> 
> I let you decide what is the best solution.
> My concerns is to be sure that your solution is enough generic and not
> too Qualcomm platform oriented.

That's a fair concern. I'm very interested in finding more complex use
cases that requires this type of logic, to see if this is generic
enough.

Note that the discussions that we've had related to e.g. clocks that
should be on during the life of the remote would not fit into the
current subdev life cycle anyways, so this either needs to be
complemented or extended.

> As you mentioned in OpenAMP meeting it is quite difficult to come back
> on an implementation , especially if it impacts the API.
> 

No, what I said is that it's impossible to go back once we have changed
the file format, the interface towards the remote or the interface
towards user space. All it takes to change an interface within the
kernel is a single patch.

Regards,
Bjorn
