Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8AD0C433FE
	for <linux-remoteproc@archiver.kernel.org>; Sat,  1 Oct 2022 16:00:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbiJAQA5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 1 Oct 2022 12:00:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbiJAQAy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 1 Oct 2022 12:00:54 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4419870E64
        for <linux-remoteproc@vger.kernel.org>; Sat,  1 Oct 2022 09:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1664639687;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=wKZBd6Gka4D6vhdEJ/JXPv7waVGDQl1vHcwD3kgP+VU=;
    b=Ub5dgY8VXnRkVbPddPrqjwDftCUgGZLZ6r9Jku5a5binaFKK4DYCLYCvZyIiBBj6Pv
    tqO2lg2dE8cOo7XWIR/I0Cedygnkel0a9YF0L4LX+0NnDzEvIONNCAex9gPlyedC4A0o
    ZBBY49cXoQyPIoOVbcS6OfU01yDACJmQ2ue21u6FlRxJVLr2jWPJcco894/hCrkgmXGh
    nBaLsdigYuagKMzrxn+ATYKF00OfcbUk3y9bz9wP2YAkm95QK6i9FJ+rGSryGB1ykTT7
    5NLiKcZ3Kt/hfeMQsLsoz8vB1VbALpEr6V4O1m+m01WWOQpWBvtIhd5nGjtFQLhPgYKt
    SyrQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrKw7/aY="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 48.1.3 AUTH)
    with ESMTPSA id 06b848y91FslATX
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Sat, 1 Oct 2022 17:54:47 +0200 (CEST)
Date:   Sat, 1 Oct 2022 17:54:41 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Sireesh Kodali <sireeshkodali1@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-kernel@vger.kernel.org, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v6 1/5] remoteproc: qcom: qcom_wcnss: Add support for
 pronto-v3
Message-ID: <YzhiwXPTf6IQcOvb@gerhold.net>
References: <20221001031345.31293-1-sireeshkodali1@gmail.com>
 <20221001031345.31293-2-sireeshkodali1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221001031345.31293-2-sireeshkodali1@gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, Oct 01, 2022 at 08:43:40AM +0530, Sireesh Kodali wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Pronto-v3 is similar to pronto-v2. It requires two power domains, one
> regulator, and it requires the xo clock. It is used on the MSM8953
> platform.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

> ---
>  drivers/remoteproc/qcom_wcnss.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index 68f37296b151..f599d5d5719d 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -141,6 +141,17 @@ static const struct wcnss_data pronto_v2_data = {
>  	.num_vregs = 1,
>  };
>  
> +static const struct wcnss_data pronto_v3_data = {
> +	.pmu_offset = 0x1004,
> +	.spare_offset = 0x1088,
> +
> +	.pd_names = { "mx", "cx" },
> +	.vregs = (struct wcnss_vreg_info[]) {
> +		{ "vddpx", 1800000, 1800000, 0 },
> +	},
> +	.num_vregs = 1,
> +};
> +
>  static int wcnss_load(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct qcom_wcnss *wcnss = (struct qcom_wcnss *)rproc->priv;
> @@ -675,6 +686,7 @@ static const struct of_device_id wcnss_of_match[] = {
>  	{ .compatible = "qcom,riva-pil", &riva_data },
>  	{ .compatible = "qcom,pronto-v1-pil", &pronto_v1_data },
>  	{ .compatible = "qcom,pronto-v2-pil", &pronto_v2_data },
> +	{ .compatible = "qcom,pronto-v3-pil", &pronto_v3_data },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, wcnss_of_match);
> -- 
> 2.37.3
> 
