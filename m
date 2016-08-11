Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 11 Aug 2016 12:05:42 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: Ongoing remoteproc discussions
Message-ID: <20160811190542.GA26240@tuxbot>
References: <20160718231011.GK13516@tuxbot>
 <D0C04901035AEF47BB4C8387F4AA41F53B5A92@SAFEX1NODE23.st.com>
 <20160810202202.GT26240@tuxbot>
 <b20b5878-902a-91e2-2b00-50d34d27a628@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b20b5878-902a-91e2-2b00-50d34d27a628@ti.com>
To: Suman Anna <s-anna@ti.com>
Cc: Loic PALLARDY <loic.pallardy@st.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Sarangdhar Joshi <spjoshi@codeaurora.org>, Eric FINCO <eric.finco@st.com>, Russell Wayman <russell.wayman@linaro.org>, Matthew Locke <matthew.locke@linaro.org>, Kumar Gala <kumar.gala@linaro.org>, Bill Fletcher <bill.fletcher@linaro.org>, Puja Gupta <pujag@codeaurora.org>, Ohad Ben-Cohen <ohad@wizery.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 11 Aug 09:48 PDT 2016, Suman Anna wrote:

> On 08/10/2016 03:22 PM, Bjorn Andersson wrote:
> > On Wed 03 Aug 07:52 PDT 2016, Loic PALLARDY wrote:
> > 
> >>> == Auto-boot or always-on:
> > [..]
> >>>
> >> [LPA] As already mentioned in patch review, I would prefer auto-boot
> >> name rather than always-on for this feature.
> > 
> > Agreed.
> > 
> >> What about coprocessor already loaded and started at boot stage? It
> >> may be the case of coprocessor used by bootloader and can't reset
> >> without breaking use case or coprocessor with security constraints.
> > 
> > For the cases I've dealt with we just didn't represent the remote
> > processor in the kernel, we just reserved the carveouts and communicated
> > with it.
> 
> Yeah, we have a similar usecase as well, and we do want the remoteproc
> to behave as in the normal case once the kernel has booted up and the
> corresponding driver has been probed. We have had to do some magic (not
> zeroing memory) for presenting the remoteproc still to Linux-side
> applications and client drivers.
> 
> This indeed brings me one of the list of enhancements I have in mind -
> to add an ops for individual driver control for allocating memory on
> carveouts, vrings etc with a fall-back to the dma_alloc API in the
> remoteproc core.
> 

For this case you would provide the carveout resource a fixed location,
Loic is currently looking at one of my suggestions of using memremap()
instead of dma_alloc_coherent() for the resources that has a specified
"pa".

FYI, the alternative suggestion for handling regions with fixed location
is to create "surrogate" devices, that gets assigned the memory range
and use this for dma_alloc_coherent() - which would not solve this
problem.

> Bjorn, I take it that you are not using rpmsg here if that lifecycle is
> managed separately from remoteproc.
> 

On this platform it's the Qualcomm equivalent "SMD", and we do. During
boot we detect the presence of the vdev-equivalent and the link to this
processor comes up and stays up until you power off the board.

> > 
> >> In that case, remoteproc should allocate rproc resource at linux level
> >> and sync on current rproc state.
> > 
> > Sure.
> > 
> >>>
> > [..]
> >>> == Resource-less firmware:
> >>> To be able to use remoteproc with firmware either without a resource table
> >>> or resource data in other forms we today provide a resource table stub in
> >>> each driver, instead we could refactor the resource table parsing code.
> >>>
> >>> * We replace the find_rsc_table operation in rproc_fw_ops with a parse
> >>>   operation, that uses the newly created API (above) to register the
> >>>   resources with the core; largely decoupling the resource table format
> >>>   from the remoteproc core.
> >>>
> >>> * We make the parse() function in rproc_fw_ops optional, allowing
> >>>   remoteproc drivers to specify that there's no resource parsing to be
> >>>   done (they can still provide resources programmatically between
> >>>   rproc_alloc() and rproc_add()).
> >>>
> >>> This setup allows custom resource building functions to be implemented,
> >>> one such example is the Qualcomm firmware files where most resource data
> >>> is a combination of static information (DT) and data from the ELF header.
> >> [LPA] Do you have a list of resources you would like to support here?
> > 
> > With resources here I meant the existing remoteproc resources, i.e.
> > carveouts, devmem, trace and vdev/vrings.
> > 
> >> In ST we plan to have DT for rproc resource description (PIO,
> >> peripheral bus...). Today coprocessor resources are managed
> >> dynamically using resource manager developed by TI on omap.
> >> But this solution is consuming time and code size.
> >> We would like to implement rproc resource allocation at rproc_boot
> >> time, parsing associated DT section and getting the different
> >> requested resources...
> 
> Yeah, this becomes somewhat complicated when we are talking about
> peripherals, because it depends on they get used. I see the following
> usage patterns:
> 1. do not instantiate the devices on Linux, and leave them to be managed
> completely by s/w running on remoteproc.

This is the easy case, if you ship a product you know which resources
belong to the remote and can make sure that they are not referenced by
the Linux system.

> 2. resources that can be managed alongside the remoteproc state (request
> them up before rproc_boot, and release them after rproc_shutdown). This
> can always be done within the respective remoteproc driver as the
> peripherals used are specific to each platform.
> 3. resources that only need to be managed at runtime, especially if the
> PM around them in controlled on the Linux-side.

If its resources that are related to the life cycle of the remoteproc I
think they belong in the remoteproc driver itself, if it's dynamic,
application level resources I think they should be handled by some sort
of (e.g. rpmsg) client driver.

> 
> > 
> > Are you talking about the resmgr found in downstream TI trees? What
> > kinds of resources and how would this look like?
> > 
> >> Is it aligned with your view?
> >>
> > 
> > I'm generally considering these resources (e.g. regulators exposed by
> > resmgr) not being part of the life cycle management of the remote
> > processor, but rather related to the application running on the remote
> > processor; as such I don't think they should reside in the remoteproc
> > core.
> 
> Agreed, we did use resmgr specifically for #3. It also allowed us to
> recover these resources in case of a remoteproc crash while holding them.
> 
> > 
> > That said, for resmgr to move upstream I think it needs to be
> > generalized.
> 
> Indeed, the TI resmgr was written before DT, and it would need rework if
> we were to go down that path.
> 
> That said, if the management is moving towards the System Control
> Processor like frameworks, this won't be needed.
> 

I'm looking forward to learn the details of these requirements, so that
we can figure out how to best support them upstream.

Regards,
Bjorn
