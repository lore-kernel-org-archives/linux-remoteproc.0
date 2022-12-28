Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C418C4332F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 28 Dec 2022 07:11:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbiL1HLK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 28 Dec 2022 02:11:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbiL1HLK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 28 Dec 2022 02:11:10 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65531E59
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Dec 2022 23:11:08 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id y8so14152893wrl.13
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Dec 2022 23:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BoevkCqm0C5XWODDQxiTKlCd9+LFUjRXCitTr69DptE=;
        b=uquiVL9NoYOszkI6bFc7kKQ24G0gAWYpSyGFNLCpco3sci1FSm+lJmoz9FHastz+7W
         U7kNSmACNWFQfonyKWbOpBg3Tfy7gkWkPTsSwzb1fpgPujs01WTbcl5S/0dkPz+xVYkb
         9CG+UoORXOA9XBJLngiNVW1EOh9PdQoh7Y6KJ1xz83uDoTSkFF3fW/T5yEIr6w94vLg5
         B3O6pAlokeHugK/VYHd+1c0vNzRyUn9dv4x6oq4xT6sx7Z6O7eecFAPZ1kTWxtrhdAHg
         BPbDQEP8vMH86Z9BtSOySt/qyvLIT+ybMSKwepuzQnqfkvjuDOMp59YQkW/au/AAHqO4
         7a/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BoevkCqm0C5XWODDQxiTKlCd9+LFUjRXCitTr69DptE=;
        b=1Pa1LkoXgp80dKB61ikbF/YWN56WBzwChIB1y7gjCgVKqfTDLuWvT+2M1mkzDansyB
         VSWPUxy2ATFsry41t8tPWWXwdmGI7E4ebl2rzcVC1Ucx/hnUlVOW6ihRpZWIwOfI1HW7
         VHWQfmiNFghvdSUV08HtT7rZDSVoo6u1TbunrpGHOkX3fGsV9eb8EfAXDL6a8UoUK2a7
         iHPNPTbc2rJjOmnglTysV/nHeruyiQcejpJDyaQl+mEd8CfOi5ERXUieaQwJDI7KimQc
         bo85DOb4BQnaLvOZLNM0iJ78NaX31lrviUPBEDQbPcxz9Z43WWqmPZxxCcobRBfTaGfK
         +QDQ==
X-Gm-Message-State: AFqh2kosQMmcH+1gaDR6Bnim2tm5uLd2z1eX3rHwEL0XG2LhiBNiUcUq
        2VdPIud+F9+Rwj1aEdBOsx7PEQ==
X-Google-Smtp-Source: AMrXdXvbxe80HMxQjahLobDGkaTAMYMLKpxTJYeUbPE4yE/3SpjMedOXnc0L41IobhefT19PF0eBjg==
X-Received: by 2002:adf:d4c7:0:b0:25d:6628:debc with SMTP id w7-20020adfd4c7000000b0025d6628debcmr15680346wrk.10.1672211466922;
        Tue, 27 Dec 2022 23:11:06 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id d12-20020a5d4f8c000000b002421a8f4fa6sm14107330wru.92.2022.12.27.23.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 23:11:06 -0800 (PST)
Message-ID: <0acebf30-59a1-c336-1a44-19a74b4f244f@linaro.org>
Date:   Wed, 28 Dec 2022 08:11:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2] remoteproc: virtio: Fix warning on bindings by
 removing the of_match_table
Content-Language: en-US
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20221005081317.3411684-1-arnaud.pouliquen@foss.st.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221005081317.3411684-1-arnaud.pouliquen@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 5/10/22 10:13, Arnaud Pouliquen wrote:
> The checkpatch tool complains that "virtio,rproc" is not documented.
> But it is not possible to probe the device "rproc-virtio" by declaring
> it in the device tree. So documenting it in the bindings does not make
> sense.

Perhaps reworded a bit as:

   "Since it is not possible to probe the device "rproc-virtio" by
   declaring it in the device tree, documenting it in the bindings
   does not make sense."

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> This commit solves the checkpatch warning by suppressing the useless
> of_match_table.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Fixes: 1d7b61c06dc3 ("remoteproc: virtio: Create platform device for the remoteproc_virtio")
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> ---
> Updates vs previous revision:
> - replace the "of_platform.h" include by "platform_device.h",
> - replace "Fix-suggested-by" by "Suggested-by",
> - add Rob's Reviewed-by.
> ---
>   drivers/remoteproc/remoteproc_virtio.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)

