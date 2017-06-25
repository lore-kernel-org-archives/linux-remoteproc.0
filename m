Return-Path: <bjorn.andersson@linaro.org>
Date: Sun, 25 Jun 2017 14:19:55 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 0/4] Davinci remoteproc cleanups/fixes
Message-ID: <20170625211955.GD26155@builder>
References: <20170518220902.2846-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170518220902.2846-1-s-anna@ti.com>
To: Suman Anna <s-anna@ti.com>
Cc: linux-remoteproc@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>, Robert Tivy <rtivy@ti.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 18 May 15:08 PDT 2017, Suman Anna wrote:

> Hi Bjorn,
> 
> The following series includes various fixes and cleanups for the TI's
> Davinci DSP remoteproc driver. Patches are based on 4.12-rc1. Following
> is the patch summary:
> 
>  - Patch1 updates/fixes the build dependency on DMA_CMA which is not
>    selected by default in the davinci_defconfig.
>  - Patch 3 fixes a DSP boot/functionality issue with repeated 'start'
>    and 'stop' commands using the sysfs 'state' variable.
>  - Patch 2 and 4 are cleanups/code simplifications.
> 

Patches 1, 2 and 3 applied to rproc-next.

Regards,
Bjorn
