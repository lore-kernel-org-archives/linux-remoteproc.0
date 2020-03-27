Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH 02/11] remoteproc: stm32: Request IRQ with platform device
Date: Fri, 27 Mar 2020 16:54:45 +0000
Message-ID: <57220cc7d0a6447c84435ff7e39cf303@SFHDAG7NODE2.st.com>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
 <20200324220329.15523-3-mathieu.poirier@linaro.org>
In-Reply-To: <20200324220329.15523-3-mathieu.poirier@linaro.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Mathieu Poirier <mathieu.poirier@linaro.org>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "s-anna@ti.com" <s-anna@ti.com>, "peng.fan@nxp.com" <peng.fan@nxp.com>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Fabien DESSENNE <fabien.dessenne@st.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> Sent: mardi 24 mars 2020 23:03
> To: bjorn.andersson@linaro.org
> Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
> anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
> <arnaud.pouliquen@st.com>; Fabien DESSENNE
> <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
> Subject: [PATCH 02/11] remoteproc: stm32: Request IRQ with platform
> device
>=20
> Request IRQ with platform device rather than remote proc in order to
> call stm32_rproc_parse_dt() before rproc_alloc().  That way we can
> know whether we need to synchronise with the MCU or not.
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Thanks Mathieu
=20
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>=20

> ---
>  drivers/remoteproc/stm32_rproc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/remoteproc/stm32_rproc.c
> b/drivers/remoteproc/stm32_rproc.c
> index cde4b1a56381..0c1f0b84e057 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -261,7 +261,8 @@ static int stm32_rproc_parse_fw(struct rproc *rproc,
> const struct firmware *fw)
>=20
>  static irqreturn_t stm32_rproc_wdg(int irq, void *data)
>  {
> -	struct rproc *rproc =3D data;
> +	struct platform_device *pdev =3D data;
> +	struct rproc *rproc =3D platform_get_drvdata(pdev);
>=20
>  	rproc_report_crash(rproc, RPROC_WATCHDOG);
>=20
> @@ -553,7 +554,7 @@ static int stm32_rproc_parse_dt(struct
> platform_device *pdev)
>=20
>  	if (irq > 0) {
>  		err =3D devm_request_irq(dev, irq, stm32_rproc_wdg, 0,
> -				       dev_name(dev), rproc);
> +				       dev_name(dev), pdev);
>  		if (err) {
>  			dev_err(dev, "failed to request wdg irq\n");
>  			return err;
> --
> 2.20.1
