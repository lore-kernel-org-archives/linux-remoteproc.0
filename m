Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC1BC43334
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Jun 2022 17:45:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbiFXRpN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 24 Jun 2022 13:45:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbiFXRpM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 24 Jun 2022 13:45:12 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD8432D1ED
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jun 2022 10:45:10 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id ge10so6133422ejb.7
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jun 2022 10:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vid9EyiKW5fi5NiF/3GzqIJASK/b1lC3A+ghV6jx3bQ=;
        b=KoDlk9NmxHGFOQ9BhPF6ashZ3rQlBt/WKIZsAntoZZ44L6s43bRgxqcsKWC+p0d++h
         Q+fdGXPIY1cyq231FLTWqs80HpRzS5+AGP/V/J2otL9Qag2RZB2vWK8jNpHPP2o1AYal
         04DwtDCXzwYOExAAQ0eu1h0pF4xn+Elj1USW0qCG9BYtO2PhBlXygaqHdDWosDmqsefB
         Tqa9O2EuKquB8dEhLAH63yzwonUW6qRn+xVVK5y26YUmSV/bibOhPFSQH4TFiEIXHSzj
         nIoD7h15FK7RU0O80tx/DHYXq+DInbEvo5GSZRawS+Steoz8Iq3n4TcWygx7hGgPmyxU
         3VTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vid9EyiKW5fi5NiF/3GzqIJASK/b1lC3A+ghV6jx3bQ=;
        b=WcMAluy2Bi0DScd+yLuI6Zep5fYCpaO6bPmr0k1lWBt3ny3tNgKD2o5AnyvwZSvEhy
         DGqJfZf2fKfdInh/6ban4FDi0YbG9m0AuNKqW7TSnzLk2QGMwT/QsC4/aWPsigOZ712Z
         CIFLkOywL5ShqOLYu5qaYQQtXso/2DuCB0HpB7MNNwWbNKTtWv0AiWV3EAHyyHzuEa9d
         5lqpUtQuraM0ZVDr7MSxo+pLkpmrgIBEXHnUbG7W/t6LhWfnAY7PgLbdmkfz9gWLpJ/S
         U7+5sKL5/ZcmbB6IDA21+Zm5jRaYiXLw+7ZXt9K1tGOFz07SmMbIS7+/hy8ZB3fnDJdT
         m+Lg==
X-Gm-Message-State: AJIora/ucE6umuTG17xTlHVocaCwsRrubg3EImjCyRyO54GRaWk3jYli
        BQ0uStTyf1x7kaRh4ddHfom+Pw==
X-Google-Smtp-Source: AGRyM1u4saXcWiEr+oSyJ9/A9r9G/cl/yHKKlvWiO4KgC5/qg78ZCsuaXacEThOxeaGQ0Ux+4fuBdQ==
X-Received: by 2002:a17:906:b294:b0:726:2a95:7e1a with SMTP id q20-20020a170906b29400b007262a957e1amr157372ejz.404.1656092709457;
        Fri, 24 Jun 2022 10:45:09 -0700 (PDT)
Received: from [192.168.0.237] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d16-20020a170906545000b006feb20b5235sm1489562ejp.84.2022.06.24.10.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 10:45:08 -0700 (PDT)
Message-ID: <47db0cd8-c940-6e74-f8dc-8e3931e13d80@linaro.org>
Date:   Fri, 24 Jun 2022 19:45:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] rpmsg: fix possible refcount leak in
 rpmsg_register_device_override()
Content-Language: en-US
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Hangyu Hua <hbh25y@gmail.com>
Cc:     bjorn.andersson@linaro.org, gregkh@linuxfoundation.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220624024120.11576-1-hbh25y@gmail.com>
 <20220624173621.GC1736477@p14s>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220624173621.GC1736477@p14s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 24/06/2022 19:36, Mathieu Poirier wrote:
> On Fri, Jun 24, 2022 at 10:41:20AM +0800, Hangyu Hua wrote:
>> rpmsg_register_device_override need to call put_device to free vch when
>> driver_set_override fails.
>>
>> Fix this by adding a put_device() to the error path.
>>
>> Fixes: bb17d110cbf2 ("rpmsg: Fix calling device_lock() on non-initialized device")
> 
> This is funny... Neither Bjorn nor I have reviewed this patch...

It was a fix for commit in Greg's tree and Greg's pick it up after a
week or something. I am not sure if that's actually funny that Greg has
to pick it up without review :(

Best regards,
Krzysztof
