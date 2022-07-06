Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBFBC433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jul 2022 12:41:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232099AbiGFMlE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 6 Jul 2022 08:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230362AbiGFMlE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 6 Jul 2022 08:41:04 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0E94252AA;
        Wed,  6 Jul 2022 05:41:03 -0700 (PDT)
Received: from [192.168.1.101] (abxi46.neoplus.adsl.tpnet.pl [83.9.2.46])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id ED5563F727;
        Wed,  6 Jul 2022 14:41:01 +0200 (CEST)
Message-ID: <84083c41-be8e-15c0-7dc0-a5cd2895566c@somainline.org>
Date:   Wed, 6 Jul 2022 14:41:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [V3 4/7] remoteproc: qcom: pas: Check if coredump is enabled
Content-Language: en-US
To:     Sibi Sankar <quic_sibis@quicinc.com>, bjorn.andersson@linaro.org
Cc:     agross@kernel.org, mathieu.poirier@linaro.org,
        dmitry.baryshkov@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Siddharth Gupta <sidgup@codeaurora.org>
References: <1657022900-2049-1-git-send-email-quic_sibis@quicinc.com>
 <1657022900-2049-5-git-send-email-quic_sibis@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <1657022900-2049-5-git-send-email-quic_sibis@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 5.07.2022 14:08, Sibi Sankar wrote:
> From: Siddharth Gupta <sidgup@codeaurora.org>
> 
> Client drivers need to check if coredump is enabled for the rproc before
> continuing with coredump generation. This change adds a check in the PAS
> driver.
> 
> Fixes: 8ed8485c4f05 ("remoteproc: qcom: Add capability to collect minidumps")
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  drivers/remoteproc/qcom_q6v5_pas.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 43dde151120f..d103101a5ea0 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -92,6 +92,9 @@ static void adsp_minidump(struct rproc *rproc)
>  {
>  	struct qcom_adsp *adsp = rproc->priv;
>  
> +	if (rproc->dump_conf == RPROC_COREDUMP_DISABLED)
> +		return;
> +
>  	qcom_minidump(rproc, adsp->minidump_id);
>  }
>  
