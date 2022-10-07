Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77652C433FE
	for <linux-remoteproc@archiver.kernel.org>; Fri,  7 Oct 2022 12:26:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbiJGM0X (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 7 Oct 2022 08:26:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiJGM0W (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 7 Oct 2022 08:26:22 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F1ADA98F7
        for <linux-remoteproc@vger.kernel.org>; Fri,  7 Oct 2022 05:26:19 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id d24so1293820ljl.9
        for <linux-remoteproc@vger.kernel.org>; Fri, 07 Oct 2022 05:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eWK8ltIDIkui3ySL4w1wqLeglJS7qqPhWaK+ZxDPlzo=;
        b=qjO6OVdvJhlNxmB4052GCBtnuDlboPeXq/lQh0poEN4u2jzhUCvBxwB2aHDi9EtOC6
         kQ7ezfUfR6PFkr0UclfQHe2t4aewrU3j5aJ23eQqS+eUYSozKSUpobiuY1i8E1t7oIoq
         vXMGSYaqgDLp6mpSIAGhOLrd5/QPn9zFAtVmk0msv7MRb7s9tr10M1wHcL9EAkYOhJ0h
         4OBftQd9Swivypx/g5x39pAIv+q86cuvphmEpyqbaEzRdXIj8FMl527fbUycm6YEmPZw
         enGBpl+wWPco63TPZZ4Wb8zjJmU1C1qC+gC16+VeeCLxuvFAKH2Lkr7F2LPHUrRO6SBw
         QuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eWK8ltIDIkui3ySL4w1wqLeglJS7qqPhWaK+ZxDPlzo=;
        b=WVjfzk91JtlBQMKRiDOUmhr0YC17Rcpx5BwO1wwh/T8D2z1iUb+uXEaFrRX/8Exypu
         XYThzRzQFrWMxrDjUo0nN13JaOg+/ZcpC8K1J94d/yr7oZK+hOXVBGVMO8wHACDhUMMD
         xxr5OQGvLFZL70THGmeYb9dHZDZlQ8NYAjPp+MJBPUSZ3A12MwcfwCqIbqhoCVvDA07o
         zv7MZvgAmQVx87gH0gn2M0iwOe5yw2WZhPLpl2p8pD4sGPbDNg1GQYJDQdFAGPdxVE1z
         mHTzRjMO88rIUx1QgBSGyqVAkwussD8ZsG4L3mCjLF9RS/7KLfl2At7ul1VudJW3g58g
         LtTg==
X-Gm-Message-State: ACrzQf24MtK1gdcE/blWXTxeuZskABumOvr+tnw0u6ttJrt9VAhnisik
        FRjXA9uDAlgnxpMIp3HLxzhGhQ==
X-Google-Smtp-Source: AMsMyM65SjzOOQvBru/Gza0vh62MUFmFnt85NMWgCQ4hRnraNaKmsKCR4xfdOiOArggIC/dMZzNtmg==
X-Received: by 2002:a2e:9d88:0:b0:26a:95c1:218f with SMTP id c8-20020a2e9d88000000b0026a95c1218fmr1558690ljj.223.1665145577901;
        Fri, 07 Oct 2022 05:26:17 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s22-20020a056512203600b00498f3ebffb2sm286031lfs.25.2022.10.07.05.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Oct 2022 05:26:17 -0700 (PDT)
Message-ID: <10f629f9-733b-3b8e-4e80-af16920b3615@linaro.org>
Date:   Fri, 7 Oct 2022 14:26:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 5.10 1/1] Backport of rpmsg: qcom: glink: replace
 strncpy() with strscpy_pad()
To:     Andrew Chernyakov <acherniakov@astralinux.ru>,
        stable@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <20221007104120.75208-1-acherniakov@astralinux.ru>
 <20221007104120.75208-2-acherniakov@astralinux.ru>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221007104120.75208-2-acherniakov@astralinux.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 07/10/2022 12:41, Andrew Chernyakov wrote:
> The use of strncpy() is considered deprecated for NULL-terminated
> strings[1]. Replace strncpy() with strscpy_pad(), to keep existing
> pad-behavior of strncpy, strncpy was found on line 1424 of
> /drivers/rpmsg/qcom_glink_native.c.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Andrew Chernyakov <acherniakov@astralinux.ru>

This is not a correct backport. You lost entire information about
original patch and its history. You even dropped my authorship. The
certificate of origin chain is broken and not correct.

You must follow the process of backporting of patches:

https://elixir.bootlin.com/linux/v5.19.14/source/Documentation/process/submitting-patches.rst

Best regards,
Krzysztof

