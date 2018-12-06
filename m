Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 5 Dec 2018 17:10:45 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 0/4] Add support of STM32 hwspinlock
Message-ID: <20181206011045.GA23336@builder>
References: <20181114090027.7580-1-benjamin.gaignard@linaro.org>
 <CA+M3ks5m1=gsGqB55T4xSGtAQW9Ct3Fxqx-gbYg=GoNwoX6B-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+M3ks5m1=gsGqB55T4xSGtAQW9Ct3Fxqx-gbYg=GoNwoX6B-w@mail.gmail.com>
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Ohad Ben Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Torgue <alexandre.torgue@st.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 30 Nov 06:45 PST 2018, Benjamin Gaignard wrote:

> Le mer. 14 nov. 2018 � 10:00, Benjamin Gaignard
> <benjamin.gaignard@linaro.org> a �crit :
> >
> > This serie adds the support of the hardware semaphore block for stm32mp1 SoC.
> >
> > version 4:
> > - add Linaro SoB
> 
> Gentle ping on this series
> 

Sorry about that Benjamin, I was convinced that I picked your patches
already. Applied first two patches to hwspinlock tree.

I expect the dts update to go through the ST tree, and I guess the
complaint from 0day tells us they already are?

Regards,
Bjorn
