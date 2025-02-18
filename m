Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1083A22CBF1
	for <linux-remoteproc@vger.kernel.org>; Tue, 18 Feb 2025 09:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739871089; cv=none; b=VfNeP8bxz3jHHul8AYxtq35y+JgZlMyI3eFDaFx0Igro+q5riQ/ADWms+AxdO5YU0wPuOjsv6RUYBdUU8t+hy7G2CrEf4UMHubt7fi9uKPz6zffT5morop6pVVntTjnCfJpZbYHWHFCsPenGz+L+C1CsmfWQyaOYerQhvO4OvB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739871089; c=relaxed/simple;
	bh=2c32N+oKvlS1GlBHzku3NDRUiFaZZFKMS1VaZ7MOy8Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XtdBkT0rTlAfrNd2j+SvHElTQEuAE/ylbphGXVGS8uJbHU6kQQVNk/FDleDgPNlNZW1RLYDku3JA+jtDn1/AbsFwTpFDg5xaMcUKscz3Om0dLod05m6bacjrtDFUwuakogktX2CWXC5og/w5eOBHku904uR9Bnvsu295SyXcFgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkJwo-0002Ll-Ee; Tue, 18 Feb 2025 10:31:22 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkJwo-001YwO-0V;
	Tue, 18 Feb 2025 10:31:22 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkJwo-0003RV-0F;
	Tue, 18 Feb 2025 10:31:22 +0100
Message-ID: <f8201731e9c5f590e0f60751a6bb31083b77a372.camel@pengutronix.de>
Subject: Re: [PATCH 4/5] reset: imx8mp-audiomix: Add support for DSP
 run/stall
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Daniel Baluta <daniel.baluta@nxp.com>, shawnguo@kernel.org, 
	mathieu.poirier@linaro.org
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, andersson@kernel.org, 
	linux-remoteproc@vger.kernel.org, iuliana.prodan@nxp.com, 
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, Frank.Li@nxp.com, 
	krzk@kernel.org
Date: Tue, 18 Feb 2025 10:31:21 +0100
In-Reply-To: <20250218085712.66690-5-daniel.baluta@nxp.com>
References: <20250218085712.66690-1-daniel.baluta@nxp.com>
	 <20250218085712.66690-5-daniel.baluta@nxp.com>
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
> We can Run/Stall the DSP via audio block control bits found in audiomix.
> Implement this functionality using the reset controller and use assert
> for Stall and deassert for Run.
>=20
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  drivers/reset/reset-imx8mp-audiomix.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-=
imx8mp-audiomix.c
> index 8cc0a6b58cbc..ee56d52a7278 100644
> --- a/drivers/reset/reset-imx8mp-audiomix.c
> +++ b/drivers/reset/reset-imx8mp-audiomix.c
> @@ -15,10 +15,14 @@
>  #define IMX8MP_AUDIOMIX_EARC_RESET_MASK		0x1
>  #define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	0x2
> =20
> +#define IMX8MP_AUDIOMIX_DSP_OFFSET		0x108
> +#define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK	0x20
> +
>  #define IMX8MP_AUDIOMIX_EARC		0
>  #define IMX8MP_AUDIOMIX_EARC_PHY	1
> +#define IMX8MP_AUDIOMIX_DSP		2
> =20
> -#define IMX8MP_AUDIOMIX_RESET_NUM	2
> +#define IMX8MP_AUDIOMIX_RESET_NUM	3

See patch 2, this could be removed.

> =20
>  struct imx8mp_reset_map {
>  	unsigned int offset;
> @@ -37,7 +41,11 @@ static const struct imx8mp_reset_map reset_map[IMX8MP_=
AUDIOMIX_RESET_NUM] =3D {
>  		.mask	=3D IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK,
>  		.active_low =3D true,
>  	},
> -

This belongs in patch 2.

> +	[IMX8MP_AUDIOMIX_DSP] =3D {
> +		.offset	=3D IMX8MP_AUDIOMIX_DSP_OFFSET,
> +		.mask	=3D IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK,
> +		.active_low =3D false,
> +	},
>  };
> =20
>  struct imx8mp_audiomix_reset {

Otherwise,
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
