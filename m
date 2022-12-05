Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF3E8C4321E
	for <linux-remoteproc@archiver.kernel.org>; Mon,  5 Dec 2022 08:21:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232036AbiLEIVj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 5 Dec 2022 03:21:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232021AbiLEIVd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 5 Dec 2022 03:21:33 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCCFA165A4
        for <linux-remoteproc@vger.kernel.org>; Mon,  5 Dec 2022 00:21:30 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id j5-20020a05600c410500b003cfa9c0ea76so9336376wmi.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Dec 2022 00:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K2llCY+S9xP0hToJ39zAtXBAJ+E1kB9/4btQ1z2p/Q4=;
        b=aFLyenYtj1VL6wuR/g2gdAe1q5V5TQwJVLAkd1ZKz+sdOfTRzZmUOv5vustsRMOeTs
         4btJibz1hP4yDfNk5Yuk205BwWxNjRKt3v6uYSSzBnz6ysOvxJX3C9w2080TR6f61lQz
         E+7ipKTT3wGEPyO+NwcubahKwKjRLhTFufrXcn0pS7mpeSb4iyY6doeI4QSskynkry/j
         ZWGdctaUwNlJZav+kxHDU6z2rC8kMqOF+MvQLNWNXvQTK9VTuealurfLDruwGQWxeaIR
         pUcSSSf5ml6N2TeO98U6nSgxk3kpkAC38P5w2mdV3LwGJpktpuvCTCQThXTWwrazsdjy
         HYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2llCY+S9xP0hToJ39zAtXBAJ+E1kB9/4btQ1z2p/Q4=;
        b=t8Ofx1KlZicanq6sbRW8yA/tFYFagMECLz3v0UtLeqCpbMxUd6cJITllQwdoGQQDu6
         27UptjIxDFVL4EpJtQyXiIyqXHFPmWoW2e/wOhA4rrnrbaOYYeKfNsz2QqX4dg3vi2Y2
         tojIRsexM/VYY2S8itdroOTfwuZU5oUaJGwjT3rxQoiDgt0HrdMvlUP7/lR7X4yjVivZ
         Cw408CaY2C3PX4XXKQoeQ2houA+I2y4sP5YT0e46txRHAeqF21DCdOQikU+AOh+LlVHy
         aQZvQQAjMBkmgadjizyNXncco0f7XmJT2uoUuDMDmhSzthOCrBVwrP1XTVa97M01tLad
         fEhA==
X-Gm-Message-State: ANoB5pkP/3z8CSEcPEABoYTJDz3UOE2tnnChTCpM57urIp9wOB6AaPDe
        PefLjz31L/oPDPsEMpP3cuEsXw==
X-Google-Smtp-Source: AA0mqf5WiuFbN9XlmBzCmsv4CfQxfb0C1sECJ1I5kEKyWuh6lTY6TqTzlCPoveUNn59ONI7Ib2WCKQ==
X-Received: by 2002:a05:600c:4f55:b0:3cf:729b:d4b4 with SMTP id m21-20020a05600c4f5500b003cf729bd4b4mr53799723wmq.48.1670228489132;
        Mon, 05 Dec 2022 00:21:29 -0800 (PST)
Received: from [192.168.7.93] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id k26-20020a05600c1c9a00b003b47b80cec3sm22816447wms.42.2022.12.05.00.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 00:21:28 -0800 (PST)
Message-ID: <71a1619d-717d-b251-a03b-083d26c35375@linaro.org>
Date:   Mon, 5 Dec 2022 09:21:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: fix refcount leak in
 adsp_alloc_memory_region()
Content-Language: en-US
To:     Wang Yufen <wangyufen@huawei.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        mathieu.poirier@linaro.org, lgirdwood@gmail.com, broonie@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <1670203687-42016-1-git-send-email-wangyufen@huawei.com>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <1670203687-42016-1-git-send-email-wangyufen@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 05/12/2022 02:28, Wang Yufen wrote:
> The node returned by of_parse_phandle() with refcount incremented,
> of_node_put() needs be called when finish using it. So add it in the
> end of of_address_to_resource().
> 
> Fixes: 9e004f97161d ("remoteproc: qcom: Rename Hexagon v5 PAS driver")
> Signed-off-by: Wang Yufen <wangyufen@huawei.com>
> ---
>   drivers/remoteproc/qcom_q6v5_pas.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 6afd094..24439a6 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -449,6 +449,7 @@ static int adsp_alloc_memory_region(struct qcom_adsp *adsp)
>   	}
>   
>   	ret = of_address_to_resource(node, 0, &r);
> +	of_node_put(node);
>   	if (ret)
>   		return ret;
>   


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
