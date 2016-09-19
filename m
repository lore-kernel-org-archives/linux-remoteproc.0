Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 19 Sep 2016 16:24:41 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/4] remoteproc: Introduce auto-boot flag
Message-ID: <20160919232441.GJ21438@tuxbot>
References: <1470952373-4823-1-git-send-email-bjorn.andersson@linaro.org>
 <ba437b4f-dde3-8def-afe2-472430b750e6@ti.com>
 <20160908222709.GA405@tuxbot>
 <1cef21a3-2517-4995-06d4-bd5defa13662@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1cef21a3-2517-4995-06d4-bd5defa13662@ti.com>
To: Suman Anna <s-anna@ti.com>
Cc: linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 16 Sep 16:58 PDT 2016, Suman Anna wrote:

> Hi Bjorn,
> 
> On 09/08/2016 05:27 PM, Bjorn Andersson wrote:
> > On Wed 31 Aug 11:27 PDT 2016, Suman Anna wrote:
> > 
> >> Hi Bjorn,
> >>
> >> On 08/11/2016 04:52 PM, Bjorn Andersson wrote:
> >>> Introduce an "auto-boot" flag on rprocs to make it possible to flag
> >>> remote processors without vdevs to automatically boot once the firmware
> >>> is found.
> >>>
> >>> Preserve previous behavior of the wkup_m3 processor being explicitly
> >>> booted by a consumer.
> >>>
> >>> Cc: Lee Jones <lee.jones@linaro.org>
> >>> Cc: Loic Pallardy <loic.pallardy@st.com>
> >>> Cc: Suman Anna <s-anna@ti.com>
> >>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >>> ---
> >>>
> >>> Changes since v1:
> >>> - s/always_on/auto_boot/
> >>> - Fixed double increment of "power" in recover path
> >>> - Marked wkup_m3 to not auto_boot
> >>>
> >>
> >> I am seeing various issues with this series as I am testing this series
> >> more thoroughly with various TI remoteproc drivers and IPC stacks based
> >> on virtio devices. I use very simple firmware images that publishes the
> >> rpmsg-client-sample devices, so that I can use the kernel
> >> rpmsg_client_sample to test the communication.
> >>
> > 
> > Thanks for bringing these up!
> > 
> >> Here's a summary of the main issues:
> >>
> >> 1. The rproc_boot holds a module reference count to the remoteproc
> >> platform driver so that it cannot be removed when a remote processor is
> >> booted. The previous architecture allowed virtio_rpmsg_bus or the
> >> platform remoteproc driver to be installed independent of each other
> >> with the boot actually getting triggered when the virtio_rpmsg_bus gets
> >> probed in find_vqs. The boot now happens when just the platform
> >> remoteproc driver is installed independent of virtio_rpmsg_bus and
> >> results in holding self-reference counts. This makes it impossible to
> >> remove the remoteproc platform module cleanly (we shouldn't be imposing
> >> force remove), which means we can't stop the remoteprocs properly.
> >>
> > 
> > I've always found the dependency on rpmsg awkward and don't like this
> > behavior to depend on the firmware content, but rather on some sort of
> > system configuration.
> > 
> > That said, I did not intend to break the ability of shutting down and
> > unloading the module.
> 
> The remoteproc infrastructure always allowed the boot to be done by an
> external module

The only caller of rproc_boot() in the mainline kernel is the
wkup_m3_ipc, which spawns a thread and waits for the remoteproc-internal
completion that indicates when the firmware is available and then call
rproc_boot().

I'm afraid I would much prefer the wkup_m3_rproc to just set auto-boot
and not work around the design like this.


That said, we still provide the support for this.

> (with vdevs, it looks intrinsic because of the
> invocation in remoteproc_virtio.c, but the boot was really triggered
> during virtio_rpmsg probe)

Except for the fact that the first vdev does this as a direct result of
the call from rproc_fw_config_virtio().

As stated above, the only other caller of rproc_boot() is the wkup_m3
driver and although it's not executing in the context of
rproc_fw_config_virtio() it's directly tied into its execution.

> and provided protection against removing the remoteproc driver removal
> when you had a consumer.  I tried the auto-boot when I was upstreaming
> the wkup_m3_rproc driver and it was rejected for exactly this reason.

One of the problems I have with the design chosen in the wkup_m3 case is
if you had to deal with crash recovery, how would you sync the
wkup_m3_ipc driver operations to the async recovery?

Flipping this the other way around and accepting that the "function
device" follows the RPROC_RUNNING state of the rproc implicitly would
allow this.

> 
> > Calling rmmod on your rproc module is a rather explicit operation, do
> > you know why there's a need to hold the module reference? Wouldn't it be
> > cleaner to just shutdown the remoteproc as the module is being removed -
> > which would include tearing down all children (rpmsg and others)
> 
> Right, the introduction of the auto-boot ended up in a self-holding
> reference count which should be fixed to allow you to remove the module.
> The external module boot is still a valid usage (when auto_boot is
> false) though.

The way this is dealt with in other subsystems is that when a client
acquire a handle to something exposed by the implementation it will
reference the implementation.

With remoteproc I can acquire a reference to a remoteproc, then unload
the implementation and when the client calls rproc_boot() the core will
try to dereference dev->parent->driver->owner to try_module_get() it; if
we're lucky that will fail as the driver is gone, but I would assume we
would panic here instead, as driver is no longer a valid pointer.

> 
> > 
> > I expect to be able to compile rpmsg into my kernel and still be able to
> > unload my remoteproc module.
> > 
> >> 2. The reversal of boot between virtio_rpmsg_bus and remoteproc core
> >> also meant that the virtio devices and therefore the memory for vrings
> >> are allocated at the time virtio_rpmsg_bus is probed in find_vqs(). The
> >> remoteproc can be booted without the virtio_rpmsg_bus module installed.
> >> We do use the allocated dma addresses of the vrings in the published
> >> resource table, but now the remote processor is up even before these
> >> values are filled in. I had to actually move up the rproc_alloc_vring
> >> alongside rproc_parse_vring to have the communication up.
> >>
> > 
> > This also means that for a piece of firmware that exposes more than one
> > virtio device we would have the same race.
> 
> Yes, if you had more virtio devices technically. The remoteproc
> infrastructure so far hadn't supported more than one vdev.

I don't see anything preventing you from putting more than one vdev in
your resource table. There will however be a race on getting the vrings
allocated before the firmware needs them.

> We did
> support that in our downstream kernel but that was for a non-SMP usage
> on a dual-core remoteproc subsystem and the virtio devices were still
> virtio_rpmsg devices, so it scaled for us when we removed the
> virtio_rpmsg_bus module as long as the reference counts were managed in
> rproc_boot and rproc_shutdown()
> 

I think the shutdown case would work in either way, but the behavior of
rmmod rpmsg && insmod rpmsg still depends on other things.

> > 
> > As you say it makes more sense to allocate the vrings as we set up the
> > other resources.
> > 
> >> 3. The remoteproc platform driver cannot be removed previously when the
> >> corresponding virtio devices are probed/configured properly and all the
> >> communication flow w.r.t rpmsg channel publishing followed from the
> >> remoteproc boot. These channels are child devices of the parent virtio
> >> devices, and since the remoteproc boot/shutdown followed the virtio
> >> device probe/removal lifecycle, the rpmsg channels life-cycle followed
> >> that of the parent virtio device. My communication paths are now failing
> >> if I remove the virtio_rpmsg_bus and insmod it again as the vrings and
> >> vring buffers are configured again while the remoteproc is still
> >> running. Also, since the remoteproc is not rebooted, the previously
> >> published rpmsg channels are stale and they won't get recreated.
> >>
> > 
> > So in essence this only worked because rmmod'ing the virtio_rpmsg_bus
> > would shut down the remoteproc(?) What if the firmware exposed a
> > VIRTIO_ID_NET and a VIRTIO_ID_RPMSG and you rmmod one of them?
> 
> Yes, it's a problem if firmware exposed different virtio devices, but
> like I said above, it was not supported so far.

It's not prevented, the only reason I can find for it not working is
what I'm arguing about - that the resource handling will be racy.

> It is definitely
> something we should consider going forward.

We had a question related to supporting multiple VIRTIO_ID_NET devices
per remoteproc on LKML last week.

> Also, I would think the
> VIRTIO_ID_RPMSG usage is different from VIRTIO_ID_NET or VIRTIO_CONSOLE.
> The rpmsg usage does provide a bus infrastructure allowing the remote
> side to publish different rpmsg devices.
> 

Maybe I'm missing something here, but if I put any other VIRTIO_ID in
the "id" member of fw_rsc_vdev the virtio core will probe that driver
and it will call the find_vqs callback and there's no limit on the
number of fw_rsc_vdev entries in the resource table.

So the use case of having a remoteproc firmware with 8 VIRTIO_ID_NET
entries should work just fine - except for only the first one being
initialized as the firmware boots (unless we finish this restructure).

> > 
> > 
> > The vrings are in use by the remote side, so allocating those with the
> > other remoteproc resources makes more sense, as above.
> > 
> > But virtio_rpmsg_bus needs to detach all buffers from the rings before
> > going away, so we don't get any writes to those after releasing the dma
> > allocation.
> 
> They do get detached alright from Linux-side but obviously you are now
> creating an additional synchronization to the remoteproc side that they
> cannot use these as you have freed up the memory.
> 

Yeah, that's not acceptable, the backing memory must at least follow the
running state of the rproc, so that it is available once we boot the
core.

> > 
> > We will be sending out RPMSG_NS_DESTROY for some of the channels, but as
> > far as I can tell from the rpmsg implementation there is no support in
> > the protocol for your use case of dropping one end of the rpmsg channels
> > without restarting the firmware and(/or?) vdevs.
> 
> Right, this also causes new synchronization problems when you reprobe
> and the remoteproc side has to republish the channels.

>From the code it seems like the other virtio devices would handle this.

> The existing
> remoteproc infrastructure was designed around this fact - rpmsg channels
> can come and go (if needed) from the remoteproc-side, and the flow is no
> different from regular boot vs error recovery, and since they are tied
> to their parent virtio_rpmsg device, removing the communication path
> ensured that.

There are two levels here, the first is the virtio level which in the
case of rpmsg seems to be required to follow the remoteproc
RPROC_RUNNING state; the other being rpmsg channels have nothing to do
with remoteproc, but can as you say come and go dynamically as either
side like.

But the only problem I can see is if the firmware does not re-announce
channels after we reset the virtio device.

> 
> > 
> >> In summary, the current patches worked nicely in a error recovery
> >> scenario but are not working properly with the various combinations of
> >> module insertion/removal process.
> >>
> > 
> > Thanks for your feedback Suman. I think we should definitely fix #1 and
> > #2, but I'm uncertain to what extent #3 can be fixed.
> 
> The only solution I can think of is to reverse the module dependency as
> well to follow the reversal of the boot dependency, so that
> virtio_rpmsg_bus cannot be removed if you have a remoteproc supporting
> virtio devices is booted and running once the virtio_rpmsg has probed.

Can you please help me understand why it's important to protect either
module from being unloaded?

> I
> don't see any reasons to introduce new synchronization issues and force
> the firmwares to change (having to republish channels) because of this
> boot triggering reversal.
> 

The problem is not the boot triggering reversal - as there's no such
thing, the issue shows because I decoupled the rproc life cycle from one
of its child's.

> I am concerned on the impact as 4.9 is going to an LTS, with most of the
> Si vendors using the LTS for their new software releases.
> 

I'm sorry, but could you help me understand how rpmsg is used downstream
for this to be of concern, how is module unloading used beyond
development?

Per my own arguments I will provide some patches to correct the vring
buffer allocation and I'll look into the module locking.


PS. I really would like to see >0 users of this framework in mainline,
so we can reason about things on the basis of what's actually there!

Regards,
Bjorn
