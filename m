Return-Path: <anup@brainfault.org>
MIME-Version: 1.0
In-Reply-To: <1507222198-5052-1-git-send-email-anup@brainfault.org>
References: <1507222198-5052-1-git-send-email-anup@brainfault.org>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 26 Oct 2017 21:33:31 +0530
Message-ID: <CAAhSdy0weSJCp1CtcEG-V+iPD3o88W5gZzTBaU38PpHGEtaS8A@mail.gmail.com>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Select RPMSG_VIRTIO as module
Content-Type: text/plain; charset="UTF-8"
To: Russell King <linux@armlinux.org.uk>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-remoteproc@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, Anup Patel <anup@brainfault.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Oct 5, 2017 at 10:19 PM, Anup Patel <anup@brainfault.org> wrote:
> The RPMSG_VIRTIO is now user selectable option so we explicitly
> select it in multi_v7_defconfig. Till now RPMSG_VIRTIO was
> selected by ST_REMOTEPROC=m in multi_v7_defconfig.
>
> Signed-off-by: Anup Patel <anup@brainfault.org>
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

Hi Arnd/Olof,

Please have a look at this patch.

This is a follow-up patch for https://patchwork.kernel.org/patch/9987567/

Regards,
Anup
