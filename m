Date: Fri, 10 Apr 2020 18:16:12 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: core: Add a memory efficient coredump
 function
Message-ID: <20200411011609.GE576963@builder.lan>
References: <1585353412-19644-1-git-send-email-rishabhb@codeaurora.org>
 <20200401195114.GD267644@minitux>
 <20200402172435.GA2785@xps15>
 <20200403051611.GJ663905@yoga>
 <CANLsYkzqg=ksv46ZO7=2Vd1Li8sbSwD2uzSjSPfxFj0BQgPNvA@mail.gmail.com>
 <20200409202714.GT20625@builder.lan>
 <bb11115e-ce13-eeda-9b29-a75a030f4c98@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb11115e-ce13-eeda-9b29-a75a030f4c98@st.com>
To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Rishabh Bhatnagar <rishabhb@codeaurora.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-remoteproc <linux-remoteproc@vger.kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, psodagud@codeaurora.org, tsoni@codeaurora.org, Siddharth Gupta <sidgup@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 10 Apr 03:31 PDT 2020, Arnaud POULIQUEN wrote:

> 
> 
> On 4/9/20 10:27 PM, Bjorn Andersson wrote:
> > On Fri 03 Apr 13:53 PDT 2020, Mathieu Poirier wrote:
> > 
> >> On Thu, 2 Apr 2020 at 23:16, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
> >>>
> >>> On Thu 02 Apr 10:24 PDT 2020, Mathieu Poirier wrote:
[..]
> >> We are currently discussing the addition of a character driver [1]...
> >> The file_operations could be platform specific so any scenario can be
> >> implemented, whether it is switching on/off a remote processor in the
> >> open/release() callback or setting the behavior of the coredump
> >> functionality in an ioctl().
> > 
> > The main benefit of tying this to the character device would be that the
> > behavior could be reverted on release(). But this would imply that the
> > application starting and stopping the remoteproc is also the one
> > collecting ramdumps and it would also imply that there exists such an
> > application (e.g. this functionality is still desirable for auto_booted
> > remoteprocs).
> 
> What about to have a dedicated sub device for the coredump, with its own
> interface (sysfs or char dev)?

I did consider this when reviewing the support we have now, but I didn't
see a way to make it reliably run inbetween the stop and start during a
recovery.
Now we have the rproc_unprepare_subdevices(), so that might have worked
out, although you probably only want this when crashed = true.

That said, I don't think you should see subdevice == device here, we can
create a new device (to host the sysfs attribute) regardless of it being
a "subdevice" or not. I do however not see that the two* booleans
warrants the complexity a new device comes with.

[*] enable/disable and inline/offline coredump mode (which is actually 3
states)

> Then kernel configs could enable/disable the driver and set the mode.

It's not adequate to depend on compilation options, we really want these
features to be functional in a multiplatform kernel (e.g. upstream
arm64 defconfig)

But for certain resource constraint devices, where alternative means of
debugging the remoteprocs exists it does make sense to be able to
disable the coredumps altogether, so I think we should move the coredump
functionality out of core.c and include it conditionally using Kconfig.

> This could help to decorrelate the coredump and the recovery and manage
> different behaviors for debug, production and final product.
> 
> > 
> > Finally I think it's likely that the existing tools for collecting
> > devcoredump artifacts are expected to just continue to work after this
> > change - in both modes.
> agree
> > 
> > 
> > 
> > On the functionality Rishabh proposes, it would be very interesting to
> > hear from others on their usage and need for coredumps.
> Concerning the stm32 platform the usage will depend on customer choice,
> as they implement their own remote firmware. So i suppose that the needs would be:
> - to enable /disable the coredump depending onproject phases(dev, production,
>   final product)
> - to perform a post-mortem analysis:
>    - remote proc trace
>    - code and associated data section analysis
>  

Sounds good, then from where we are now we at least need to allow
disabling of the coredump collection.

> > 
> > E.g. are Qualcomm really the only ones that has issues with
> > vmalloc(sizeof(firmware)) failing and preventing post mortem debugging
> > in low-memory scenarios? Or does others simply not care to debug
> > remoteproc firmware in these cases? Is debugging only done using JTAG?
> > 
> >> I think there is value in exploring different opportunities so that we
> >> keep the core as clean and simple as possible.
> >>
> > 
> > I agree, but hadn't considered this fully. In particular with the
> > changes I'm asking Rishabh to make we have a few screen fulls of code
> > involved in the coredump handling. So I think it would be beneficial to
> > move this into a remoteproc_coredump.c.
> 
> Agree, i would also consider a separate device (but perhaps in a second step). 
> 
> One challenge of having a separate device is that we need to ensure that
> everything is ready(probed) before starting the firmware especially for the
> autoboot mode.
> Component bind/unbind mechanism could help to synchronize sub device with
> rproc device on start and stop.
> FYI, I plan to sent a RFC soon (internal review on going) about the 
> de-correlation of the rproc virtio that also introduces the component
> bind/unbind mechanism in rproc core.
> 

This sounds quite interesting. I'm not sure about turning the coredump
handling into its own device and use this for decoupling it from the
core, but I'm looking forward to see your patches.

Regards,
Bjorn
