Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 4 Oct 2017 19:44:27 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2] rpmsg: Allow RPMSG_VIRTIO to be enabled via
 menuconfig or defconfig
Message-ID: <20171005024427.GU1165@minitux>
References: <1506917900-12289-1-git-send-email-anup@brainfault.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1506917900-12289-1-git-send-email-anup@brainfault.org>
To: Anup Patel <anup@brainfault.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Sun 01 Oct 21:18 PDT 2017, Anup Patel wrote:

> Currently, RPMSG_VIRTIO can only be enabled if some other kconfig
> option selects it. This does not allow it to be enabled for
> virtualized systems where Virtio RPMSG is available over Virtio
> MMIO or PCI transport.
> 
> This patch updates RPMSG_VIRTIO kconfig option so that we can
> enable the VirtIO RPMSG driver via menuconfig or defconfig.
> 
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---

This part looks good (and really I think this is the right thing to do).
But turning RPMSG_VIRTIO into a user selectable item makes it invalid to
"select RPMSG_VIRTIO" from drivers/remoteproc/Kconfig.

Can you please as part of this change remove those selects and as a
separate patch add CONFIG_RPMSG_VIRTIO=m to
arch/arm/configs/multi_v7_defconfig?

Thanks,
Bjorn

> 
> Changes since v1:
> - Add depends on HAS_DMA to avoid build failures on
>   archs (such as um) with NO_DMA=y. For most archs,
>   HAS_DMA=y so having depends on HAS_DMA is fine. 
> 
>  drivers/rpmsg/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
> index 0fe6eac..65a9f6b 100644
> --- a/drivers/rpmsg/Kconfig
> +++ b/drivers/rpmsg/Kconfig
> @@ -47,7 +47,8 @@ config RPMSG_QCOM_SMD
>  	  platforms.
>  
>  config RPMSG_VIRTIO
> -	tristate
> +	tristate "Virtio RPMSG bus driver"
> +	depends on HAS_DMA
>  	select RPMSG
>  	select VIRTIO
>  
> -- 
> 2.7.4
> 
