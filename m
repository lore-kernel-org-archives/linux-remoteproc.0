Return-Path: <robh+dt@kernel.org>
MIME-Version: 1.0
References: <20181114090027.7580-1-benjamin.gaignard@linaro.org> <CA+M3ks5m1=gsGqB55T4xSGtAQW9Ct3Fxqx-gbYg=GoNwoX6B-w@mail.gmail.com>
In-Reply-To: <CA+M3ks5m1=gsGqB55T4xSGtAQW9Ct3Fxqx-gbYg=GoNwoX6B-w@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 4 Dec 2018 14:47:06 -0600
Message-ID: <CAL_Jsq+Em=7NeBCwkZyzmAfG8po-2E9SfO_Ukf0+h1CqH_3vxQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Add support of STM32 hwspinlock
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Torgue <alexandre.torgue@st.com>, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Nov 30, 2018 at 8:45 AM Benjamin Gaignard
<benjamin.gaignard@linaro.org> wrote:
>
> Le mer. 14 nov. 2018 =C3=A0 10:00, Benjamin Gaignard
> <benjamin.gaignard@linaro.org> a =C3=A9crit :
> >
> > This serie adds the support of the hardware semaphore block for stm32mp=
1 SoC.
> >
> > version 4:
> > - add Linaro SoB
>
> Gentle ping on this series

Maybe you want to fix the 0-day error and resend.

Does adding the hwlock to the interrupt controller depend on this series?

Rob
