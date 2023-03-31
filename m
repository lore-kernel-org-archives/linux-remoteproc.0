Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09FF4C77B60
	for <linux-remoteproc@archiver.kernel.org>; Fri, 31 Mar 2023 20:17:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbjCaURa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 31 Mar 2023 16:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232153AbjCaUR2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 31 Mar 2023 16:17:28 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEFD72220E
        for <linux-remoteproc@vger.kernel.org>; Fri, 31 Mar 2023 13:17:26 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id h25so30412139lfv.6
        for <linux-remoteproc@vger.kernel.org>; Fri, 31 Mar 2023 13:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680293845;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PCmSmcqOfsVfl2tCC9qQBF7W/rjcBMfD/MOmc9ZECng=;
        b=FEiZSZ2LMcZKJU2i8m5CNciGjOyJb4arZgojJLsdnH9X51Wu0xd9kykG7TVQeTWVt7
         EGdy0HMjLrf41HKCU5RkhArcpTo0OK/eIsYj0NSAXifw3hQ0JBi+IHUZF0TIGjEaJAUT
         REgb/Q4U4TV9zLTRSz6NiaZ7t5kmVlZAdyBrUHXB1dhGkRkdH0TLcRtvFgoQQy777BNT
         4CxdWjSMdSLdvAIWBDuRSlSKHIDXf0qRtRU0/JQFh2ySp2TJMbQw7KtTXVRP+kDh61si
         BZ+W1D8+PpuK+CQs+kL3EBN9ENntaT69bjpNmGSJe9ORVuSH8YKpdsCMi747ameemdZe
         r9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680293845;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PCmSmcqOfsVfl2tCC9qQBF7W/rjcBMfD/MOmc9ZECng=;
        b=qrpDOrR4l50bwJiBNhRT/zQzx4a3xjX0eaBKHvBXCA6drkwN1K2QxJPd9c4HYghBup
         AsiAw58pdc2tJ+UR9jhELyvmT0L2iilAfn+rjo/Ij+8bk5y2H54jFbCvqi0nzmNWzEQ9
         uw2zbSHTYNwShsDL44acGM25PRD7gNtRYfd2uSdd7Ag/7TGlvMUwUhPqwQTZ6bM4H8bz
         v8j+aHedOTUsEZG7uSycXIXOG+M6kQLj9jU1gguilNCNYIiIQz9QOIey6RvP5Sl6GR4j
         eZAKy2daw2NGbBGZgbaHsFvuar6WxFCk4cwfQZCJdtsYBtTgzlgJxuuR0As+G4CrZ3z+
         F/0g==
X-Gm-Message-State: AAQBX9eAe/SpUpl2u5vYxDtHnEtcddtZdWl34SWQrzse55R3YPg4e0sw
        u6QxnCtM1yxNcVzB4b+QXPJZbg==
X-Google-Smtp-Source: AKy350ZW4tojQvCr/HnE4u4WkpM3V/on97zQF5/1LXrQhTmYXHS1Eyrs70NrN1cP9EiLT2GR3K7Mzg==
X-Received: by 2002:ac2:5b5b:0:b0:4da:ffa0:3f21 with SMTP id i27-20020ac25b5b000000b004daffa03f21mr3033440lfp.14.1680293844910;
        Fri, 31 Mar 2023 13:17:24 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id l28-20020ac24a9c000000b004db508326c0sm506148lfp.90.2023.03.31.13.17.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 13:17:24 -0700 (PDT)
Message-ID: <fccbd0bb-8cd5-b286-c68e-32c094db3cb3@linaro.org>
Date:   Fri, 31 Mar 2023 22:17:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: remoteproc: typo fix
Content-Language: en-US
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        devicetree@vger.kernel.org
References: <20230331155527.3111125-1-arnaud.pouliquen@foss.st.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331155527.3111125-1-arnaud.pouliquen@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 31/03/2023 17:55, Arnaud Pouliquen wrote:
> Fix "communnication" typo error.

Use subject prefixes matching the subsystem/device (which you can get
for example with `git log --oneline -- DIRECTORY_OR_FILE` on the
directory your patch is touching).

> 
> Fixes: aca8f94e5b69 ("dt-bindings: remoteproc: stm32-rproc: add new mailbox channel for detach")
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

No line breaks between tags.

With missing device prefix and dropping line break:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

