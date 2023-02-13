Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E7AFC05027
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Feb 2023 00:55:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjBMAzv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 12 Feb 2023 19:55:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjBMAzu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 12 Feb 2023 19:55:50 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EC12F757
        for <linux-remoteproc@vger.kernel.org>; Sun, 12 Feb 2023 16:55:49 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id sb24so4235187ejb.8
        for <linux-remoteproc@vger.kernel.org>; Sun, 12 Feb 2023 16:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JH49W9eMFnXRT5zK561nWkTm+ipq8KfAKnXusgHt7cc=;
        b=InfDGWsdqjq+cceTSFETLw4Mbym27Gi+BialupS1gc/qBlKNTiUr9W/LqS/VHHRHpw
         ta3NouOiODa/YPLV2fMGtUDGPu/k2Ft/VnqCmKhqLuqQ8hy4GoCt60IWdMPxugOyDFqp
         PSXZ/tRhx71gImJbGQwbBDjV2jSFAcrHD2B8pvJGz2CVU/Ub00yas4j0YzYxYTbwJsFd
         DwcuAq+G64//CwLL+4n7kC7HZrmSysDH76MCP33YnbC2L0W/0vTih7efFL+iTk8boqr+
         erzrL5/SbXf8CEUYsttqFBfW0r8tiId4z1SKOKEfvJT6IuO8183ds+Mmid5/hINO9AeI
         1zXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JH49W9eMFnXRT5zK561nWkTm+ipq8KfAKnXusgHt7cc=;
        b=Mpz+noZ3wvBd2KraTjSCvswuy6Tw+rr/V2sjRPTh5O51TRghXAqxWmDcIaMTaMk2dc
         FRcvDCt7gfN1lVJhGGsAhLDoJfa5nLB6nHUuu7ASR7arq08zLIO+EFCvlXq5xTZDNvbk
         AqdBFvM+mo6wAh2Wn4eFH/JNO/yy+C83jBf6M4pWVc1LKufOZ0j8IeWzOhf75Kb2Dfp3
         EBeCT6yHCID+MPPnw1HguAB3vb3NWgIvvwi6PbOmxMQagiyWN4UFTpnu+2A92FY7eJDS
         HnS3a2ZkZFrJqGNOniv/Q3CPyJAsp7OVoKPNGu08DObTzvvFtiaBx/gvveOBEmzJeWUD
         YmUA==
X-Gm-Message-State: AO0yUKVC7Ykf0dGfI6lw8OAJjmRnRY65Eb/aTA9AEQadwN7aWiUj2Sa4
        1vDQPhJr88NiFiPh8bSmRacY7w==
X-Google-Smtp-Source: AK7set8QUwLRWNyvL7CfMo590Y3EkQeCNSXSQsySnRd8ihnCh4XTm9IENRFJGz6akokzeufdbwIHKQ==
X-Received: by 2002:a17:906:198f:b0:879:43d5:3832 with SMTP id g15-20020a170906198f00b0087943d53832mr17073880ejd.14.1676249747702;
        Sun, 12 Feb 2023 16:55:47 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f20-20020a170906c09400b00872c0bccab2sm6003864ejz.35.2023.02.12.16.55.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Feb 2023 16:55:47 -0800 (PST)
Message-ID: <bba9e244-0a02-4d46-8ba8-bc8b11ddf6b4@linaro.org>
Date:   Mon, 13 Feb 2023 02:55:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] remoteproc: qcom: fix sparse warnings
Content-Language: en-GB
To:     Mukesh Ojha <quic_mojha@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, mathieu.poirier@linaro.org,
        konrad.dybcio@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1675180866-16695-1-git-send-email-quic_mojha@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1675180866-16695-1-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 31/01/2023 18:01, Mukesh Ojha wrote:
> This patch try to address below sparse warnings.
> 
> drivers/remoteproc/qcom_common.c:126:27: warning: restricted __le32 degrades to integer
> drivers/remoteproc/qcom_common.c:133:32: warning: cast to restricted __le32
> drivers/remoteproc/qcom_common.c:133:32: warning: cast from restricted __le64
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Also see below.

> ---
>   drivers/remoteproc/qcom_common.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index 020349f..7133c1f 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -123,14 +123,14 @@ static int qcom_add_minidump_segments(struct rproc *rproc, struct minidump_subsy
>   
>   	for (i = 0; i < seg_cnt; i++) {
>   		memcpy_fromio(&region, ptr + i, sizeof(region));
> -		if (region.valid == MD_REGION_VALID) {
> +		if (le32_to_cpu(region.valid) == MD_REGION_VALID) {
>   			name = kstrdup(region.name, GFP_KERNEL);

While you are at it, please replace this kstrdup() with kstrndup(). 
There is no guarantee that region.name will be 0-terminated.

>   			if (!name) {
>   				iounmap(ptr);
>   				return -ENOMEM;
>   			}
>   			da = le64_to_cpu(region.address);
> -			size = le32_to_cpu(region.size);
> +			size = le64_to_cpu(region.size);
>   			rproc_coredump_add_custom_segment(rproc, da, size, NULL, name);
>   		}
>   	}

-- 
With best wishes
Dmitry

