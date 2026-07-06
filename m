Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F94430CE5
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 Jul 2026 15:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353481; cv=pass; b=jVzJ9ucalRYq7hUN0RJved4SwLFqdLbeYc8mgY+5zl5+J97gcZfll4QTPxwPRIaaWqhRZHgdKhRF4d/82Hv0hOHp5FkMAe2z/CW/mesZQ8ZWYCPKe4vFbw//SH8sU/FM+kS2Al1rOGZ0CbdskPE/fwuHf6uCCnlB/1veuscNVCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353481; c=relaxed/simple;
	bh=gCs9HokUb+6ZMGzRlYcfJL9jBr5oqoU0ENUXdBhbWys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UoxfwRCADJwTwsSx9D8VPEir9A3ZzjUjQozN9JHZdEMyYVXM4W+9deCEoXXOSnMjg+RlSFpLtmQs2Iq/H0pPJFcluGNM4idDMe19VNqKems4o3FqzvteHfU+dctXz5X8+xZWtXij2LDsjTqtvjEtSpM8uUt5IqUnVAEay9Ol1u4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z+/eLfFN; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z+/eLfFN"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c126f9c9567so384958566b.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 08:57:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783353478; cv=none;
        d=google.com; s=arc-20260327;
        b=BL2DhwHnPQP2sRo9lDHzLmcCVVPaTVTv6ZMrCF9S816r8XIhMIJxweESsrWgo2b7aa
         cHe/FtGcUG55GVZkl62chr44PHt5ckrWu+n7I4GjxLYKK+/b1xeJGWGbaQlySlocKALA
         vZVch5QaZ1tINJMBWEirS1OSBIl0tyPfEdsxBNMs2UU6uJq9TOWp4TAVKz9vy7HFOxuZ
         Bd1eemdVgXEVy1H0kyerpgDE4+3uN6yUgBhkj0a89Hff4DNmoQfix23D7qbQ0mff0je2
         A7BrxHV1YTFYq479L0FU5v5eR4KQ1nubxOQqGmQuqtmieJ8ZHR/fz4wd/w6U/FMoS7Z6
         TW5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lGxnHQcUvM+Wk9iuDAhV9iKJOnzCJXCRMoquKntthQc=;
        fh=sRksV3uMnFIbCzzhklTpTI6f/RZIJdTluxqfgLi1OWk=;
        b=OjJqGHOBri6S6wQSvi6Dxm3GvqF+lEpWTmug5xJz6pApvHOCnF4r2IyBWHrSrqRqm5
         K1ZrYcUNfl2u7mfPvCZq62QFzdBvT8mNN5QG8PSIKXTa1xCMQqmw4FsQEJt4qX5JcXxZ
         Ht+czZ04rwoFvomuViSIBq01hqJlJELAhgpDHDTDJMFozE2ZMN3ejlwcu3rAh/uw1lL0
         5eYeQYZd8Sk5/gmlHGRBX5vXQVmzWnsifNcXOgv3ff4phU+EAogD7VCVV/jeHOq0XzGy
         dhpgRewQHqosGo3YIkEElAcNYuADbPw/n91fYfkT4x/zNO+uInMEbBHKJ4T80FcIg69X
         nZWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783353478; x=1783958278; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGxnHQcUvM+Wk9iuDAhV9iKJOnzCJXCRMoquKntthQc=;
        b=Z+/eLfFN6xCQ/JXzVDa72FWOBSmvZ2SHuV4SdsDbvXjEyKc7QtkRbACuGnlZmMG1kS
         21xIPFkDIo19WZWh4MCGa4sk2CXpayXD+H7uysfPymrkR11lVhaYQsy9vLo9bLKb8A6Y
         J7RgKGvrNJf78fC8qhM7hy4ya+8hxs5TsxX7lhtYNglg6SzH2zpVinycyfn84YPIu6H5
         s0TrKrmW0KzxtTjJuha8xi0nxCtR5aqldd/QyCQfIfdFotfXtR3TKSAdS6pRs9vAXOZm
         d8f1EjuuZdwgNaLvS6tH4uHhS9ttCCosKo2FD8YrHuH4jO28GtDw3mVpSPdp8lR97Dso
         z2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353478; x=1783958278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lGxnHQcUvM+Wk9iuDAhV9iKJOnzCJXCRMoquKntthQc=;
        b=XHlnbAOslDmqoMnoarz+kELgaQSiLcWsVxpylmrK2fMkTr5PnnQKr21+F4P3BWWBwC
         j87M2UVkj4GeUiiu7LNdjOGx947b36NqlqHzrY7zP6c5qgcSelvedvOJiuoeQa4DonIU
         DPDVQVnzr1chPO417KcJPPYeelEBTxqXrEXUnyYILVUI4kYFooGvB2B6u1RhAt2/PYct
         4TyLLYvn7vSi5PGPrgLm2ZsdAz6VPZQNnGFZ2P5oLIXD3Z8FPo1y3lLJ6pri/lbPowJQ
         JfpxGI+r1QYjdo55vUBh0kP6/dWOAHa+tVFqlj1SbhO+evebeDoRoxRdkvIm6qlKUDk3
         iYPA==
X-Forwarded-Encrypted: i=1; AHgh+Roih6ZN8kijCGi/Qzt6yYbbReTLDQF8xhn2hJWPkwQEVfXWXnOQqJhmQB4uRaSBToWr3pmTQy+BMh3NJpwbNJSE@vger.kernel.org
X-Gm-Message-State: AOJu0YwOcMdW9gz45OSzax6F6v/0MDP7AS6T5Urw9BAbBvyG5Tkx3WfS
	qEIJ96Jsry9fEwTRm93Odg1uAUATcVFs45DWKQWR+Zq6uFsnQgSl6LMTZFkSeidgTMba4bb/+ku
	pmADbZeBJBFLMKjpMwKRZEv0ZrP0EAFCB2RJtLq1IMA==
X-Gm-Gg: AfdE7clCM8HIAxFiKtvSC6cPaxXSoKsKFnGos+ZBw6B4GaT73Ao+Aid8I5SwZUKPnXg
	miRGyHb6cAfW1uZo1Ku3kwPUZvFaYGG2F5jArkqSbFRxDPOrg7Zi3hdD/mH/U7PR+YIUNmwItJb
	SBwC3jkOhWeHJS0F1zFtfLoL12xUJ3+H1rHWcCZ0NMSjElPLSCERK7ps9Y/HEEe5q239qSbOJz+
	UzgQciOk05T1Fh9IA9kEWRVxeo/16k/xwn0ECyVPvzre18I/4Q1TIwTBkmdnRPtlojWedBJqX0E
	XefIhOch4jZzXlIWsxIl9Q5IAMfp
X-Received: by 2002:a17:906:3ce:b0:c12:992b:16d4 with SMTP id
 a640c23a62f3a-c15a68cf56fmr47982566b.41.1783353478105; Mon, 06 Jul 2026
 08:57:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com> <PAXPR04MB91855056638F0028BCC5F9EF89F12@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB91855056638F0028BCC5F9EF89F12@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 6 Jul 2026 09:57:47 -0600
X-Gm-Features: AVVi8CfCK8RZVsOnom89zz62dC_eh8WB0dnPwnnTYPsAfwJakdAft3ffWaiSkNg
Message-ID: <CANLsYkxmf=QfNUe=BLrrP7kBtZKq2Z1BkQDLnzmcQsW-kYzTPQ@mail.gmail.com>
Subject: Re: [PATCH v14 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
To: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, "b-padhi@ti.com" <b-padhi@ti.com>, 
	Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 6 Jul 2026 at 09:40, Shenwei Wang (OSS)
<shenwei.wang@oss.nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Shenwei Wang (OSS)
> > Sent: Thursday, June 25, 2026 10:55 AM
> > To: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel=
.org>;
> > Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysz=
tof
> > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjo=
rn
> > Andersson <andersson@kernel.org>; Mathieu Poirier
> > <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>
> > Cc: Shuah Khan <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org;=
 linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel T=
eam
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Shenwei
> > Wang <shenwei.wang@nxp.com>; Peng Fan <peng.fan@nxp.com>;
> > devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx=
 <linux-
> > imx@nxp.com>; Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>; b-
> > padhi@ti.com; Andrew Lunn <andrew@lunn.ch>
> > Subject: [PATCH v14 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
> >
> > From: Shenwei Wang <shenwei.wang@nxp.com>
> >
> > Support the remote devices on the remote processor via the RPMSG bus on=
 i.MX
> > platform.
> >
> > Changes in v14:
> >  - Update gpio-rpmsg.rst per Mathieu=E2=80=99s feedback.
>
> Hi Mathieu,
>
> Could you please let me know if you have any further comments on this ver=
sion?

I intend to review your patches but other people's work is ahead of yours.

>
> Thanks,
> Shenwei
>
> >  - Align the rpmsg-gpio driver with the revised gpio-rpmsg.rst.
> >  - Modify rpmsg-core to enable prefix-based matching of RPMSG device ID=
s.
> >
> > Changes in v13:
> >  - drop the support for legacy NXP firmware.
> >  - remove the fixed_up hooks from the rpmsg gpio driver.
> >  - code cleanup.
> >
>
