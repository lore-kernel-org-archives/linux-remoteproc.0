Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Subject: RE: [PATCH 1/2] remoteproc: fall back to using parent memory pool if
 no dedicated available
Date: Fri, 13 Mar 2020 16:52:52 +0000
Message-ID: <ce37072d2f304214aa920e66fa3b30b1@SFHDAG3NODE1.st.com>
References: <20200305224108.21351-1-s-anna@ti.com>
 <20200305224108.21351-2-s-anna@ti.com>
In-Reply-To: <20200305224108.21351-2-s-anna@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Suman Anna <s-anna@ti.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Loic PALLARDY <loic.pallardy@st.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Tero Kristo <t-kristo@ti.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Suman,

> -----Original Message-----
> From: Suman Anna <s-anna@ti.com>
> Sent: jeudi 5 mars 2020 23:41
> To: Bjorn Andersson <bjorn.andersson@linaro.org>; Loic PALLARDY
> <loic.pallardy@st.com>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>; Arnaud POULIQUEN
> <arnaud.pouliquen@st.com>; Tero Kristo <t-kristo@ti.com>; linux-
> remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org; Suman Anna
> <s-anna@ti.com>
> Subject: [PATCH 1/2] remoteproc: fall back to using parent memory pool if=
 no
> dedicated available
>=20
> From: Tero Kristo <t-kristo@ti.com>
>=20
> In some cases, like with OMAP remoteproc, we are not creating dedicated
> memory pool for the virtio device. Instead, we use the same memory pool
> for all shared memories. The current virtio memory pool handling forces a
> split between these two, as a separate device is created for it, causing
> memory to be allocated from bad location if the dedicated pool is not
> available. Fix this by falling back to using the parent device memory poo=
l if
> dedicated is not available.
>=20
> Fixes: 086d08725d34 ("remoteproc: create vdev subdevice with specific dma
> memory pool")
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/remoteproc/remoteproc_virtio.c
> b/drivers/remoteproc/remoteproc_virtio.c
> index 8c07cb2ca8ba..4723ebe574b8 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -368,6 +368,16 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev,
> int id)
>  				goto out;
>  			}
>  		}
> +	} else {
> +		struct device_node *np =3D rproc->dev.parent->of_node;
> +
> +		/*
> +		 * If we don't have dedicated buffer, just attempt to
> +		 * re-assign the reserved memory from our parent.
> +		 * Failure is non-critical so don't check return value
> +		 * either.
> +		 */
> +		of_reserved_mem_device_init_by_idx(dev, np, 0);
>  	}
I aven't tested your patchset yet, but reviewing you code,  I wonder if you=
 cannot declare your  memory pool
in your platform driver using  rproc_of_resm_mem_entry_init. Something like=
:
	struct device_node *mem_node;
	struct reserved_mem *rmem;

	mem_node =3D of_parse_phandle(dev->of_node, "memory-region", 0);
	rmem =3D of_reserved_mem_lookup(mem_node);
	mem =3D rproc_of_resm_mem_entry_init(dev, 0,
							   rmem->size,
							   rmem->base,
							   " vdev0buffer");

A main advantage of this implementation would be that the index of the memo=
ry region would not be hard coded to 0.

Regards,
Arnaud
>=20
>  	/* Allocate virtio device */
> --
> 2.23.0
