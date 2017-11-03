Date: Thu, 2 Nov 2017 22:14:42 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Select RPMSG_VIRTIO as module
Message-ID: <20171103051442.GO28761@minitux>
References: <1507222198-5052-1-git-send-email-anup@brainfault.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1507222198-5052-1-git-send-email-anup@brainfault.org>
To: Anup Patel <anup@brainfault.org>
Cc: Russell King <linux@armlinux.org.uk>, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 05 Oct 09:49 PDT 2017, Anup Patel wrote:

> The RPMSG_VIRTIO is now user selectable option so we explicitly
> select it in multi_v7_defconfig. Till now RPMSG_VIRTIO was
> selected by ST_REMOTEPROC=m in multi_v7_defconfig.
> 

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Anup Patel <anup@brainfault.org>

Regards,
Bjorn

> ---
>  arch/arm/configs/multi_v7_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 0cacdbf..5e689e0 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -849,6 +849,7 @@ CONFIG_TEGRA_IOMMU_GART=y
>  CONFIG_TEGRA_IOMMU_SMMU=y
>  CONFIG_REMOTEPROC=m
>  CONFIG_ST_REMOTEPROC=m
> +CONFIG_RPMSG_VIRTIO=m
>  CONFIG_PM_DEVFREQ=y
>  CONFIG_ARM_TEGRA_DEVFREQ=m
>  CONFIG_MEMORY=y
> -- 
> 2.7.4
> 
