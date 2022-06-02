Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42532C43334
	for <linux-remoteproc@archiver.kernel.org>; Thu,  2 Jun 2022 12:02:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234753AbiFBMCu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 2 Jun 2022 08:02:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234756AbiFBMCr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 2 Jun 2022 08:02:47 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CBD7F48
        for <linux-remoteproc@vger.kernel.org>; Thu,  2 Jun 2022 05:02:43 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id x62so5963166ede.10
        for <linux-remoteproc@vger.kernel.org>; Thu, 02 Jun 2022 05:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=U+8T6fn4T3vaS0Pi2aB2h1k72+HYKHqTINehwyE+Qxw=;
        b=WgJo3UOrlWF/xukiH2Ku/H4mdceQ13UjCa+NEb9eL5GFxciQb2m/H0biH39C8/iyoC
         UiorpjyI/JVwc5x53o5eiy8NCi3h6nJmU8Rk9KIT8GaOKNKLmN3LegL1M9r+RA9cnJLX
         0DJtMJfNukuJqKElDBGjAkXwePDty6ctIvt+5JhABmGuOTBy23VV8UeP7SEl2/bHl96G
         qy4eTw7224jmjab9pUBps6c0AQd+dXl3i0VGUN8h/6JgRErzSyA58TmBAsJuVvOzjlZd
         Hxl6dDWlth12mYKgJ/B9bJYwO0pSLB4e1NXvXKd4av+jDkIZf18lh0UHkcX+TqvmV6PI
         dTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=U+8T6fn4T3vaS0Pi2aB2h1k72+HYKHqTINehwyE+Qxw=;
        b=mUb3bK7IAhdDhRBxl9ii7ZOkO0ZdyErC1+k1iQEyyt8MMJV+qzwzJwtGGMp3gcF6ob
         zrWSdAYPTRj7SGvRawl6Xys2b3TeTEUtHXmWAbWG41NigwZZt2DJhM4f0OZ/BDzg77OO
         3r6L5iRoz/m987x3i08BAS6bWasu1urAhZA4XPlCQq5UPdMJtavfXhIrtOf663JutQZA
         AETXBFA+TEO6+pC8q1xg0ezYG1s4D2to3zmHrV9eNl3xQoCuJI1e5npnSNYXlDzIZx+q
         py81vtSmTira9U+V4jH4rrgLxS/nZNlzqSerzDwEH2Mcor4430SGMpx2E0TKdRMLNHjq
         XB4w==
X-Gm-Message-State: AOAM533xurl6QCf0m4fkQ8Ph6bQbLs6AUlUUWOLG3GRRHnkvEmSr3d1d
        fd5Iw+MUxnwxL0Luj2G1EySHtxa7lj4nItFU
X-Google-Smtp-Source: ABdhPJx4oO7YkUav5hDFlqrl3kvMLXszr+upvgPvjdffSEadzOq3Ofn3+ntG6LnID8A7MNz5hB5ENQ==
X-Received: by 2002:a05:6402:1f0e:b0:42d:e38a:51f7 with SMTP id b14-20020a0564021f0e00b0042de38a51f7mr5117059edb.68.1654171361576;
        Thu, 02 Jun 2022 05:02:41 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b8-20020aa7c6c8000000b0042617ba637bsm2480855eds.5.2022.06.02.05.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 05:02:41 -0700 (PDT)
Message-ID: <e084e508-d886-3e6c-53ab-1f0b22706964@linaro.org>
Date:   Thu, 2 Jun 2022 14:02:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 01/15] dt-binding: remoteproc: mediatek: Support
 dual-core SCP
Content-Language: en-US
To:     Tinghan Shen <tinghan.shen@mediatek.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Daisuke Nojiri <dnojiri@chromium.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        "Dustin L. Howett" <dustin@howett.net>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Prashant Malani <pmalani@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Brian Norris <briannorris@chromium.org>
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        chrome-platform@lists.linux.dev,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        weishunc@google.com
References: <20220601112201.15510-1-tinghan.shen@mediatek.com>
 <20220601112201.15510-2-tinghan.shen@mediatek.com>
 <dd3ea397-fa21-abe5-85ad-b8a4818dc011@linaro.org>
 <3c837acfbefa5b7e23e1121678b5b878f08e4ef2.camel@mediatek.com>
 <476baef8-0255-45ed-85f4-2b9d877c4af1@linaro.org>
 <287d88a62fd13cd762b20faa3e9df826632fe1eb.camel@mediatek.com>
 <45c8050e-16d3-80d6-0799-8b067a38d956@linaro.org>
 <5c614dc0947aba6ce2eb0cdc3055a390da723d08.camel@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5c614dc0947aba6ce2eb0cdc3055a390da723d08.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 02/06/2022 13:29, Tinghan Shen wrote:
>> Maybe the hardware property is that one core has its sibling and you
>> provide here that sibling?
> 
> Yes, exactly. I'm sorry for misreading your argument.
> 
> How about this one,
>    
>   Reference to the sibling SCP core. This is required when 
>   dual-core SCP support is enabled.

Yes, sounds good. Thank you.


Best regards,
Krzysztof
