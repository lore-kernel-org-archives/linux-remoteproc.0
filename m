Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 28 Jun 2016 14:22:19 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 2/2] remoteproc: qcom: Introduce WCNSS peripheral
 image loader
Message-ID: <20160628212219.GG1190@tuxbot>
References: <1467147506-753-1-git-send-email-bjorn.andersson@linaro.org>
 <1467147506-753-2-git-send-email-bjorn.andersson@linaro.org>
 <115043528.GxNIb9dTCg@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <115043528.GxNIb9dTCg@wuerfel>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, John Stultz <john.stultz@linaro.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 28 Jun 14:05 PDT 2016, Arnd Bergmann wrote:

> On Tuesday, June 28, 2016 1:58:26 PM CEST Bjorn Andersson wrote:
> > 
> > +config QCOM_WCNSS_PIL
> > +       tristate "Qualcomm WCNSS Peripheral Image Loader"
> > +       depends on OF && ARCH_QCOM
> > +       select QCOM_MDT_LOADER
> > +       select QCOM_SCM
> > +       select REMOTEPROC
> > +       help
> > +         Say y here to support the Peripherial Image Loader for the Qualcomm
> > +         Wireless Connectivity Subsystem.
> > +
> > 
> 
> 	"depends on QCOM_SMEM"
> 
> This showed up in Linux-next today and caused a build error:
> 
> drivers/remoteproc/built-in.o: In function `q6v5_fatal_interrupt':
> qcom_q6v5_pil.c:(.text+0x2428): undefined reference to `qcom_smem_get'
> drivers/remoteproc/built-in.o: In function `q6v5_wdog_interrupt':
> qcom_q6v5_pil.c:(.text+0x2498): undefined reference to `qcom_smem_get'
> 

I was convinced I had stubs for those, sorry for not making sure. I
amended rproc-next with this.

Thanks,
Bjorn
