Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 17 May 2017 11:06:11 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2] hwspinlock: sprd: Add hardware spinlock driver
Message-ID: <20170517180611.GD12920@tuxbook>
References: <5c2ac9be5fcfe0161952070ffdcb1cf7ed51128f.1495000470.git.baolin.wang@spreadtrum.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c2ac9be5fcfe0161952070ffdcb1cf7ed51128f.1495000470.git.baolin.wang@spreadtrum.com>
To: Baolin Wang <baolin.wang@spreadtrum.com>
Cc: ohad@wizery.com, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 16 May 22:59 PDT 2017, Baolin Wang wrote:

> The Spreadtrum hardware spinlock device can provide hardware assistance
> for synchronization between the multiple subsystems.
> 
> Signed-off-by: Baolin Wang <baolin.wang@spreadtrum.com>
> ---
> Changes since v1:
>  - Remove some unused macros and functions.
>  - Convert readl/writel_relaxed() to readl/writel.
>  - Remove some redundant error printing.
>  - Get clock with devm_clk_get().
>  - Other small optimization.

Looks good, merge this to my next branch before realizing that you
didn't send a DT binding document.

Can you please send a patch adding a binding document as well? (No need
to resend this patch)

Regards,
Bjorn
