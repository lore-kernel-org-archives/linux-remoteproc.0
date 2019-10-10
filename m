Return-Path: <fabien.dessenne@st.com>
From: Fabien DESSENNE <fabien.dessenne@st.com>
Subject: RE: [PATCH 0/2] remoteproc: stm32: allow wdg irq to be a wakeup
 source
Date: Thu, 10 Oct 2019 15:16:19 +0000
Message-ID: <1bef12295e864dfa90edfa495803167f@SFHDAG5NODE3.st.com>
References: <1566833923-16718-1-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1566833923-16718-1-git-send-email-fabien.dessenne@st.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Cc: Loic PALLARDY <loic.pallardy@st.com>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi

I Got Rob's Reviewed-by for the bindings. Any further comments for the driv=
er part?

Fabien

> -----Original Message-----
> From: Fabien DESSENNE <fabien.dessenne@st.com>
> Sent: lundi 26 ao=FBt 2019 17:39
> To: Rob Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>=
;
> Maxime Coquelin <mcoquelin.stm32@gmail.com>; Alexandre TORGUE
> <alexandre.torgue@st.com>; Ohad Ben-Cohen <ohad@wizery.com>; Bjorn
> Andersson <bjorn.andersson@linaro.org>; devicetree@vger.kernel.org; linux=
-
> stm32@st-md-mailman.stormreply.com; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org; linux-remoteproc@vger.kernel.org
> Cc: Fabien DESSENNE <fabien.dessenne@st.com>; Loic PALLARDY
> <loic.pallardy@st.com>; Arnaud POULIQUEN <arnaud.pouliquen@st.com>
> Subject: [PATCH 0/2] remoteproc: stm32: allow wdg irq to be a wakeup sour=
ce
>=20
> The watchdog IRQ which notifies the remote processor crash is used by the
> remoteproc framework to perform a recovery procedure.
> Since this IRQ may be fired when the Linux system is suspended, this IRQ =
may
> be configured to wake up the system.
>=20
> Fabien Dessenne (2):
>   dt-bindings: remoteproc: stm32: add wakeup-source
>   remoteproc: stm32: wakeup the system by wdg irq
>=20
>  .../devicetree/bindings/remoteproc/stm32-rproc.txt |  3 ++
>  drivers/remoteproc/stm32_rproc.c                   | 47 ++++++++++++++++=
++++++
>  2 files changed, 50 insertions(+)
>=20
> --
> 2.7.4
