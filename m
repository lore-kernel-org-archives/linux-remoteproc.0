Return-Path: <peter.griffin@linaro.org>
Return-Path: <peter.griffin@linaro.org>
Date: Mon, 25 Jul 2016 13:26:39 +0100
From: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: Ongoing remoteproc discussions
Message-ID: <20160725122639.GB4278@griffinp-ThinkPad-X1-Carbon-2nd>
References: <20160718231011.GK13516@tuxbot>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160718231011.GK13516@tuxbot>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Sarangdhar Joshi <spjoshi@codeaurora.org>, Loic PALLARDY <loic.pallardy@st.com>, Eric FINCO <eric.finco@st.com>, Russell Wayman <russell.wayman@linaro.org>, Matthew Locke <matthew.locke@linaro.org>, Kumar Gala <kumar.gala@linaro.org>, Bill Fletcher <bill.fletcher@linaro.org>, Puja Gupta <pujag@codeaurora.org>, Ohad Ben-Cohen <ohad@wizery.com>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

On Mon, 18 Jul 2016, Bjorn Andersson wrote:

> During discussions with various people interested in moving their
> remoteproc-related out-of-tree patches towards mainline I have come
> across a set of topics common among various teams. The purpose of this
> email is to share some insight into these discussions and the current
> ideas for moving forward.
> 
> == Auto-boot or always-on:
> There are cases where we want to achieve the current auto-boot mechanism
> without rpmsg and there are cases where we don't want to auto-boot a
> remoteproc just because its resource table contains rpmsg entries. So we
> need to decouple this logic from the vdev. I suggest that:
> 
> * We introduce a property in the rproc struct where drivers can toggle
>   if they want always-on or not. We default this to true, as an estimate
>   of backwards compatibility.
> 
> * We move the allocation of vrings to be done at the time of the other
>   allocations and follow that with the registration of virtio devices,
>   before actually booting the rproc. And we tear down the virtio devices
>   as part of shutdown.
> 
> * We remove the rproc_boot()/shutdown() calls from the
>   remoteproc_virtio.c and based on rproc->always_on we call these in the
>   async firmware loader callback, in rproc_trigger_recovery() and
>   rproc_del().

What happens in the built-in case where firnmware isn't available until rootfs
is mounted? In this case async fw load will have failed. 

> 
> 
> A side effect of this is that the async firmware loading only purpose is
> to trigger the boot as the firmware becomes available (something we need
> to tweak further). I therefor see no reason to mandate the firmware is
> unchanged between boots, which simplifies the posed rproc_set_firmware()
> function - as long as it's done on a remoteproc that's not always_on.
> 
> 
> == Amended resources:
> We need a way for the driver to amend resource definitions of the
> firmware with e.g. physical addresses and size constraints from
> devicetree, so I suggest that:
> 
> * We split the resource table parsing and allocation of resources in two
>   steps; where the parse step updates the lists of resources and then at
>   the time of boot we run through these and allocate the actual
>   resources.
> 
> * We expose an API to the drivers so that they can register resources,
>   as if they came from the table parser. We match each resource against
>   previously registered resources based on name and merge or reject the
>   updates. E.g. we merge a reference to the resource table offset and we
>   reject incompatible size changes.
> 
> 
> == Resource-less firmware:
> To be able to use remoteproc with firmware either without a resource
> table or resource data in other forms we today provide a resource table
> stub in each driver, instead we could refactor the resource table
> parsing code.
> 
> * We replace the find_rsc_table operation in rproc_fw_ops with a parse
>   operation, that uses the newly created API (above) to register the
>   resources with the core; largely decoupling the resource table format
>   from the remoteproc core.
> 
> * We make the parse() function in rproc_fw_ops optional, allowing
>   remoteproc drivers to specify that there's no resource parsing to be
>   done (they can still provide resources programmatically between
>   rproc_alloc() and rproc_add()).
> 
> This setup allows custom resource building functions to be implemented,
> one such example is the Qualcomm firmware files where most resource data
> is a combination of static information (DT) and data from the ELF
> header.
> 
> 
> == Resource-less firmware with installed resource table:
> The now available list of resources that have been registered with the
> core can serve as input for a function that generates a resource table
> for the remote.  This gives us a mechanism for providing a remoteproc
> with information about resources in cases where the firmware lacks a
> resource table.
> 
> * We replace the rproc_find_loaded_rsc_table() with an new fw_op that is
>   tasked with installing the resource table and update rproc->table_ptr.
>   This op is made optional, for the remoteprocs with no installed
>   resource table.
> 
> * We provide a helper function in the core that can be used in the
>   fw_op, that builds a resource table in memory and copy this into the
>   appropriate address of the remote, and  update rproc->table_ptr to
>   this.
> 
> The install function will be tasked with making sure table_ptr is valid
> and we make sure that error paths out of there and upon shutdown the
> core will make table_ptr reference the core's version - which might be
> NULL if no resource table exist.
> 
> 
> == Supporting rpmsg alternatives:
> For systems with other communication mechanisms than rpmsg we still want
> to be able to instantiate and tear down devices representing these
> communication channels, in a way that follows the life cycle of the
> remoteproc. To do this I suggest that:
> 
> * Like other resources we split virtio device handling in the remoteproc
>   core into adding rproc_vdevs to rproc->rvdevs and actually calling
>   rproc_add_virtio_dev().
> 
> * We generalise the rproc->rvdev somewhat, to be a list of "subdevices"
>   that are registered with the remoteproc; each providing callbacks for
>   registering and unregistering themselves as we bring the remoteproc up
>   and down.
> 
> I made a quick hack of this with the Qualcomm SMD code and it turned out
> pretty good, but I believe it's too ugly to post until we get the
> cleanups from above tasks sorted out.
> 
> 
> == Ramdump:
> Being able to acquire core dumps from a miss-behaving remoteproc is an
> important feature in product development. I believe this snapshot should
> be taken between the shutdown of the remote and freeing of resources. As
> such I think it would be appropriate to:
> 
> * Split the inner working of rproc_shutdown() into the two steps of
>   shutting down the remote and cleaning up its resources. Giving us a
>   window of opportunity for snapshotting any resources.
> 
> In the generic case we will have to repopulate the resources with data
> from the firmware file (in case of corruptions), but we're expecting to
> load the same firmware again and as such I see no meaning in releasing
> and reacquiring carveouts etc. As such if we split the inner working of
> rproc_boot() into resource allocation, virtio device allocation and
> booting we can make rproc_trigger_recovery() do:
> 
>     * Shutdown the remoteproc
>     * Shutdown virtio devices
>     * Take snapshot
>     * Register virtio devices
>     * Start the remoteproc
> 
> (The order of the top two is opposite of todays implementation, but
> probably more appropriate for the case of getting an accurate snapshot
> of the device).
> 
> We need to discuss the requirements for the format of what comes out of
> this.  I've seen raw memory dumps of a fixed memory segments and I've
> seen ELF generators with segments matching those of the loaded ELF in
> the past.
> 
> 
> == Firmware from late mounted file systems (needs discussion):
> Typical for most remoteproc systems seems to be that the firmware files
> tend to be way to large for being stored in a initramfs.

In the case of fdma the firmware is actually very small. I think for my usecase
I would be best off putting the fdma firmware in the initramfs and then all
the current issues with async fw, deferred probe  and late rootfs will go away.

If some better solution in remoteproc comes along in the future fdma can migrate
over to using it.

> The two
> available mechanisms for dealing with this is to build remoteproc
> drivers as modules and relying on CONFIG_FW_LOADER_USER_HELPER_FALLBACK;
> the latter is being frowned upon by everyone but works fairly well for
> our purpose.

I agree has worked well for me in the past, but is frowned upon.
> 
> Forcing systems to compile remoteproc drivers as modules to achieve the
> delayed firmware load is not acceptable in my view.

Agree again.

> 
> So we need to come up with some mechanism for triggering auto-booting
> when firmware files are stored in a lately mounted file system.

One approach I've looked at is using -EPROBE_DEFER in the client driver (in my
case dmaengine) if rproc_boot() can't find the firmware.

This does require a couple of changes to get working with mainline though: -

1) rproc async fw mechanism in rproc_add_virtio_devices() will have failed,
   so resource table parsing needs to be re-tried in rproc_boot(). See here
    http://thread.gmane.org/gmane.linux.ports.arm.kernel/512079

2) It requires a change in drivers-core to re-run deferred probes after
rootfs has been mounted. See here https://lkml.org/lkml/2016/7/12/503.

With those two changes the deferred approach works well. It also has the benefit
of not allowing devices to be registered which can never work due to missing
firmware. In my case ALSA ASoC will be deffered until dma which it relies upon
to work has its firmware in place.

One other quick question, you haven't mentioned subdev carveout here? Are you ok
with me re-submitting fdma series as it is currently, and we can migrate over to
using subdev careout if / when it gets merged in the future?

regards,

Peter.
