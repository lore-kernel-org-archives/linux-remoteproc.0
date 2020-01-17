Return-Path: <p.zabel@pengutronix.de>
Message-ID: <e839f09ce459cb374184ac1871db6e0be24f2418.camel@pengutronix.de>
Subject: Re: [PATCH 1/4] remoteproc: qcom: q6v5-mss: Use
 regmap_read_poll_timeout
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Fri, 17 Jan 2020 15:19:32 +0100
In-Reply-To: <20200117135130.3605-2-sibis@codeaurora.org>
References: <20200117135130.3605-1-sibis@codeaurora.org>
	 <20200117135130.3605-2-sibis@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org, evgreen@chromium.org
Cc: ohad@wizery.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, 2020-01-17 at 19:21 +0530, Sibi Sankar wrote:
> Replace the loop for HALT_ACK detection with regmap_read_poll_timeout.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom=
_q6v5_mss.c
> index 51f451311f5fc..f20b39c6ff0ed 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -73,6 +73,7 @@
>  #define NAV_AXI_IDLE_BIT		BIT(2)
> =20
>  #define HALT_ACK_TIMEOUT_MS		100
> +#define NAV_HALT_ACK_TIMEOUT_US		200
> =20
>  /* QDSP6SS_RESET */
>  #define Q6SS_STOP_CORE			BIT(0)
> @@ -746,7 +747,6 @@ static void q6v5proc_halt_nav_axi_port(struct q6v5 *q=
proc,
>  				       struct regmap *halt_map,
>  				       u32 offset)
>  {
> -	unsigned long timeout;
>  	unsigned int val;
>  	int ret;
> =20
> @@ -760,15 +760,11 @@ static void q6v5proc_halt_nav_axi_port(struct q6v5 =
*qproc,
>  			   NAV_AXI_HALTREQ_BIT);
> =20
>  	/* Wait for halt ack*/
> -	timeout =3D jiffies + msecs_to_jiffies(HALT_ACK_TIMEOUT_MS);
> -	for (;;) {
> -		ret =3D regmap_read(halt_map, offset, &val);
> -		if (ret || (val & NAV_AXI_HALTACK_BIT) ||
> -		    time_after(jiffies, timeout))
> -			break;
> -
> -		udelay(5);
> -	}
> +	ret =3D regmap_read_poll_timeout(halt_map, offset, val,
> +				       (val & NAV_AXI_HALTACK_BIT),
> +				       5, NAV_HALT_ACK_TIMEOUT_US);
> +	if (ret)
> +		dev_err(qproc->dev, "nav halt ack timeout\n");
> =20
>  	ret =3D regmap_read(halt_map, offset, &val);
>  	if (ret || !(val & NAV_AXI_IDLE_BIT))

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
