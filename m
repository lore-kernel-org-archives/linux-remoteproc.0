Return-Path: <sricharan@codeaurora.org>
Subject: Re: [PATCH v5 0/6] Add support for Hexagon q6v5-wcss integrated core
References: <1510656794-3815-1-git-send-email-sricharan@codeaurora.org>
From: Sricharan R <sricharan@codeaurora.org>
Message-ID: <a4f0213d-62c2-b749-9fd2-e7c4a304b5e5@codeaurora.org>
Date: Tue, 19 Dec 2017 17:21:20 +0530
MIME-Version: 1.0
In-Reply-To: <1510656794-3815-1-git-send-email-sricharan@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: bjorn.andersson@linaro.org, ohad@wizery.com, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

On 11/14/2017 4:23 PM, Sricharan R wrote:
> IPQ8074 has an integrated Hexagon dsp core Q6v5 and a wireless lan
> (Lithium) IP. This series adds the remoteproc driver to reset, load
> and boot Q6 firmware.
> 
> The first patch is to make the mdt_loader authenticate
> the firmware only if required, so that the code can be reused for
> self-authenticating firmware like the Q6v5 core in IPQ8074. The second
> patch exports the elf header's get_boot_addr helper to reuse it.
> The next couple of patches arranges the code in the original q6v5-mpss
> rproc to add q6v5-wcss later. The last couple of patches add the relevant
> bits for the q6v5-wcss core.
> 
> This is done on top of Avaneesh's msm8996 rproc support [1]
> 
> [1] https://lkml.org/lkml/2017/10/24/771
> 
> v5:
>     No change. Just updated tags in PATCH #5
> 
> V4:
>     Fixed Bjorn's comment in PATCH#1 and added his acked-by
>     Rebased on top of Avinash's latest rproc for msm8996 q6 support.
> 
> V3:
>     Rebased on top of latest remoteproc next
> 
> V2:
>     Last time introduced this a new rproc driver, but there is lot
>     of code that can be shared if it is added to the q6v5-mpss pil
>     driver.
> 
> Sricharan R (6):
>   remoteproc: qcom: mdt_loader: Make the firmware authentication
>     optional
>   remoteproc: Export rproc_elf_get_boot_addr
>   remoteproc: qcom: Push reset ops, fw ops, rproc ops in to of_match
>     data
>   remoteproc: qcom: Split the head and tail of the q6v5-pil rproc start
>     function
>   remoteproc: qcom: Add support for q6v5-wcss pil
>   remoteproc: qcom: Add q6v5-wcss rproc ops
> 

Hi Bjorn,
 Just thought of pinging you to figure out if the
 patches are ok and any feedback ?

Regards,
 Sricharan


-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
