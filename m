Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF829C433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu,  2 Jun 2022 11:29:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233446AbiFBL3e (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 2 Jun 2022 07:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234224AbiFBL3e (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 2 Jun 2022 07:29:34 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D52702A90C4
        for <linux-remoteproc@vger.kernel.org>; Thu,  2 Jun 2022 04:29:32 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id q1so9350059ejz.9
        for <linux-remoteproc@vger.kernel.org>; Thu, 02 Jun 2022 04:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4UAbEa9va3g/aB6L4sYjHuVME065z0rZ9NEcVci82/g=;
        b=boYJcjxxR1VP9Gm1ei8b9ieE9mbCP5fz5ABFoJm749/FSTtO/BvE8KyNvcH3fFXtgm
         6zUlfT5O5ONjFNwSfHsuajKswREs9qdNpJo1kukIPK4cu5/5WQBMfnYrIxEeP6uCG7VB
         HOf6opFr2/DcwaYoMLDUJ6WXLkGXrxL+WgFm+FBvShG3hW3QXTVj2kVXxhnlA5oNz7MS
         a83DmB3+XQwKuOs1EfUCa1puTAXxTrGbi7pKsxxW5hx+S0sPfgI0z/Qgg7kWwmte7FYO
         5mvah4qGZPHm0xlzFb9DrNM2WdixjkA+vW8D/DsFhfPiAshfBdvHhxdz+hLExhIRNlhp
         9CJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4UAbEa9va3g/aB6L4sYjHuVME065z0rZ9NEcVci82/g=;
        b=Pw45PlxleDQX9H35XQjz8oRUY7yxn1GYIeEXfQpz51rWIgVvXjdzZGtZeVCF5Oqrtc
         HNl66kVHyh4pJZYSGZSeuQ/OoIWn4sW5KRFRosIX1hTNem9YklyOwD4PyJatUK1pjzK0
         jSTv0tVl279lbvjpduSDfjUPjyoCc0CIChZlbaC1juU+d3KxSwdFJRd7WA9mwR7deQ1o
         AM8UzGv9x4xWA5OiemQPg9LWeiiw5AGL1zewDc3SajuQ1POm/O33VElzwhmVnpP6Go3I
         y6dVa7x5fT/kVvO3j0Quan1tAbC5GtXici5PWGH4T11NCQbHhoXm2TbXS8Thq0oIXSsK
         qFng==
X-Gm-Message-State: AOAM533Z0i+MBXjG98Xw/cPQryjHqFFkhY+SQeRbD9Q9hHQILsje1jTm
        91f8AtfR05/EmjKIrIwEESInyg==
X-Google-Smtp-Source: ABdhPJyFk5q64JEFBXNWdBpIbmC60t4bU1CUxNnolUYuhLdYQyHqyRSrf6dYdOsOKhwWHjek2pBvaw==
X-Received: by 2002:a17:907:3c09:b0:70b:442e:7e80 with SMTP id gh9-20020a1709073c0900b0070b442e7e80mr1912653ejc.593.1654169371467;
        Thu, 02 Jun 2022 04:29:31 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id yz17-20020a170906dc5100b0070b1ecdc12bsm465137ejb.112.2022.06.02.04.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 04:29:30 -0700 (PDT)
Message-ID: <8e0ac315-453a-5bba-9c68-cf69dd88c3ce@linaro.org>
Date:   Thu, 2 Jun 2022 13:29:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/3] dt-bindings: remoteproc: pru: Update bindings for
 K3 AM62x SoCs
Content-Language: en-US
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Suman Anna <s-anna@ti.com>, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220602101920.12504-1-kishon@ti.com>
 <20220602101920.12504-3-kishon@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220602101920.12504-3-kishon@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 02/06/2022 12:19, Kishon Vijay Abraham I wrote:
> Update the PRU remoteproc bindings for the PRU cores on AM62x SoCs.
> 
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
