Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 11 Aug 2016 11:13:06 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: Ongoing remoteproc discussions
Message-ID: <20160811181306.GX26240@tuxbot>
References: <20160718231011.GK13516@tuxbot>
 <3c054d9e-db70-a1d2-c755-3a71ce45fcb7@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c054d9e-db70-a1d2-c755-3a71ce45fcb7@ti.com>
To: Suman Anna <s-anna@ti.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Sarangdhar Joshi <spjoshi@codeaurora.org>, Loic PALLARDY <loic.pallardy@st.com>, Eric FINCO <eric.finco@st.com>, Russell Wayman <russell.wayman@linaro.org>, Matthew Locke <matthew.locke@linaro.org>, Kumar Gala <kumar.gala@linaro.org>, Bill Fletcher <bill.fletcher@linaro.org>, Puja Gupta <pujag@codeaurora.org>, Ohad Ben-Cohen <ohad@wizery.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 10 Aug 17:19 PDT 2016, Suman Anna wrote:

> Hi Bjorn,
> 

Hi,

> On 07/18/2016 06:10 PM, Bjorn Andersson wrote:
[..]
> > == Auto-boot or always-on:
> > There are cases where we want to achieve the current auto-boot mechanism
> > without rpmsg and there are cases where we don't want to auto-boot a
> > remoteproc just because its resource table contains rpmsg entries. So we
> > need to decouple this logic from the vdev. I suggest that:
> 
> I am trying to understand the usecase where one doesn't want to
> auto-boot with rpmsg entries, did you come across such an usecase?
> 

This is a request that comes from Loic (ST). I'm unaware of the details,
but I can think of scenarios where rpmsg channels serves as auxiliary
functionality to the main purpose of a co-processor (e.g. debug
functionality).

> > 
> > * We introduce a property in the rproc struct where drivers can toggle
> >   if they want always-on or not. We default this to true, as an estimate
> >   of backwards compatibility.
> 
> Can this be made into a flags field rather than a boolean, especially to
> dictate the behavior between firmwares with vdevs and without vdevs. I
> do have some usecases that can have vdevs (so auto-boot) or no vdevs
> (with dummy resource tables) based on firmware being loaded (rproc_boot
> will be called by a client driver in that case).
> 

I would prefer that we don't have to scan the resource table and make
"advanced" decisions based on its content - and as you say it has to be
at least tristate to work based on above.

I'm hoping that we can approximate this with a boolean for now and then
I would like to reverse the resource table parsing mechanism, so that
instead of calling "give me a resource table" we would have a fw_ops
that we call to "parse" the firmware and with below APIs we can build up
the resource table from that.

This parse could then work on other structures than the resource table
and it could be made processor specific to set auto-boot based on
properties of the firmware.

> Your current patch-set does break the wkup_m3_rproc driver as it now
> auto-boots.
> 

Ahh right, thanks for pointing this out.

I'll look through the tree to figure out which drivers seems to have
clients calling rproc_boot() and make them auto_boot = false;

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
> > 
> > 
> > A side effect of this is that the async firmware loading only purpose is
> > to trigger the boot as the firmware becomes available (something we need
> > to tweak further). I therefor see no reason to mandate the firmware is
> > unchanged between boots, which simplifies the posed rproc_set_firmware()
> > function - as long as it's done on a remoteproc that's not always_on.
> 
> I take it that you are talking about adding a new API down the road
> which should allow client drivers to set firmwares.
> 
> +1 for that.

A while back Lee posted a patch for this. With the auto-boot rework the
resource table resources gets a much cleaner life cycle and that patch
can be simplified.

So I'm hoping we can introduce that shortly.


What I was referring to is the fact that you today can't modify your
resource table calling rproc_add(), so you can replace your firmware,
but only as long as it's sharing the same resource table - unless you
start the old one, replace the files and then trigger a crash...

> 
> > 
> > 
> > == Amended resources:
> > We need a way for the driver to amend resource definitions of the
> > firmware with e.g. physical addresses and size constraints from
> > devicetree, so I suggest that:
> > 
> > * We split the resource table parsing and allocation of resources in two
> >   steps; where the parse step updates the lists of resources and then at
> >   the time of boot we run through these and allocate the actual
> >   resources.
> > 
> > * We expose an API to the drivers so that they can register resources,
> >   as if they came from the table parser. We match each resource against
> >   previously registered resources based on name and merge or reject the
> >   updates. E.g. we merge a reference to the resource table offset and we
> >   reject incompatible size changes.
> 
> So, all this to be invoked by a platform driver before rproc_add() even
> before requesting and processing a firmware? Is this also only limited
> for remoteproc platform drivers, or gonna be extended to client drivers
> (in the case where they are setting the firmwares).
> 

It provides the mechanism for remoteproc drivers to provide the core
with resources specified in e.g. devicetree. Allowing e.g. me to reuse
the carveout handling on Qualcomm platforms, where we don't have a
resource table.

> One question w.r.t Lee's series is also adding new resources - how does
> that work with loaded resource tables given that you are dynamically
> increasing the table size, and the firmware image is already pre-linked.
> Or is the assumption here that there will not be a loaded resource table
> in such a scenario, we will have a loaded resource table for firmwares
> with vdevs for sure.
> 

That's a very valid concern, I would hope that we could look at the size
of the loaded-resource segment in the ".resource_table" segment. Perhaps
as we validate the resource table?

Can you please bring this issue up on the affected patch?

> > 
> > 
> > == Resource-less firmware:
> > To be able to use remoteproc with firmware either without a resource
> > table or resource data in other forms we today provide a resource table
> > stub in each driver, instead we could refactor the resource table
> > parsing code.
> > 
> > * We replace the find_rsc_table operation in rproc_fw_ops with a parse
> >   operation, that uses the newly created API (above) to register the
> >   resources with the core; largely decoupling the resource table format
> >   from the remoteproc core.
> > 
> > * We make the parse() function in rproc_fw_ops optional, allowing
> >   remoteproc drivers to specify that there's no resource parsing to be
> >   done (they can still provide resources programmatically between
> >   rproc_alloc() and rproc_add()).
> > 
> > This setup allows custom resource building functions to be implemented,
> > one such example is the Qualcomm firmware files where most resource data
> > is a combination of static information (DT) and data from the ELF
> > header.
> > 
> > 
> > == Resource-less firmware with installed resource table:
> > The now available list of resources that have been registered with the
> > core can serve as input for a function that generates a resource table
> > for the remote.  This gives us a mechanism for providing a remoteproc
> > with information about resources in cases where the firmware lacks a
> > resource table.
> > 
> > * We replace the rproc_find_loaded_rsc_table() with an new fw_op that is
> >   tasked with installing the resource table and update rproc->table_ptr.
> >   This op is made optional, for the remoteprocs with no installed
> >   resource table.
> 
> So, kinda similar to above question, how do you find a suitable location
> for this in the case of installed resource table?
> 

Dito.

But here it would be more natural to return -ENOSPC or similar if there
is a lack of space.

> > 
> > * We provide a helper function in the core that can be used in the
> >   fw_op, that builds a resource table in memory and copy this into the
> >   appropriate address of the remote, and  update rproc->table_ptr to
> >   this.
> > 
> > The install function will be tasked with making sure table_ptr is valid
> > and we make sure that error paths out of there and upon shutdown the
> > core will make table_ptr reference the core's version - which might be
> > NULL if no resource table exist.
> > 
> > 
> > == Supporting rpmsg alternatives:
> > For systems with other communication mechanisms than rpmsg we still want
> > to be able to instantiate and tear down devices representing these
> > communication channels, in a way that follows the life cycle of the
> > remoteproc. To do this I suggest that:
> > 
> > * Like other resources we split virtio device handling in the remoteproc
> >   core into adding rproc_vdevs to rproc->rvdevs and actually calling
> >   rproc_add_virtio_dev().
> > 
> > * We generalise the rproc->rvdev somewhat, to be a list of "subdevices"
> >   that are registered with the remoteproc; each providing callbacks for
> >   registering and unregistering themselves as we bring the remoteproc up
> >   and down.
> 
> +1, this is a good direction.
> 

Thanks for your input!

Regards,
Bjorn
