Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B25DC77B73
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 May 2023 07:43:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233505AbjEHHn6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 May 2023 03:43:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233513AbjEHHnx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 May 2023 03:43:53 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D5A1AED1
        for <linux-remoteproc@vger.kernel.org>; Mon,  8 May 2023 00:43:50 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f24ceae142so1204359e87.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 08 May 2023 00:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683531828; x=1686123828;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QNaFk0YjvO7TRfJNxOucV+ZH8CyDCw1zB9t23isYXAs=;
        b=Y2RnZfMBAAOTBIF+i1vW827QhgGtSW61gqN/YE6ATZVHd7j6AW3iXmXXI6tBsxzppy
         O9lzoasA3ugwdq12Joyr/tP38Nv6/kCl3wUs6hujtCGbAxOTMIqDGG0wmoXvBP74qaXp
         sIOEmrZj/sovC7p2MHIWsqBialj9TUfe66tn8iFSBgIc5xs1VEcNC2mN751OzkDphQx4
         hT9IcDtUj6w6OcJedyd6iO0aQxcPXknAVXgrVeTblCJGwSiw+aJIm0gzpTRapQxVqaZX
         kcEegag7PITURZI+43sDbv9inv5UZ/oj14VW3Wl0R3CJrEJnmlag5bfK0f4dMUYSqGCh
         s3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683531828; x=1686123828;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QNaFk0YjvO7TRfJNxOucV+ZH8CyDCw1zB9t23isYXAs=;
        b=lnDZPrRdJE23v9zaxz5wKwKz2cRpkBoKzIeEbBk2uXey3MxeFV0MZTVWHn3bww6pph
         Sd3NxpLs39u0iKIJURhC+YdTEqRohDvKvzemg/4dpnBKK9zUCAL+JkvucxdQSUEA0VjP
         75x48/VIxrAdAxZSpqa0ItN3sy8ok4ZMab8e9u2NNI/2Ri26eYtZfaKyZIEPt4OHW88k
         L/a7XDDudrf1nc3wlhQ/eq3NdJfo5rGLzP7J7Dmkj0s8J+EvztWnUJnQ6y59O/XFImlJ
         5AfvqsKV4yNU9IORQ8WOgi/MBqkom34IRckRuRalwxjoxgUrMTixOD27SQqNPnu1YbEP
         3NCQ==
X-Gm-Message-State: AC+VfDyeqE3R4sXoJ4VAV4kCn5qiKWRx4/QrjfGpK40VXFIeLT86Jf0W
        89xNYYHapZ54hDjLYkLpHB4xZg==
X-Google-Smtp-Source: ACHHUZ7RJTTjmelXl1Pn4ggo/k7dmWMYv84qNJNFyqRl0wi0d5xR1z+wFJQn1lavTRP/SNFxt99ufw==
X-Received: by 2002:a19:5213:0:b0:4f2:4ddf:b06e with SMTP id m19-20020a195213000000b004f24ddfb06emr687514lfb.63.1683531828761;
        Mon, 08 May 2023 00:43:48 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id q18-20020a2e9692000000b002ac7a25c001sm1090776lji.24.2023.05.08.00.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 00:43:48 -0700 (PDT)
Message-ID: <4dd89422-f40a-b772-2b9c-f6442b01d2b0@linaro.org>
Date:   Mon, 8 May 2023 09:43:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: staticize adsp_segment_dump()
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230507144826.193067-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230507144826.193067-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 7.05.2023 16:48, Krzysztof Kozlowski wrote:
> adsp_segment_dump() is not used outside of this unit, so add missing
> static to fix:
> 
>   drivers/remoteproc/qcom_q6v5_pas.c:108:6: warning: no previous prototype for ‘adsp_segment_dump’ [-Wmissing-prototypes]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

(should we add a fixes tag for this one? I'm unsure but wouldn't mind
either way)

Konrad
>  drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index e34d82b18a67..f77d11c91a75 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -105,7 +105,7 @@ struct qcom_adsp {
>  	struct qcom_scm_pas_metadata dtb_pas_metadata;
>  };
>  
> -void adsp_segment_dump(struct rproc *rproc, struct rproc_dump_segment *segment,
> +static void adsp_segment_dump(struct rproc *rproc, struct rproc_dump_segment *segment,
>  		       void *dest, size_t offset, size_t size)
>  {
>  	struct qcom_adsp *adsp = rproc->priv;
