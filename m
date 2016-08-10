Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 10 Aug 2016 13:22:02 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: Ongoing remoteproc discussions
Message-ID: <20160810202202.GT26240@tuxbot>
References: <20160718231011.GK13516@tuxbot>
 <D0C04901035AEF47BB4C8387F4AA41F53B5A92@SAFEX1NODE23.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D0C04901035AEF47BB4C8387F4AA41F53B5A92@SAFEX1NODE23.st.com>
To: Loic PALLARDY <loic.pallardy@st.com>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Sarangdhar Joshi <spjoshi@codeaurora.org>, Eric FINCO <eric.finco@st.com>, Russell Wayman <russell.wayman@linaro.org>, Matthew Locke <matthew.locke@linaro.org>, Kumar Gala <kumar.gala@linaro.org>, Bill Fletcher <bill.fletcher@linaro.org>, Puja Gupta <pujag@codeaurora.org>, Ohad Ben-Cohen <ohad@wizery.com>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 03 Aug 07:52 PDT 2016, Loic PALLARDY wrote:

> > == Auto-boot or always-on:
[..]
> > 
> [LPA] As already mentioned in patch review, I would prefer auto-boot
> name rather than always-on for this feature.

Agreed.

> What about coprocessor already loaded and started at boot stage? It
> may be the case of coprocessor used by bootloader and can't reset
> without breaking use case or coprocessor with security constraints.

For the cases I've dealt with we just didn't represent the remote
processor in the kernel, we just reserved the carveouts and communicated
with it.

> In that case, remoteproc should allocate rproc resource at linux level
> and sync on current rproc state.

Sure.

> > 
[..]
> > == Resource-less firmware:
> > To be able to use remoteproc with firmware either without a resource table
> > or resource data in other forms we today provide a resource table stub in
> > each driver, instead we could refactor the resource table parsing code.
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
> > is a combination of static information (DT) and data from the ELF header.
> [LPA] Do you have a list of resources you would like to support here?

With resources here I meant the existing remoteproc resources, i.e.
carveouts, devmem, trace and vdev/vrings.

> In ST we plan to have DT for rproc resource description (PIO,
> peripheral bus...). Today coprocessor resources are managed
> dynamically using resource manager developed by TI on omap.
> But this solution is consuming time and code size.
> We would like to implement rproc resource allocation at rproc_boot
> time, parsing associated DT section and getting the different
> requested resources...

Are you talking about the resmgr found in downstream TI trees? What
kinds of resources and how would this look like?

> Is it aligned with your view?
> 

I'm generally considering these resources (e.g. regulators exposed by
resmgr) not being part of the life cycle management of the remote
processor, but rather related to the application running on the remote
processor; as such I don't think they should reside in the remoteproc
core.

That said, for resmgr to move upstream I think it needs to be
generalized.

> > 
> > 
[..]
> > == Ramdump:
[..]
> > 
> >     * Shutdown the remoteproc

> [LPA] just a technical remark, shutting down the remoteproc may switch
> off some power domain and disable access to remoteproc memories or
> registers.
> An intermediate state is need to allow snapshot generation.

Ahh, you're right. Then we need to complicate this dance a little bit,
and probably make it possible for drivers to take part in it.

> 
> >     * Shutdown virtio devices
> >     * Take snapshot
> >     * Register virtio devices
> >     * Start the remoteproc
> > 

Thanks for your reply Loic.

Regards,
Bjorn
