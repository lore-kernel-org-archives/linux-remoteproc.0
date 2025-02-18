Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4A422FF30
	for <linux-remoteproc@vger.kernel.org>; Tue, 18 Feb 2025 09:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739871033; cv=none; b=g2c18/12BsMLGZ8IkLFGMMnAOnqpc7AreuArSVHMcoOm9x6LnPe27duSoB+tXvCrpcO8ag64vJRM9UbaAQcUsVNlu4jsrZ72ZU7VJ9Y+HbzqDXNVTw1uFIDlSph/hvv+2zG5ysvwLkSZI5CdjfS6o3TC+smiQbSWMB5Hpycwn1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739871033; c=relaxed/simple;
	bh=cg5O2OkrwSnA+FumOYLYWoy2fd0/MOD8QVua1Iy+75w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dKQjVufQMhNDq0X6p005dHnZPm1GwW3Ozlfpr4gyvMQR6gjHKcBBGYcP/F7u/8Rs411ZgvlAZPKGt2BgykAUEVHZTPy7zPy0Uj+dTOaQyoeU5lS+w1MOTHh7qHZPDR4nw/xKxFjhl//fUQPZDz1Bxpl4uMERqRHLTxXGAX6531w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkJvu-00028g-Id; Tue, 18 Feb 2025 10:30:26 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkJvu-001Yva-0p;
	Tue, 18 Feb 2025 10:30:26 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkJvp-0003Ot-0Y;
	Tue, 18 Feb 2025 10:30:21 +0100
Message-ID: <be4e8fe598f8a56210154c40d8a6d973a3fbeee1.camel@pengutronix.de>
Subject: Re: [PATCH 3/5] reset: imx8mp-audiomix: Introduce active_low
 configuration option
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Daniel Baluta <daniel.baluta@nxp.com>, shawnguo@kernel.org, 
	mathieu.poirier@linaro.org
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, andersson@kernel.org, 
	linux-remoteproc@vger.kernel.org, iuliana.prodan@nxp.com, 
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, Frank.Li@nxp.com, 
	krzk@kernel.org
Date: Tue, 18 Feb 2025 10:30:21 +0100
In-Reply-To: <20250218085712.66690-4-daniel.baluta@nxp.com>
References: <20250218085712.66690-1-daniel.baluta@nxp.com>
	 <20250218085712.66690-4-daniel.baluta@nxp.com>
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

On Di, 2025-02-18 at 10:57 +0200, Daniel Baluta wrote:
> For EARC and EARC PHY the reset happens when clearing the reset bits.
> Refactor assert/deassert function in order to take into account
> the active_low configuratin option.
                            ^
                            missing 'o'.

>=20
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  drivers/reset/reset-imx8mp-audiomix.c | 45 ++++++++++++++-------------
>  1 file changed, 23 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-=
imx8mp-audiomix.c
> index 6b1666c4e069..8cc0a6b58cbc 100644
> --- a/drivers/reset/reset-imx8mp-audiomix.c
> +++ b/drivers/reset/reset-imx8mp-audiomix.c
> @@ -23,16 +23,19 @@
>  struct imx8mp_reset_map {
>  	unsigned int offset;
>  	unsigned int mask;
> +	bool active_low;
>  };
> =20
>  static const struct imx8mp_reset_map reset_map[IMX8MP_AUDIOMIX_RESET_NUM=
] =3D {
>  	[IMX8MP_AUDIOMIX_EARC] =3D {
>  		.offset	=3D IMX8MP_AUDIOMIX_EARC_OFFSET,
>  		.mask	=3D IMX8MP_AUDIOMIX_EARC_RESET_MASK,
> +		.active_low =3D true,
>  	},
>  	[IMX8MP_AUDIOMIX_EARC_PHY] =3D {
>  		.offset	=3D IMX8MP_AUDIOMIX_EARC_OFFSET,
>  		.mask	=3D IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK,
> +		.active_low =3D true,
>  	},
> =20
>  };
> @@ -48,48 +51,46 @@ static struct imx8mp_audiomix_reset *to_imx8mp_audiom=
ix_reset(struct reset_contr
>  	return container_of(rcdev, struct imx8mp_audiomix_reset, rcdev);
>  }
> =20
> -static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcd=
ev,
> -					unsigned long id)
> +static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
> +				  unsigned long id, bool assert)
>  {
>  	struct imx8mp_audiomix_reset *priv =3D to_imx8mp_audiomix_reset(rcdev);
>  	void __iomem *reg_addr =3D priv->base;
> -	unsigned int mask, offset, reg;
> -	unsigned long flags;
> +	unsigned int mask, offset, active_low;
> +	unsigned long reg, flags;

Nitpick, I would make active_low bool, like assert. Otherwise,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
