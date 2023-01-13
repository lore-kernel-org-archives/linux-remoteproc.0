Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066DBC54EBE
	for <linux-remoteproc@archiver.kernel.org>; Fri, 13 Jan 2023 07:52:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234352AbjAMHw4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 13 Jan 2023 02:52:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231594AbjAMHwz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 13 Jan 2023 02:52:55 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDE676147A
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Jan 2023 23:52:53 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id mp20so3775680ejc.7
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Jan 2023 23:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hsW10UAQdG3igNdNi26Jys3iRtenHKlkdEyDQRN/BnQ=;
        b=ZebeW9H97F9fWhdeRZ9sF/CDFwFkrKI5aiO6Xr8jew7hqZRK2cZbZnkOw4K3ajQkU7
         XaD22IznntPJOHT8RzYQT/QvTDTPbLSbyfwDx3vD1cqC9NfQO8A/5oh66ndDtMmJRvu0
         C4H9lkD+B9DnNhmdPCONmsab1plYSVHB4DjVLr18T9mUwNAi8u1arHs/a/RQ+t6zN8gQ
         vWM5lQsCRsSEyyoO+6uzEYOTbWPYAZJ1ctfrQxZUcItWf41R33hbeBu1MluQmGBFHdjx
         0ulMHnnTUyoBBJmzOzJg5EXrF6+MjbbK67kqxRGBk7h5TM4YmwhxcfP7FNWxYJnmG8mx
         IZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hsW10UAQdG3igNdNi26Jys3iRtenHKlkdEyDQRN/BnQ=;
        b=ORykjRALcNYS+9zv9hXC6Ipl3bzFH9XPr7uQijtmWodHENlHgfuULBX6sIOMC21lL2
         zAZf4r0ecZhi7fqbYJR2eN6OcaVjkgkU7tAtx07ReilZPKsYmp/yRkwH5DlY7G4QK42L
         BjDaIvJE7BXc5tKjV2aKCYAI1iAcCZFxnEWf+3DvA86yaFC/gNijAx5ADgrM9YKmYN93
         TTJbmeU7N1NzAM4sQmJQxtFRca/Vi5FMYWfSbBI6HrNVMacV2OwLviFIB+JVRVACzPed
         rByrs12efty50CKdNp7m2XvRWIzPehbZAPOAetDUt18HCv998UXiYOJeS0oBJrYigrti
         jWWQ==
X-Gm-Message-State: AFqh2kp2AmhJb5SM8ZLDGKx4Jst01DuvGdOrO+zh9c6OnL957JlhMRm/
        6gFvaKPA1/rSqxQhG6dzSR1OEA==
X-Google-Smtp-Source: AMrXdXvFcFySV/UWF5uK5kT1Z9lr0NMGSrouHFEzaEhWrUju16eu55UjsDfLgGZD9zKT+xwn17ZPCQ==
X-Received: by 2002:a17:906:dfcd:b0:7ff:7876:9c5d with SMTP id jt13-20020a170906dfcd00b007ff78769c5dmr65956916ejc.62.1673596372469;
        Thu, 12 Jan 2023 23:52:52 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g18-20020a1709061c9200b007c1675d2626sm8373407ejh.96.2023.01.12.23.52.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 23:52:52 -0800 (PST)
Message-ID: <6f43e320-b533-e5fb-3886-1b6ccc7f9548@linaro.org>
Date:   Fri, 13 Jan 2023 08:52:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] dt-bindings: sram: Tightly Coupled Memory (TCM) bindings
Content-Language: en-US
To:     Tanmay Shah <tanmay.shah@amd.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20230113073045.4008853-1-tanmay.shah@amd.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113073045.4008853-1-tanmay.shah@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 13/01/2023 08:30, Tanmay Shah wrote:
> This patch introduces bindings for TCM memory address space on AMD-xilinx
> platforms. As of now TCM addresses are hardcoded in xilinx remoteproc
> driver. This bindings will help in defining TCM in device-tree and
> make it's access platform agnostic and data-driven from the driver.
> 

Subject: drop second/last, redundant "bindings". The "dt-bindings"
prefix is already stating that these are bindings.

Where is driver or DTS? Are you now adding a dead binding without users?

Best regards,
Krzysztof

