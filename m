Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH -next] remoteproc: make rproc_check_carveout_da static
Date: Fri, 1 Feb 2019 15:56:13 +0000
Message-ID: <519ceef457d744e98659a2c7aa6fdd4d@SFHDAG7NODE2.st.com>
References: <20190201031317.18820-1-yuehaibing@huawei.com>
In-Reply-To: <20190201031317.18820-1-yuehaibing@huawei.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: YueHaibing <yuehaibing@huawei.com>, "ohad@wizery.com" <ohad@wizery.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Yue,

> -----Original Message-----
> From: linux-remoteproc-owner@vger.kernel.org <linux-remoteproc-
> owner@vger.kernel.org> On Behalf Of YueHaibing
> Sent: vendredi 1 f=E9vrier 2019 04:13
> To: ohad@wizery.com; bjorn.andersson@linaro.org
> Cc: linux-kernel@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> YueHaibing <yuehaibing@huawei.com>
> Subject: [PATCH -next] remoteproc: make rproc_check_carveout_da static
>=20
> Fixes the following sparse warnings:
>=20
> drivers/remoteproc/remoteproc_core.c:279:5: warning:
>  symbol 'rproc_check_carveout_da' was not declared. Should it be static?
Correction already sent on ML few weeks ago. See [1]

Regards,
Loic

[1] https://patchwork.kernel.org/patch/10755763/

>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index 54ec38f..5d4954d 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -276,8 +276,9 @@ rproc_find_carveout_by_name(struct rproc *rproc,
> const char *name, ...)
>   *
>   * Return: 0 if carveout match request else -ENOMEM
>   */
> -int rproc_check_carveout_da(struct rproc *rproc, struct rproc_mem_entry
> *mem,
> -			    u32 da, u32 len)
> +static int rproc_check_carveout_da(struct rproc *rproc,
> +				   struct rproc_mem_entry *mem,
> +				   u32 da, u32 len)
>  {
>  	struct device *dev =3D &rproc->dev;
>  	int delta =3D 0;
> --
> 2.7.0
>=20
