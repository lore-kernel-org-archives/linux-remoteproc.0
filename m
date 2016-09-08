Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 8 Sep 2016 15:27:09 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/4] remoteproc: Introduce auto-boot flag
Message-ID: <20160908222709.GA405@tuxbot>
References: <1470952373-4823-1-git-send-email-bjorn.andersson@linaro.org>
 <ba437b4f-dde3-8def-afe2-472430b750e6@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba437b4f-dde3-8def-afe2-472430b750e6@ti.com>
To: Suman Anna <s-anna@ti.com>
Cc: linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 31 Aug 11:27 PDT 2016, Suman Anna wrote:

> Hi Bjorn,
> 
> On 08/11/2016 04:52 PM, Bjorn Andersson wrote:
> > Introduce an "auto-boot" flag on rprocs to make it possible to flag
> > remote processors without vdevs to automatically boot once the firmware
> > is found.
> > 
> > Preserve previous behavior of the wkup_m3 processor being explicitly
> > booted by a consumer.
> > 
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: Loic Pallardy <loic.pallardy@st.com>
> > Cc: Suman Anna <s-anna@ti.com>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > 
> > Changes since v1:
> > - s/always_on/auto_boot/
> > - Fixed double increment of "power" in recover path
> > - Marked wkup_m3 to not auto_boot
> > 
> 
> I am seeing various issues with this series as I am testing this series
> more thoroughly with various TI remoteproc drivers and IPC stacks based
> on virtio devices. I use very simple firmware images that publishes the
> rpmsg-client-sample devices, so that I can use the kernel
> rpmsg_client_sample to test the communication.
> 

Thanks for bringing these up!

> Here's a summary of the main issues:
> 
> 1. The rproc_boot holds a module reference count to the remoteproc
> platform driver so that it cannot be removed when a remote processor is
> booted. The previous architecture allowed virtio_rpmsg_bus or the
> platform remoteproc driver to be installed independent of each other
> with the boot actually getting triggered when the virtio_rpmsg_bus gets
> probed in find_vqs. The boot now happens when just the platform
> remoteproc driver is installed independent of virtio_rpmsg_bus and
> results in holding self-reference counts. This makes it impossible to
> remove the remoteproc platform module cleanly (we shouldn't be imposing
> force remove), which means we can't stop the remoteprocs properly.
> 

I've always found the dependency on rpmsg awkward and don't like this
behavior to depend on the firmware content, but rather on some sort of
system configuration.

That said, I did not intend to break the ability of shutting down and
unloading the module.


Calling rmmod on your rproc module is a rather explicit operation, do
you know why there's a need to hold the module reference? Wouldn't it be
cleaner to just shutdown the remoteproc as the module is being removed -
which would include tearing down all children (rpmsg and others)

I expect to be able to compile rpmsg into my kernel and still be able to
unload my remoteproc module.

> 2. The reversal of boot between virtio_rpmsg_bus and remoteproc core
> also meant that the virtio devices and therefore the memory for vrings
> are allocated at the time virtio_rpmsg_bus is probed in find_vqs(). The
> remoteproc can be booted without the virtio_rpmsg_bus module installed.
> We do use the allocated dma addresses of the vrings in the published
> resource table, but now the remote processor is up even before these
> values are filled in. I had to actually move up the rproc_alloc_vring
> alongside rproc_parse_vring to have the communication up.
> 

This also means that for a piece of firmware that exposes more than one
virtio device we would have the same race.

As you say it makes more sense to allocate the vrings as we set up the
other resources.

> 3. The remoteproc platform driver cannot be removed previously when the
> corresponding virtio devices are probed/configured properly and all the
> communication flow w.r.t rpmsg channel publishing followed from the
> remoteproc boot. These channels are child devices of the parent virtio
> devices, and since the remoteproc boot/shutdown followed the virtio
> device probe/removal lifecycle, the rpmsg channels life-cycle followed
> that of the parent virtio device. My communication paths are now failing
> if I remove the virtio_rpmsg_bus and insmod it again as the vrings and
> vring buffers are configured again while the remoteproc is still
> running. Also, since the remoteproc is not rebooted, the previously
> published rpmsg channels are stale and they won't get recreated.
> 

So in essence this only worked because rmmod'ing the virtio_rpmsg_bus
would shut down the remoteproc(?) What if the firmware exposed a
VIRTIO_ID_NET and a VIRTIO_ID_RPMSG and you rmmod one of them?


The vrings are in use by the remote side, so allocating those with the
other remoteproc resources makes more sense, as above.

But virtio_rpmsg_bus needs to detach all buffers from the rings before
going away, so we don't get any writes to those after releasing the dma
allocation.


We will be sending out RPMSG_NS_DESTROY for some of the channels, but as
far as I can tell from the rpmsg implementation there is no support in
the protocol for your use case of dropping one end of the rpmsg channels
without restarting the firmware and(/or?) vdevs.

> In summary, the current patches worked nicely in a error recovery
> scenario but are not working properly with the various combinations of
> module insertion/removal process.
> 

Thanks for your feedback Suman. I think we should definitely fix #1 and
#2, but I'm uncertain to what extent #3 can be fixed.

Regards,
Bjorn
