Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0620FC433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 28 Apr 2022 09:54:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232301AbiD1J5W (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 28 Apr 2022 05:57:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231295AbiD1J4s (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 28 Apr 2022 05:56:48 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDC19419A1
        for <linux-remoteproc@vger.kernel.org>; Thu, 28 Apr 2022 02:46:25 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id kq17so8435144ejb.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 28 Apr 2022 02:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YwqsCXJ7JVb0cDlmO2fSQCEvD2i9SDa2reIL1RD24o4=;
        b=jkPXkgWoDMspMJID8QOz7PTAiGzURkbzX6udqYQhdIklSx0H6ZKLRBzsGAFZjxPo/7
         WoTU++jJ7H7+Bzu42fAWiedTZozqAgLEQpS3GgRyKKXuHKXxlLiE43PRUfvhClEyZvAm
         mG0c4LIWM4ahdEyfPnL1sWzohseB44eOM52ms+GdXTwEEoU7Nd5irdiHSv2MJjkqBEVx
         gTSk9nUDHY2jwjoblA53pfAft1JDc/DbjSBn6EAoFys7W6t4LX7UCqvx+f6bPVOwGwTM
         eZt8BJYJTGteFzlbF9rQYg1ru8zl4PUaiHsehfwTmnHm9F/29+sd0f5uB63hchBc0xAa
         d+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YwqsCXJ7JVb0cDlmO2fSQCEvD2i9SDa2reIL1RD24o4=;
        b=u9AXrm6r3wd/AU+IHAirGmFeJCQkdoKqadyra9goJ5GQYrACDCZD/022puEjUXsJCv
         4LNFNrriq3lrvX9c8g+LvlPuwqNTpbiI0DMUrG5Tj1jJ2FacImcsU2ajmJXdpWNixRKM
         QLYjNcFR3TQdGGM48bstIiM5u6Yq0cY3pXS8znjKJfbSJl7oSsymbcWffmtIyHnsrMGd
         xV+T206X6DgHzP/2FosAu95Mc4mzULyRjMNoF24+tBanNMqPnmz7imG92yBofdYfRvkp
         iViKzSep0li4iqRPlMxOwax/iTRe9ueduTchGyoPdxrm9osdHMnLofujOD6xSYOBa/Ni
         5DCw==
X-Gm-Message-State: AOAM531N/8X2PPkT7/hItPCfbPrtR7b4qI0db04JcBfIdx6zE6DC0o/J
        h6uYsSg14njaR5imgNBN9ISDnA==
X-Google-Smtp-Source: ABdhPJyXeYX5YsaN0AL8rgEW+AjBgzU+kgmQlS6dSdB2e2LZFEj26lU1LZiHxK3Ro443TZ3KLTs6Mw==
X-Received: by 2002:a17:907:7f0b:b0:6f3:5ed1:d296 with SMTP id qf11-20020a1709077f0b00b006f35ed1d296mr28729391ejc.177.1651139183914;
        Thu, 28 Apr 2022 02:46:23 -0700 (PDT)
Received: from [192.168.0.161] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id k13-20020a05640212cd00b0042617ba63d6sm1275971edx.96.2022.04.28.02.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 02:46:23 -0700 (PDT)
Message-ID: <f2f69e12-ce3b-d9e7-0771-362e748d8ae4@linaro.org>
Date:   Thu, 28 Apr 2022 11:46:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] rpmsg: qcom_smd: fix error code if irq_of_parse_and_map()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <YmpgTNlE/niOL8E6@kili>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YmpgTNlE/niOL8E6@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 28/04/2022 11:37, Dan Carpenter wrote:
> The irq_of_parse_and_map() returns zero on failure but we want to return
> a negative error code.
> 
> Fixes: 1a358d350664 ("rpmsg: qcom_smd: Fix irq_of_parse_and_map() return value")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, I already sent a fix for this:
https://lore.kernel.org/all/20220423093932.32136-1-krzysztof.kozlowski@linaro.org/


Best regards,
Krzysztof
