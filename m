Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Wed, 31 Aug 2016 12:24:05 +0100
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v8 01/18] remoteproc: st_slim_rproc: add a slimcore rproc
 driver
Message-ID: <20160831112405.GI27357@dell>
References: <1472223413-7254-1-git-send-email-peter.griffin@linaro.org>
 <1472223413-7254-2-git-send-email-peter.griffin@linaro.org>
 <20160830123453.GG10121@dell>
 <20160830154451.GB22514@griffinp-ThinkPad-X1-Carbon-2nd>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20160830154451.GB22514@griffinp-ThinkPad-X1-Carbon-2nd>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, vinod.koul@intel.com, patrice.chotard@st.com, dan.j.williams@intel.com, airlied@linux.ie, kraxel@redhat.com, ohad@wizery.com, bjorn.andersson@linaro.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, 30 Aug 2016, Peter Griffin wrote:
> On Tue, 30 Aug 2016, Lee Jones wrote:
> > On Fri, 26 Aug 2016, Peter Griffin wrote:
> > 
> > > slim core is used as a basis for many IPs in the STi
> > > chipsets such as fdma and demux. To avoid duplicating
> > > the elf loading code in each device driver a slim
> > > rproc driver has been created.
> > > 
> > > This driver is designed to be used by other device drivers
> > > such as fdma, or demux whose IP is based around a slim core.
> > > The device driver can call slim_rproc_alloc() to allocate
> > > a slim rproc and slim_rproc_put() when finished.
> > > 
> > > This driver takes care of ioremapping the slim
> > > registers (dmem, imem, slimcore, peripherals), whose offsets
> > > and sizes can change between IP's. It also obtains and enables
> > > any clocks used by the device. This approach avoids having
> > > a double mapping of the registers as slim_rproc does not register
> > > its own platform device. It also maps well to device tree
> > > abstraction as it allows us to have one dt node for the whole
> > > device.
> > > 
> > > All of the generic rproc elf loading code can be reused, and
> > > we provide start() stop() hooks to start and stop the slim
> > > core once the firmware has been loaded. This has been tested
> > > successfully with fdma driver.
> > 
> > Nit.  It would be good to use a constant line-wrap.
> > 
> > 'M-x post-mode' will help with this.
> 
> Can you provide the magic which makes this happen for GIT commit messages?

I tend to do it manually.  However a 3 second Google search produced
[0], which looks like it could be fun/useful.

[0] https://www.emacswiki.org/emacs/Git

[...]

> > > + * License terms:  GNU General Public License (GPL), version 2
> > 
> > Are you sure ST are okay with the shortened version of the GPL?
> 
> Do you mean the banner should be like this?
> 
>  * This program is free software; you can redistribute it and/or modify
>  * it under the terms of the GNU General Public License as published by
>  * the Free Software Foundation; either version 2 of the License, or
>  * (at your option) any later version.

Yes, exactly.

[...]

> > > +/* slimcore registers */
> > 
> > What's it called? slimcore, slim core, ST Slim?
> 
> It is usually referred to as SLIM core, or SLIM CPU in the various functional
> specifications.
> 
> > 
> > Please be consistent.  Use the name from the datasheet.
> 
> OK. The datasheet isn't consistent either, so we will settle on SLIM core and
> SLIM CPU.

Perfect.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
