Return-Path: <Baolin.Wang@spreadtrum.com>
Date: Thu, 18 May 2017 09:54:54 +0800
From: Baolin Wang <baolin.wang@spreadtrum.com>
Subject: Re: [PATCH v2] hwspinlock: sprd: Add hardware spinlock driver
Message-ID: <20170518015453.GB14416@spreadtrum.com>
References: <5c2ac9be5fcfe0161952070ffdcb1cf7ed51128f.1495000470.git.baolin.wang@spreadtrum.com>
 <20170517180611.GD12920@tuxbook>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170517180611.GD12920@tuxbook>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: ohad@wizery.com, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 三,  5月 17, 2017 at 11:06:11上午 -0700, Bjorn Andersson wrote:
> On Tue 16 May 22:59 PDT 2017, Baolin Wang wrote:
> 
> > The Spreadtrum hardware spinlock device can provide hardware assistance
> > for synchronization between the multiple subsystems.
> > 
> > Signed-off-by: Baolin Wang <baolin.wang@spreadtrum.com>
> > ---
> > Changes since v1:
> >  - Remove some unused macros and functions.
> >  - Convert readl/writel_relaxed() to readl/writel.
> >  - Remove some redundant error printing.
> >  - Get clock with devm_clk_get().
> >  - Other small optimization.
> 
> Looks good, merge this to my next branch before realizing that you
> didn't send a DT binding document.
> 
> Can you please send a patch adding a binding document as well? (No need
> to resend this patch)

Sure, I will send out the patches adding binding cocument and dts. Thanks.
