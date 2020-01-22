Date: Tue, 21 Jan 2020 16:16:00 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH RESEND 0/3] Some improvements for OMAP hwspinlock
Message-ID: <20200122001557.GC14744@builder>
References: <cover.1578453062.git.baolin.wang7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1578453062.git.baolin.wang7@gmail.com>
To: Baolin Wang <baolin.wang7@gmail.com>
Cc: ohad@wizery.com, linux-omap@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 07 Jan 19:13 PST 2020, Baolin Wang wrote:

> This patch set did some optimization for OMAP hwlock controller with
> changing to use some devm_xxx APIs to simplify code.
> 

Applied the first 2 patches, thanks.

> Baolin Wang (3):
>   hwspinlock: omap: Change to use devm_platform_ioremap_resource()
>   hwspinlock: omap: Use devm_kzalloc() to allocate memory
>   hwspinlock: omap: Use devm_hwspin_lock_register() to register hwlock
>     controller
> 
>  drivers/hwspinlock/omap_hwspinlock.c |   45 ++++++++++------------------------
>  1 file changed, 13 insertions(+), 32 deletions(-)
> 
> -- 
> 1.7.9.5
> 
