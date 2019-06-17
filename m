Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH] remoteproc: recopy parent dma_pfn_offset for vdev
Date: Mon, 17 Jun 2019 10:10:37 +0000
Message-ID: <39b15f15172b4595bba43db86bc0c55e@SFHDAG7NODE2.st.com>
References: <20190612095521.4703-1-cleger@kalray.eu>
In-Reply-To: <20190612095521.4703-1-cleger@kalray.eu>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Clement Leger <cleger@kalray.eu>, Ohad Ben-Cohen <ohad@wizery.com>, "Bjorn Andersson  <bjorn.andersson@linaro.org>, linux-remoteproc" <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Clement,

> -----Original Message-----
> From: linux-remoteproc-owner@vger.kernel.org <linux-remoteproc-
> owner@vger.kernel.org> On Behalf Of Clement Leger
> Sent: mercredi 12 juin 2019 11:55
> To: Ohad Ben-Cohen <ohad@wizery.com>; Bjorn Andersson
> <bjorn.andersson@linaro.org>; linux-remoteproc <linux-
> remoteproc@vger.kernel.org>
> Cc: Clement Leger <cleger@kalray.eu>
> Subject: [PATCH] remoteproc: recopy parent dma_pfn_offset for vdev
>=20
> When preparing the subdevice for the vdev, also copy dma_pfn_offset
> since this is used for sub device dma allocations. Without that, there
> is incoherency between the parent dma settings and the childs one,
> potentially leading to dma_alloc_coherent failure (due to phys_to_dma
> using dma_pfn_offset for translation).

Thanks for this correction.
Could you please add fixes in message commit
Fixes: 086d08725d34 ("remoteproc: create vdev subdevice with specific dma m=
emory pool")

Else
Acked-by: Loic Pallardy <loic.pallardy@st.com>

Regards,
Loic

> ---
>  drivers/remoteproc/remoteproc_core.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index 263e9c9614a8..3b56ca043231 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -520,6 +520,7 @@ static int rproc_handle_vdev(struct rproc *rproc,
> struct fw_rsc_vdev *rsc,
>  	/* Initialise vdev subdevice */
>  	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
>  	rvdev->dev.parent =3D rproc->dev.parent;
> +	rvdev->dev.dma_pfn_offset =3D rproc->dev.parent->dma_pfn_offset;
>  	rvdev->dev.release =3D rproc_rvdev_release;
>  	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev-
> >dev.parent), name);
>  	dev_set_drvdata(&rvdev->dev, rvdev);
> --
> 2.15.0.276.g89ea799
