Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86286C71153
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Sep 2023 07:50:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345177AbjIDHup (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 4 Sep 2023 03:50:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236869AbjIDHup (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Sep 2023 03:50:45 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3316BD
        for <linux-remoteproc@vger.kernel.org>; Mon,  4 Sep 2023 00:50:41 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99c93638322so241788266b.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 Sep 2023 00:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693813840; x=1694418640; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7rwo1JQ07wN9AZgkdq/ZN73aYRmpPxX5x4XvDTXJBqg=;
        b=lYUepP5XD7GGYxipiVNlbz7XRpnQFNjTWMbqIz5HEYI5O0b+qZKBJEn871ZDFXSY/F
         g78u6DwCDDfYAhlPNo/2DabdOCCKsBMICunUIEzm1Gd0d5XoYZoCNgC2eGgikzoaJzDk
         eUJiwSNYNhSMr8StDMr6DphKFk9/UhWIh+zwT2uYKNALcGbvuzoz/iI0yFvBwKhOW4/k
         8ohMwsEzoA+55+43ZurD+5Tlm1R71IHbgbdfDREKszBWXjJO9BwJu9+XdVDBRaY4ZB1V
         lzs6SDYr85oumHsnMhBrXgH1rHwmVIgoB9ZOvjtrh6FM//eU4oHz/qZZ5Nc0ntbp68O1
         EmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693813840; x=1694418640;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7rwo1JQ07wN9AZgkdq/ZN73aYRmpPxX5x4XvDTXJBqg=;
        b=VSAFgIWAOVmWeN1X95TeboUmr4kTcqrXm3zBjn5s+REZhg3L9udsfrb4/qnL+r6sqO
         TeegrDygMBHBQ1M3eh+YwiYVfhVLWomyc+QsX+nsqtVnqeOKJdHUNrG7J8mBa1z4C4uJ
         CbZD37bfiK7lIODGgB9pkvNCCufF3SottRcjRIJ2t+5VcW2PCf9dzVRam1z4UIUtWp2+
         Er/t6CJle1bJ1HTGNqZgT0VgPqyVhzCzCoHwD88tSJMg4TEzSpIic1K+fDLIC9sIvmti
         VglVKg003PRK3I4s+Mh6H6MXvheFdsciOd5mEoNfjCLFhUecKEN0Wh8/A5TbGupRthQT
         cMfw==
X-Gm-Message-State: AOJu0YyS/nWWG8flWVYkvqmA42q8ZP4DJRHrb9z/5uyzHrmUlxuzbdi3
        CLQADGuqFhVUAiADzzjmqZDyyg==
X-Google-Smtp-Source: AGHT+IEMqpCQ0XocZ/dxGoFxB/NYSHOnxzelUaffF8qI5OwbjunnTJ/liyc30D7juKnqGjdDfxzxpQ==
X-Received: by 2002:a17:907:7b9e:b0:9a1:d29c:fb6b with SMTP id ne30-20020a1709077b9e00b009a1d29cfb6bmr13395072ejc.25.1693813840320;
        Mon, 04 Sep 2023 00:50:40 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.209.227])
        by smtp.gmail.com with ESMTPSA id v20-20020a1709061dd400b00982a352f078sm5750337ejh.124.2023.09.04.00.50.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 00:50:39 -0700 (PDT)
Message-ID: <f6943509-25c5-b4fe-2218-638cc06a4e04@linaro.org>
Date:   Mon, 4 Sep 2023 09:50:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v4 3/3] remoteproc: zynqmp: get TCM from device-tree
Content-Language: en-US
To:     Tanmay Shah <tanmay.shah@amd.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michal Simek <michal.simek@amd.com>
Cc:     Conor Dooley <conor+dt@kernel.org>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
        Ben Levinsky <ben.levinsky@amd.com>
References: <20230829181900.2561194-1-tanmay.shah@amd.com>
 <20230829181900.2561194-4-tanmay.shah@amd.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230829181900.2561194-4-tanmay.shah@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

On 29/8/23 20:19, Tanmay Shah wrote:
> Use new dt bindings to get TCM address and size
> information. Also make sure that driver stays
> compatible with previous device-tree bindings.
> So, if TCM information isn't available in device-tree
> for zynqmp platform, hard-coded address of TCM will
> be used.
> 
> New platforms that are compatible with this
> driver must add TCM support in device-tree as per new
> bindings.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>   drivers/remoteproc/xlnx_r5_remoteproc.c | 279 +++++++++++++++++++-----
>   1 file changed, 221 insertions(+), 58 deletions(-)


>   /**
> @@ -75,11 +79,17 @@ struct mbox_info {
>    * Hardcoded TCM bank values. This will be removed once TCM bindings are
>    * accepted for system-dt specifications and upstreamed in linux kernel

Just curious, for how long this fall back code has to be maintained?
(When/how will we know we can remove it?)

>    */
> -static const struct mem_bank_data zynqmp_tcm_banks[] = {
> -	{0xffe00000UL, 0x10000UL, PD_R5_0_ATCM, "atcm0"}, /* TCM 64KB each */
> -	{0xffe20000UL, 0x10000UL, PD_R5_0_BTCM, "btcm0"},
> -	{0xffe90000UL, 0x10000UL, PD_R5_1_ATCM, "atcm1"},
> -	{0xffeb0000UL, 0x10000UL, PD_R5_1_BTCM, "btcm1"},
> +static const struct mem_bank_data zynqmp_tcm_banks_split[] = {
> +	{0xffe00000, 0x0, 0x10000, PD_R5_0_ATCM, 0, "atcm0"}, /* TCM 64KB each */
> +	{0xffe20000, 0x20000, 0x10000, PD_R5_0_BTCM, 0, "btcm0"},
> +	{0xffe90000, 0x0, 0x10000, PD_R5_1_ATCM, 0, "atcm1"},
> +	{0xffeb0000, 0x20000, 0x10000, PD_R5_1_BTCM, 0, "btcm1"},
> +};

