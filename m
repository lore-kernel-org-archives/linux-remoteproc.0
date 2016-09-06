Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 6 Sep 2016 11:10:24 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 2/3] remoteproc: core: transform struct
 fw_rsc_vdev_vring reserved field in pa
Message-ID: <20160906181024.GD15161@tuxbot>
References: <1473147584-13183-1-git-send-email-loic.pallardy@st.com>
 <1473147584-13183-3-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1473147584-13183-3-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: ohad@wizery.com, lee.jones@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 06 Sep 00:39 PDT 2016, Loic Pallardy wrote:

> In current implementation, struct fw_rsc_vdev_vring which describes
> vring resource in firmware resource table owns only device address,
> because it assumes that host is responsible of vring allocation and
> only device address is needed by coprocessor.
> But if vrings need to be fixe in system memory map for any reasons
> (security, SoC charactieristics...), physical address is needed exatly
> identified the memory chunck by host.
> 
> For that let's transform reserved field of struct fw_rsc_vdev_vring
> to pa (physical address).
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>

Applied, thanks

> ---
>  drivers/remoteproc/remoteproc_core.c | 6 ------
>  include/linux/remoteproc.h           | 4 ++--
>  2 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 18f4286..0d3c191 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -266,12 +266,6 @@ rproc_parse_vring(struct rproc_vdev *rvdev, struct fw_rsc_vdev *rsc, int i)
>  	dev_dbg(dev, "vdev rsc: vring%d: da 0x%x, qsz %d, align %d\n",
>  		i, vring->da, vring->num, vring->align);
>  
> -	/* make sure reserved bytes are zeroes */
> -	if (vring->reserved) {
> -		dev_err(dev, "vring rsc has non zero reserved bytes\n");
> -		return -EINVAL;
> -	}
> -
>  	/* verify queue size and vring alignment are sane */
>  	if (!vring->num || !vring->align) {
>  		dev_err(dev, "invalid qsz (%d) or alignment (%d)\n",
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 80e1cba..c321eab 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -241,7 +241,7 @@ struct fw_rsc_trace {
>   * @notifyid is a unique rproc-wide notify index for this vring. This notify
>   * index is used when kicking a remote processor, to let it know that this
>   * vring is triggered.
> - * @reserved: reserved (must be zero)
> + * @pa: physical address
>   *
>   * This descriptor is not a resource entry by itself; it is part of the
>   * vdev resource type (see below).
> @@ -255,7 +255,7 @@ struct fw_rsc_vdev_vring {
>  	u32 align;
>  	u32 num;
>  	u32 notifyid;
> -	u32 reserved;
> +	u32 pa;
>  } __packed;
>  
>  /**
> -- 
> 1.9.1
> 
