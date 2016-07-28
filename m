Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 28 Jul 2016 10:32:11 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: Ongoing remoteproc discussions
Message-ID: <20160728173211.GS13516@tuxbot>
References: <20160718231011.GK13516@tuxbot>
 <20160725122639.GB4278@griffinp-ThinkPad-X1-Carbon-2nd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160725122639.GB4278@griffinp-ThinkPad-X1-Carbon-2nd>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Sarangdhar Joshi <spjoshi@codeaurora.org>, Loic PALLARDY <loic.pallardy@st.com>, Eric FINCO <eric.finco@st.com>, Russell Wayman <russell.wayman@linaro.org>, Matthew Locke <matthew.locke@linaro.org>, Kumar Gala <kumar.gala@linaro.org>, Bill Fletcher <bill.fletcher@linaro.org>, Puja Gupta <pujag@codeaurora.org>, Ohad Ben-Cohen <ohad@wizery.com>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 25 Jul 05:26 PDT 2016, Peter Griffin wrote:

> Hi Bjorn,
> 
> On Mon, 18 Jul 2016, Bjorn Andersson wrote:
> 
> > During discussions with various people interested in moving their
> > remoteproc-related out-of-tree patches towards mainline I have come
> > across a set of topics common among various teams. The purpose of this
> > email is to share some insight into these discussions and the current
> > ideas for moving forward.
> > 
> > == Auto-boot or always-on:
> > There are cases where we want to achieve the current auto-boot mechanism
> > without rpmsg and there are cases where we don't want to auto-boot a
> > remoteproc just because its resource table contains rpmsg entries. So we
> > need to decouple this logic from the vdev. I suggest that:
> > 
> > * We introduce a property in the rproc struct where drivers can toggle
> >   if they want always-on or not. We default this to true, as an estimate
> >   of backwards compatibility.
> > 
> > * We move the allocation of vrings to be done at the time of the other
> >   allocations and follow that with the registration of virtio devices,
> >   before actually booting the rproc. And we tear down the virtio devices
> >   as part of shutdown.
> > 
> > * We remove the rproc_boot()/shutdown() calls from the
> >   remoteproc_virtio.c and based on rproc->always_on we call these in the
> >   async firmware loader callback, in rproc_trigger_recovery() and
> >   rproc_del().
> 
> What happens in the built-in case where firnmware isn't available until rootfs
> is mounted? In this case async fw load will have failed. 
> 

As the only purpose of the async callback becomes triggering the boot I
believe the result will be that the processor didn't boot. Beyond that I
think we're into the question below of late firmware, something we need
to discuss more.


With the current implementation one difference that we would have is
that we must dereference the rproc according to this in recover and
rproc_del(). But I think those needs some TLC anyways, to be more robust.

> > 
> > 
> > A side effect of this is that the async firmware loading only purpose is
> > to trigger the boot as the firmware becomes available (something we need
> > to tweak further). I therefor see no reason to mandate the firmware is
> > unchanged between boots, which simplifies the posed rproc_set_firmware()
> > function - as long as it's done on a remoteproc that's not always_on.
> > 
> > 
[..]
> > == Firmware from late mounted file systems (needs discussion):
> > Typical for most remoteproc systems seems to be that the firmware files
> > tend to be way to large for being stored in a initramfs.
> 
> In the case of fdma the firmware is actually very small. I think for my usecase
> I would be best off putting the fdma firmware in the initramfs and then all
> the current issues with async fw, deferred probe  and late rootfs will go away.
> 
> If some better solution in remoteproc comes along in the future fdma can migrate
> over to using it.
> 

There are cases where this can be done, but it's something we must deal
with for most of them.

> > The two
> > available mechanisms for dealing with this is to build remoteproc
> > drivers as modules and relying on CONFIG_FW_LOADER_USER_HELPER_FALLBACK;
> > the latter is being frowned upon by everyone but works fairly well for
> > our purpose.
> 
> I agree has worked well for me in the past, but is frowned upon.
> > 
> > Forcing systems to compile remoteproc drivers as modules to achieve the
> > delayed firmware load is not acceptable in my view.
> 
> Agree again.
> 
> > 
> > So we need to come up with some mechanism for triggering auto-booting
> > when firmware files are stored in a lately mounted file system.
> 
> One approach I've looked at is using -EPROBE_DEFER in the client driver (in my
> case dmaengine) if rproc_boot() can't find the firmware.
> 
> This does require a couple of changes to get working with mainline though: -
> 
> 1) rproc async fw mechanism in rproc_add_virtio_devices() will have failed,
>    so resource table parsing needs to be re-tried in rproc_boot(). See here
>     http://thread.gmane.org/gmane.linux.ports.arm.kernel/512079
> 
> 2) It requires a change in drivers-core to re-run deferred probes after
> rootfs has been mounted. See here https://lkml.org/lkml/2016/7/12/503.
> 
> With those two changes the deferred approach works well. It also has the benefit
> of not allowing devices to be registered which can never work due to missing
> firmware. In my case ALSA ASoC will be deffered until dma which it relies upon
> to work has its firmware in place.
> 

I'm not much in favor of using EPROBE_DEFER as an indicator of the
firmware might be available and I'm not sure we can make it work in a
sane way for the always-on/auto-boot cases.

> One other quick question, you haven't mentioned subdev carveout here? Are you ok
> with me re-submitting fdma series as it is currently, and we can migrate over to
> using subdev careout if / when it gets merged in the future?
> 

I don't remember the details of your resources, but I would prefer if
we can get the driver merged separate of any remoteproc improvements.

Thanks for your feedback!

Regards,
Bjorn
