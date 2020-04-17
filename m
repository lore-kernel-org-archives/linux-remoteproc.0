Return-Path: <Markus.Elfring@web.de>
Subject: Re: [v2 4/7] remoteproc: Use kstrdup_const() rather than kstrdup()
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
 <20200415204858.2448-5-mathieu.poirier@linaro.org>
From: Markus Elfring <Markus.Elfring@web.de>
Message-ID: <7e3f07b1-a45d-0800-e74f-7f042d22eb3c@web.de>
Date: Fri, 17 Apr 2020 18:12:34 +0200
MIME-Version: 1.0
In-Reply-To: <20200415204858.2448-5-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

=E2=80=A6
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1982,7 +1982,7 @@ static const struct device_type rproc_type =3D {
=E2=80=A6
> -		p =3D kstrdup(firmware, GFP_KERNEL);
> +		p =3D kstrdup_const(firmware, GFP_KERNEL);

How do you think about to avoid a typo for a function name in
the final commit subject?

Regards,
Markus
