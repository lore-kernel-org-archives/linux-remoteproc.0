Return-Path: <sboyd@codeaurora.org>
Date: Wed, 23 Nov 2016 14:48:17 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/3] remoteproc: qcom: mdt_loader: add include for sizes
Message-ID: <20161123224817.GC6095@codeaurora.org>
References: <1479834137-30069-1-git-send-email-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1479834137-30069-1-git-send-email-stanimir.varbanov@linaro.org>
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 11/22, Stanimir Varbanov wrote:
> Add linux/sizes.h to prevent build failure on non ARM architectures
> as:
> 
> CC [M]  drivers/remoteproc/qcom_mdt_loader.o
> In file included from include/linux/cache.h:4:0,
>                  from include/linux/printk.h:8,
>                  from include/linux/kernel.h:13,
>                  from include/asm-generic/bug.h:13,
>                  from arch/x86/include/asm/bug.h:35,
>                  from include/linux/bug.h:4,
>                  from include/linux/thread_info.h:11,
>                  from arch/x86/include/asm/elf.h:7,
>                  from include/linux/elf.h:4,
>                  from drivers/remoteproc/qcom_mdt_loader.c:18:
> drivers/remoteproc/qcom_mdt_loader.c: In function ‘qcom_mdt_parse’:
> drivers/remoteproc/qcom_mdt_loader.c:90:52: error: ‘SZ_4K’ undeclared
> (first use in this function)
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
