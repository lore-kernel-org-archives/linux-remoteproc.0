Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 2/2] remoteproc: qcom: Introduce WCNSS peripheral image loader
Date: Tue, 28 Jun 2016 23:05:25 +0200
Message-ID: <115043528.GxNIb9dTCg@wuerfel>
In-Reply-To: <1467147506-753-2-git-send-email-bjorn.andersson@linaro.org>
References: <1467147506-753-1-git-send-email-bjorn.andersson@linaro.org> <1467147506-753-2-git-send-email-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
To: linux-arm-kernel@lists.infradead.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, John Stultz <john.stultz@linaro.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tuesday, June 28, 2016 1:58:26 PM CEST Bjorn Andersson wrote:
> 
> +config QCOM_WCNSS_PIL
> +       tristate "Qualcomm WCNSS Peripheral Image Loader"
> +       depends on OF && ARCH_QCOM
> +       select QCOM_MDT_LOADER
> +       select QCOM_SCM
> +       select REMOTEPROC
> +       help
> +         Say y here to support the Peripherial Image Loader for the Qualcomm
> +         Wireless Connectivity Subsystem.
> +
> 

	"depends on QCOM_SMEM"

This showed up in Linux-next today and caused a build error:

drivers/remoteproc/built-in.o: In function `q6v5_fatal_interrupt':
qcom_q6v5_pil.c:(.text+0x2428): undefined reference to `qcom_smem_get'
drivers/remoteproc/built-in.o: In function `q6v5_wdog_interrupt':
qcom_q6v5_pil.c:(.text+0x2498): undefined reference to `qcom_smem_get'


	Arnd
