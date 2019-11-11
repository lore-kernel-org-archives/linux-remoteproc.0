Date: Mon, 11 Nov 2019 15:10:26 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v20 3/4] rpmsg: add rpmsg support for mt8183 SCP.
Message-ID: <20191111231023.GD3108315@builder>
References: <20191014075812.181942-1-pihsun@chromium.org>
 <20191014075812.181942-4-pihsun@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191014075812.181942-4-pihsun@chromium.org>
To: Pi-Hsun Shih <pihsun@chromium.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Matthias Brugger <matthias.bgg@gmail.com>, open list <linux-kernel@vger.kernel.org>, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 14 Oct 00:58 PDT 2019, Pi-Hsun Shih wrote:

> Add a simple rpmsg support for mt8183 SCP, that use IPI / IPC directly.
> 

Hi Pi-Hsun,

Sorry for not reviewing this in a timely manner! This looks good, just
some very minor comments below.

> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
[..]
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index f2e5e70a58f2..7896cefb2dc0 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -15,6 +15,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/remoteproc.h>
>  #include <linux/remoteproc/mtk_scp.h>
> +#include <linux/rpmsg/mtk_rpmsg.h>
>  
>  #include "mtk_common.h"
>  #include "remoteproc_internal.h"
> @@ -407,6 +408,31 @@ static void scp_unmap_memory_region(struct mtk_scp *scp)
>  	of_reserved_mem_device_release(scp->dev);
>  }
>  
> +static struct mtk_rpmsg_info mtk_scp_rpmsg_info = {
> +	.send_ipi = scp_ipi_send,
> +	.register_ipi = scp_ipi_register,
> +	.unregister_ipi = scp_ipi_unregister,

These are exported symbols, so unless you see a need to support
alternative implementations in the near future just skip the function
pointers and call them directly.

> +	.ns_ipi_id = SCP_IPI_NS_SERVICE,
> +};
> +
[..]
> diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
[..]
> +static void __ept_release(struct kref *kref)

Please make this __mtk_ept_release() to make it clear that this is
not a framework function.

> +{
> +	struct rpmsg_endpoint *ept = container_of(kref, struct rpmsg_endpoint,
> +						  refcount);
> +	kfree(to_mtk_rpmsg_endpoint(ept));
> +}
> +
> +static void mtk_rpmsg_ipi_handler(void *data, unsigned int len, void *priv)
> +{
> +	struct mtk_rpmsg_endpoint *mept = priv;
> +	struct rpmsg_endpoint *ept = &mept->ept;
> +	int ret;
> +
> +	ret = (*ept->cb)(ept->rpdev, data, len, ept->priv, ept->addr);
> +	if (ret)
> +		dev_warn(&ept->rpdev->dev, "rpmsg handler return error = %d",
> +			 ret);
> +}
> +
> +static struct rpmsg_endpoint *
> +__rpmsg_create_ept(struct mtk_rpmsg_rproc_subdev *mtk_subdev,

__mtk_create_ept()

> +		   struct rpmsg_device *rpdev, rpmsg_rx_cb_t cb, void *priv,
> +		   u32 id)
> +{

Regards,
Bjorn
