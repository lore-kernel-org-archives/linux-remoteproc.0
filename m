Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 12 Aug 2016 22:10:39 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 00/13] various remoteproc/rpmsg trivial cleanups
Message-ID: <20160813051039.GL26240@tuxbot>
References: <20160812234228.39731-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160812234228.39731-1-s-anna@ti.com>
To: Suman Anna <s-anna@ti.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 12 Aug 16:42 PDT 2016, Suman Anna wrote:

> Hi Bjorn,
> 
> Following are a bunch of trivial cleanups in remoteproc core, rpmsg
> bus core and couple of cleanups in OMAP remoteproc driver. The patches
> are baselined on 4.8-rc1 + your rproc-next branch.
> 
> The only non-cleanup patches are the last two patches - the first of
> which switches a hex_dump to a dynamic hex dump, and the second one is
> a fix to rpmsg client sample to scale for multiple instances when you
> have more than one remoteproc publishing the same rpmsg channel.
> 
> regards
> Suman
> 

Thanks,

Related to the hexdump stuff; I've seen (and used) a few different
patches for getting dumps out and converted to pcap format for analysis
in Wireshark. I think this would be a really nice feature to have
available without 3rd party patches.

> Suman Anna (13):
>   remoteproc: use proper format-specifier for printing dma_addr_t
>   remoteproc: fix couple of minor typos
>   remoteproc: use variable names for sizeof() operator
>   remoteproc: fix bare unsigned type usage
>   remoteproc: align code with open parenthesis
>   remoteproc: print hex numbers with a leading 0x format
>   remoteproc/omap: fix various code formatting issues
>   remoteproc/omap: revise a minor error trace message

Applied to rproc-next

>   rpmsg: remove pointless OOM prints
>   rpmsg: use proper format-specifier for printing dma_addr_t
>   rpmsg: align code with open parenthesis
>   rpmsg: use dynamic_hex_dump for hex dump traces
>   samples/rpmsg: add support for multiple instances

Applied to rpmsg-next

Regards,
Bjorn
