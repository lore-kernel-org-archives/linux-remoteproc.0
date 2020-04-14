Return-Path: <Markus.Elfring@web.de>
Subject: Re: [PATCH 4/4] remoteproc: Get rid of tedious error path
From: Markus Elfring <Markus.Elfring@web.de>
Message-ID: <e5e03d6b-46bd-5ece-a7f6-3cb557c3b0b0@web.de>
Date: Tue, 14 Apr 2020 10:53:02 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

=E2=80=A6
> +++ b/drivers/remoteproc/remoteproc_core.c
=E2=80=A6
> @@ -2105,11 +2104,8 @@ struct rproc *rproc_alloc(struct device *dev, con=
st char *name,
=E2=80=A6
> +out:
> +	put_device(&rproc->dev);

How do you think about to use the label =E2=80=9Cput_device=E2=80=9D?

Regards,
Markus
