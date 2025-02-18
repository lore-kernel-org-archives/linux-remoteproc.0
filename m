Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB1022FADE
	for <linux-remoteproc@vger.kernel.org>; Tue, 18 Feb 2025 09:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739870822; cv=none; b=nOvbtV/GNyOlgSeLS8Q4BNW4dj+ZnxMBBXuYQeGyHt8EZF82KNVRoo6QCTsjlo4fdLR3nfOrV9fDlqSBJm/0k76vL2DSAQ3F4G1OjSFJZ60+3HOefRnmmwu8+xWPEpK76R0Fon/aMxjmNtfV2EP/ZtqoZvx1vEZ6sPoAJqvASWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739870822; c=relaxed/simple;
	bh=6kdZz7JEVszrBQdOmYo2rkSsPnrkn5e23YCMl5/kSac=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B+bUYTFGY7/hLv2T9PHyGoiIloZ5KacUnfT/2IqKk9vn7ujBMLkcAeLQbkw6nE+CSp5L7TSgiHctwpupVJ2NTYTYVqUTvQMYGuQ2RrGQWChztwFVBo2bneeAshIRwdb4v3PHxL67iNR7HV1ZaQR3mssaoz+MJSKfqjHgWUcfYvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkJsU-0001Pv-W7; Tue, 18 Feb 2025 10:26:55 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkJsU-001Yuf-1d;
	Tue, 18 Feb 2025 10:26:54 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkJsU-0003Kt-1P;
	Tue, 18 Feb 2025 10:26:54 +0100
Message-ID: <86ba9d0c48441a5cb725fb31a7d43dc0d97ee7ea.camel@pengutronix.de>
Subject: Re: [PATCH 2/5] reset: imx8mp-audiomix: Prepare the code for more
 reset bits
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Daniel Baluta <daniel.baluta@nxp.com>, shawnguo@kernel.org, 
	mathieu.poirier@linaro.org
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, andersson@kernel.org, 
	linux-remoteproc@vger.kernel.org, iuliana.prodan@nxp.com, 
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, Frank.Li@nxp.com, 
	krzk@kernel.org
Date: Tue, 18 Feb 2025 10:26:54 +0100
In-Reply-To: <20250218085712.66690-3-daniel.baluta@nxp.com>
References: <20250218085712.66690-1-daniel.baluta@nxp.com>
	 <20250218085712.66690-3-daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-remoteproc@vger.kernel.org

Hi Daniel,

On Di, 2025-02-18 at 10:57 +0200, Daniel Baluta wrote:
> Current code supports EARC PHY Software Reset and EARC 	Software
> Reset but it is not easily extensible to more reset bits.
>=20
> So, refactor the code in order to easily allow more reset bits
> in the future.
>=20
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  drivers/reset/reset-imx8mp-audiomix.c | 53 ++++++++++++++++++++++-----
>  1 file changed, 43 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-=
imx8mp-audiomix.c
> index 1fe21980a66c..6b1666c4e069 100644
> --- a/drivers/reset/reset-imx8mp-audiomix.c
> +++ b/drivers/reset/reset-imx8mp-audiomix.c
> @@ -12,7 +12,30 @@
>  #include <linux/reset-controller.h>
> =20
>  #define IMX8MP_AUDIOMIX_EARC_OFFSET		0x200
> -#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		0x3
> +#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		0x1
> +#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	0x2

Will any of the reset controls manipulate multiple bits at once?
I'd use BIT(0) and BIT(1) here.

> +
> +#define IMX8MP_AUDIOMIX_EARC		0
> +#define IMX8MP_AUDIOMIX_EARC_PHY	1
> +
> +#define IMX8MP_AUDIOMIX_RESET_NUM	2
> +
> +struct imx8mp_reset_map {
> +	unsigned int offset;
> +	unsigned int mask;
> +};
> +
> +static const struct imx8mp_reset_map reset_map[IMX8MP_AUDIOMIX_RESET_NUM=
] =3D {

If you make this reset_map[], drop IMX8MP_AUDIOMIX_RESET_NUM, and use
.nr_resets =3D ARRAY_SIZE(reset_map) below, followup patches that add new
bits will be simplified.

> +	[IMX8MP_AUDIOMIX_EARC] =3D {
> +		.offset	=3D IMX8MP_AUDIOMIX_EARC_OFFSET,
> +		.mask	=3D IMX8MP_AUDIOMIX_EARC_RESET_MASK,
> +	},
> +	[IMX8MP_AUDIOMIX_EARC_PHY] =3D {
> +		.offset	=3D IMX8MP_AUDIOMIX_EARC_OFFSET,
> +		.mask	=3D IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK,
> +	},
> +

Please drop this empty line.

> +};
> =20
>  struct imx8mp_audiomix_reset {
>  	struct reset_controller_dev rcdev;
> @@ -30,13 +53,18 @@ static int imx8mp_audiomix_reset_assert(struct reset_=
controller_dev *rcdev,
>  {
>  	struct imx8mp_audiomix_reset *priv =3D to_imx8mp_audiomix_reset(rcdev);
>  	void __iomem *reg_addr =3D priv->base;
> -	unsigned int mask, reg;
> +	unsigned int mask, offset, reg;
>  	unsigned long flags;
> =20
> -	mask =3D BIT(id);
> +	if (id >=3D  IMX8MP_AUDIOMIX_RESET_NUM)

Whitespace error. But also, this check is not necessary.
The reset core will not return reset controls that fail the same check
in of_reset_simple_xlate(), so we can never get here with the wrong id
if rcdev.nr_resets correctly is set to ARRAY_SIZE(reset_map).

> +		return -EINVAL;
> +
> +	mask =3D reset_map[id].mask;
> +	offset =3D reset_map[id].offset;
> +
>  	spin_lock_irqsave(&priv->lock, flags);
> -	reg =3D readl(reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
> -	writel(reg & ~mask, reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
> +	reg =3D readl(reg_addr + offset);
> +	writel(reg & ~mask, reg_addr + offset);
>  	spin_unlock_irqrestore(&priv->lock, flags);
> =20
>  	return 0;
> @@ -47,13 +75,18 @@ static int imx8mp_audiomix_reset_deassert(struct rese=
t_controller_dev *rcdev,
>  {
>  	struct imx8mp_audiomix_reset *priv =3D to_imx8mp_audiomix_reset(rcdev);
>  	void __iomem *reg_addr =3D priv->base;
> -	unsigned int mask, reg;
> +	unsigned int mask, offset, reg;
>  	unsigned long flags;
> =20
> -	mask =3D BIT(id);
> +	if (id >=3D  IMX8MP_AUDIOMIX_RESET_NUM)
> +		return -EINVAL;

Same as above.

> +
> +	mask =3D reset_map[id].mask;
> +	offset =3D reset_map[id].offset;
> +
>  	spin_lock_irqsave(&priv->lock, flags);
> -	reg =3D readl(reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
> -	writel(reg | mask, reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
> +	reg =3D readl(reg_addr + offset);
> +	writel(reg | mask, reg_addr + offset);
>  	spin_unlock_irqrestore(&priv->lock, flags);
> =20
>  	return 0;
> @@ -78,7 +111,7 @@ static int imx8mp_audiomix_reset_probe(struct auxiliar=
y_device *adev,
>  	spin_lock_init(&priv->lock);
> =20
>  	priv->rcdev.owner     =3D THIS_MODULE;
> -	priv->rcdev.nr_resets =3D fls(IMX8MP_AUDIOMIX_EARC_RESET_MASK);
> +	priv->rcdev.nr_resets =3D IMX8MP_AUDIOMIX_RESET_NUM;

Could use ARRAY_SIZE(reset_map) here.

regards
Philipp
