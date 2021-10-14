Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7AE4C433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Oct 2021 14:53:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9230660F4A
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Oct 2021 14:53:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbhJNOzT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 14 Oct 2021 10:55:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbhJNOzR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 Oct 2021 10:55:17 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D5FDC061570;
        Thu, 14 Oct 2021 07:53:12 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id r7so20376729wrc.10;
        Thu, 14 Oct 2021 07:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=d5B5HCqMrztLLrW5kmrymVzCm+NfqoWthUp1VRMYYUU=;
        b=FYAYK+krCgB7G+n7iC8xxBZL9hwQhtskXsUeTLq+SGHCsdiffdkrumJkiCjGCkNt8q
         NobtW9/V9kivu488dgG3anr3hFQXLanVZgjc9ZWPYoAL4ZOckOR6CDDih+2RoPOqWIAP
         uf3jEheouMKJGa0VUgZSUcB4uwyYE44h2ml/ELVJ+2Lm7C2/Q1N0UKX31G01echDTHli
         np45qs1t2yAfZtd90Pq4F/Uu1ZmJbatDCzxYzhnj9dNVyxtzutZahdPspgSJvcZYxiev
         OmkixxM8YATtMgc/Py/IJ4UlCe8vGG1SpG7jrwEQP8EuaO4waH3k7Qf/2SRsp8zJeg3M
         UuRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=d5B5HCqMrztLLrW5kmrymVzCm+NfqoWthUp1VRMYYUU=;
        b=P0ynBzDKPe89Aq/DbJ9/KNueCyAW05TRrv8G/BplkU4QbL823OCUoJhROTFbtr3V8k
         FAHV3lb70hjbf3R1UDt9T3A8LaGilxMYP9yWKmY4skbPOmWsW7t6JsFGTosgGSLsDG/N
         ys3vtafSYzlZiTMlI+028mI4XGW9gXSqmTkVxHi33ZuVZC2ePt6kRZJuRnnsnhPUuTLP
         RQxA64/Dc978E7P2OzO95SVKZ4zzX5s7whC+CA1IrSz0JFceRctRpWmGTZFbCnzc0MSx
         CatOdv4mA1LM813FwxC84yvdwb+j/QDb+QpOcYbB7nPGEmF/77Mr98jXfr3imrkvma5i
         g1sg==
X-Gm-Message-State: AOAM531q/AAGsX0eIqZkrTao5XQsXKHOd8fy9qgEZhPlHzom56azw4Hj
        LYUGN6bigoOn0l4hId+vgm8=
X-Google-Smtp-Source: ABdhPJxwj4QyeoLsfTgposAnSqBMgGEjIEJUCSUuIY5sn6cN9GS9Hiej7sU0HldUQkDYK6Ps0HMdrw==
X-Received: by 2002:a05:6000:1acc:: with SMTP id i12mr7034978wry.249.1634223188314;
        Thu, 14 Oct 2021 07:53:08 -0700 (PDT)
Received: from ?IPV6:2620:113:80c0:8000:c::779? (nat0.nue.suse.com. [2001:67c:2178:4000::1111])
        by smtp.gmail.com with ESMTPSA id o23sm2423900wms.18.2021.10.14.07.53.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 07:53:07 -0700 (PDT)
Message-ID: <47708046-ce93-b879-2d1d-40cff2c3b7ea@gmail.com>
Date:   Thu, 14 Oct 2021 16:53:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v7 6/6] arm64: dts: mt8183: change rpmsg property name
Content-Language: en-US
To:     Tinghan Shen <tinghan.shen@mediatek.com>, ohad@wizery.com,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210924033935.2127-1-tinghan.shen@mediatek.com>
 <20210924033935.2127-7-tinghan.shen@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20210924033935.2127-7-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 24/09/2021 05:39, Tinghan Shen wrote:
> The the rpmsg property name is changed to "mediatek," to sync with the
> vendor name defined in vendor-prefixes.yaml.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---

applied to v5.16-tmp/dts64 which will become v5.16-next/dts64 as soon as 
v5.16-rc1 is published.

Regards,
Matthias

>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index 8e9cf36a9a41..bc4bbcf457ee 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -754,7 +754,7 @@
>   
>   	cros_ec {
>   		compatible = "google,cros-ec-rpmsg";
> -		mtk,rpmsg-name = "cros-ec-rpmsg";
> +		mediatek,rpmsg-name = "cros-ec-rpmsg";
>   	};
>   };
>   
> 
