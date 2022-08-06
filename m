Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B496C19F2D
	for <linux-remoteproc@archiver.kernel.org>; Sat,  6 Aug 2022 20:39:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231979AbiHFUjP (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 6 Aug 2022 16:39:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbiHFUjO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 6 Aug 2022 16:39:14 -0400
Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr [80.12.242.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60C56DF19
        for <linux-remoteproc@vger.kernel.org>; Sat,  6 Aug 2022 13:39:12 -0700 (PDT)
Received: from [192.168.1.18] ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id KQZgoofew9RnzKQZho5L2z; Sat, 06 Aug 2022 22:39:10 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 06 Aug 2022 22:39:10 +0200
X-ME-IP: 90.11.190.129
Message-ID: <2729cd6f-17ff-70d8-52c5-3dceb93e6a82@wanadoo.fr>
Date:   Sat, 6 Aug 2022 22:39:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 7/8] remoteproc: qcom: Add support for memory sandbox
Content-Language: fr
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
References: <1659536480-5176-1-git-send-email-quic_srivasam@quicinc.com>
 <1659536480-5176-8-git-send-email-quic_srivasam@quicinc.com>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     agross@kernel.org, bgoswami@quicinc.com,
        bjorn.andersson@linaro.org, broonie@kernel.org,
        devicetree@vger.kernel.org, judyhsiao@chromium.org,
        lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        perex@perex.cz, quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
        robh+dt@kernel.org, srinivas.kandagatla@linaro.org,
        swboyd@chromium.org, tiwai@suse.com
In-Reply-To: <1659536480-5176-8-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

the error handling below looks odd.

Le 03/08/2022 à 16:21, Srinivasa Rao Mandadapu a écrit :
> Add memory sandbox support for ADSP based platforms secure booting.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>
> ---
>   drivers/remoteproc/qcom_q6v5_adsp.c | 101 +++++++++++++++++++++++++++++++++++-
>   1 file changed, 99 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index 3dbd035..f81da47 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c

>   static int adsp_start(struct rproc *rproc)
>   {
>   	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
> @@ -341,7 +429,13 @@ static int adsp_start(struct rproc *rproc)
>   	ret = qcom_q6v5_prepare(&adsp->q6v5);
>   	if (ret)
>   		return ret;
> -
> +	if (!adsp->is_wpss) {
> +		ret = adsp_map_smmu(adsp, rproc);
> +		if (ret) {
> +			dev_err(adsp->dev, "ADSP smmu mapping failed\n");
> +			goto adsp_smmu_unmap;
goto disable_irqs;?

> +		}
> +	}
>   	ret = clk_prepare_enable(adsp->xo);
>   	if (ret)
>   		goto disable_irqs;

goto adsp_smmu_unmap;?

> @@ -402,6 +496,9 @@ static int adsp_start(struct rproc *rproc)
>   	clk_disable_unprepare(adsp->xo);
>   disable_irqs:
>   	qcom_q6v5_unprepare(&adsp->q6v5);
> +adsp_smmu_unmap:
> +	iommu_unmap(adsp->iommu_dom, adsp->mem_phys, adsp->mem_size);
> +	iommu_domain_free(adsp->iommu_dom);

Should this new hunk be above disable_irqs?
And I think that it should be guardd with a "if (!adsp->is_wpss)".

CJ

>   
>   	return ret;
>   }

