Return-Path: <Markus.Elfring@web.de>
Subject: Re: [v2 5/7] remoteproc: Restructure firmware name allocation
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
 <20200415204858.2448-6-mathieu.poirier@linaro.org>
 <aa565fea-b1c4-9b5c-73ed-591244afee19@web.de>
 <e887c990-8cba-62b0-0f47-3ea0c166d603@ti.com>
From: Markus Elfring <Markus.Elfring@web.de>
Message-ID: <7a978c24-945d-8d39-3a0a-30e0678d569a@web.de>
Date: Fri, 17 Apr 2020 17:48:49 +0200
MIME-Version: 1.0
In-Reply-To: <e887c990-8cba-62b0-0f47-3ea0c166d603@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Suman Anna <s-anna@ti.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
List-ID: <linux-remoteproc@vger.kernel.org>

>> =C2=A0=C2=A0=C2=A0=C2=A0p =3D firmware ? kstrdup_const(=E2=80=A6) : kas=
printf(=E2=80=A6);
>
> For simple assignments, I too prefer the ternary operator,

Thanks for your feedback.


> but in this case, I think it is better to leave the current code as is.

Would you like to consider the use of the function =E2=80=9Ckvasprintf_con=
st=E2=80=9D
according to your review comment for the update step =E2=80=9C[PATCH v2 4/=
7] remoteproc:
Use kstrdup_const() rather than kstrup()=E2=80=9D?

Regards,
Markus
