Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v2 0/7] remoteproc: Refactor function rproc_alloc()
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
From: Suman Anna <s-anna@ti.com>
Message-ID: <b1a1d496-5ffa-95c1-0f06-7ea9f6b7e401@ti.com>
Date: Fri, 17 Apr 2020 08:34:27 -0500
MIME-Version: 1.0
In-Reply-To: <20200415204858.2448-1-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Mathieu Poirier <mathieu.poirier@linaro.org>, bjorn.andersson@linaro.org, ohad@wizery.com
Cc: elder@linaro.org, Markus.Elfring@web.de, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Mathieu,
On 4/15/20 3:48 PM, Mathieu Poirier wrote:
> Good afternoon,
> 
> This is the second installment in this series, the first one can be
> found here[1].  The goal of the work is to consolidate modifications to
> function rproc_alloc() that were made over the last weeks[2][3][4] to
> provide a common foundation to work from and avoid merge conflicts.
> 
> Applies cleanly on v5.7-rc1

Thanks for the patches. Overall looks good. I have couple of minor 
comments, will post them in the respective patches.

> 
> Thanks,
> Mathieu
> 
> New for V2:
> - Reworked title for patch 01.
> - Added "Fixes" tag to patch 01.
> - Using kasprintf() instead of complex memory allocation.
> - Using kstrdup_const() instead of kstrdup().
> - Reworked rproc_alloc_firmware() to use non-negative form.
> 
> [1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=270239
> [2]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=261069
> [3]. https://patchwork.kernel.org/patch/11456385/

I have since reworked this and posted the next version on top of this 
series.
https://patchwork.kernel.org/patch/11493941/

regards
Suman

> [4]. https://patchwork.kernel.org/patch/11473241/
> 
> Alex Elder (1):
>    remoteproc: Fix IDR initialisation in rproc_alloc()
> 
> Mathieu Poirier (6):
>    remoteproc: Split firmware name allocation from rproc_alloc()
>    remoteproc: Simplify default name allocation
>    remoteproc: Use kstrdup_const() rather than kstrup()
>    remoteproc: Restructure firmware name allocation
>    remoteproc: Split rproc_ops allocation from rproc_alloc()
>    remoteproc: Get rid of tedious error path
> 
>   drivers/remoteproc/remoteproc_core.c | 96 +++++++++++++++-------------
>   include/linux/remoteproc.h           |  2 +-
>   2 files changed, 54 insertions(+), 44 deletions(-)
> 
