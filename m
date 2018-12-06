Return-Path: <benjamin.gaignard@linaro.org>
MIME-Version: 1.0
References: <20181114090027.7580-1-benjamin.gaignard@linaro.org>
 <CA+M3ks5m1=gsGqB55T4xSGtAQW9Ct3Fxqx-gbYg=GoNwoX6B-w@mail.gmail.com> <20181206011045.GA23336@builder>
In-Reply-To: <20181206011045.GA23336@builder>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Thu, 6 Dec 2018 10:10:48 +0100
Message-ID: <CA+M3ks5-5OWPz7Dan5fO6vTp74NpgCNxRhj1CL14hHSaTwrouQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Add support of STM32 hwspinlock
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Torgue <alexandre.torgue@st.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
List-ID: <linux-remoteproc@vger.kernel.org>

Le jeu. 6 d=C3=A9c. 2018 =C3=A0 02:12, Bjorn Andersson
<bjorn.andersson@linaro.org> a =C3=A9crit :
>
> On Fri 30 Nov 06:45 PST 2018, Benjamin Gaignard wrote:
>
> > Le mer. 14 nov. 2018 =C4=85 10:00, Benjamin Gaignard
> > <benjamin.gaignard@linaro.org> a =C3=A9crit :
> > >
> > > This serie adds the support of the hardware semaphore block for stm32=
mp1 SoC.
> > >
> > > version 4:
> > > - add Linaro SoB
> >
> > Gentle ping on this series
> >
>
> Sorry about that Benjamin, I was convinced that I picked your patches
> already. Applied first two patches to hwspinlock tree.

Thanks.

>
> I expect the dts update to go through the ST tree, and I guess the
> complaint from 0day tells us they already are?

Yes I will send fixed dts patches for stm32 tree

>
> Regards,
> Bjorn
