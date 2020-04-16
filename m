Return-Path: <Markus.Elfring@web.de>
Subject: Re: [PATCH v2 5/7] remoteproc: Restructure firmware name allocation
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
 <20200415204858.2448-6-mathieu.poirier@linaro.org>
From: Markus Elfring <Markus.Elfring@web.de>
Message-ID: <aa565fea-b1c4-9b5c-73ed-591244afee19@web.de>
Date: Thu, 16 Apr 2020 08:26:43 +0200
MIME-Version: 1.0
In-Reply-To: <20200415204858.2448-6-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

=E2=80=A6
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1984,14 +1984,14 @@ static int rproc_alloc_firmware(struct rproc *rp=
roc,
>  {
>  	const char *p;
>
> -	if (!firmware)
> +	if (firmware)
> +		p =3D kstrdup_const(firmware, GFP_KERNEL);
> +	else
>  		/*
>  		 * If the caller didn't pass in a firmware name then
>  		 * construct a default name.
>  		 */
>  		p =3D kasprintf(GFP_KERNEL, "rproc-%s-fw", name);
> -	else
> -		p =3D kstrdup_const(firmware, GFP_KERNEL);

Can the use of the conditional operator make sense at such source code pla=
ces?

	p =3D firmware ? kstrdup_const(=E2=80=A6) : kasprintf(=E2=80=A6);

Regards,
Markus
