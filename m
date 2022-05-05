Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA6A5C433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 May 2022 09:10:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346122AbiEEJOF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 5 May 2022 05:14:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351798AbiEEJOE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 May 2022 05:14:04 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B6496149
        for <linux-remoteproc@vger.kernel.org>; Thu,  5 May 2022 02:10:22 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id i19so7475160eja.11
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 May 2022 02:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=c8YCaE+5K/dsPc+9iPR/du6PTroxvuxyU+b5yayfxT0=;
        b=BR9/PiFUmueB+D/dPuLP5gschdU/Btt/V6TifIiCR9DF9iMhXyAll6y6HgiXExHK5f
         LCVDrMZOR/Kn+bqkWVXn1PHgfgjAbOlqka3Iu1awF0njedHmUvHbvwbnMVW/mnuaJcTN
         zSe0NjynuCAT9rJckKeozN4VOfdarIDSP2C4abZ3zH6fK8QCWzDJH3bFgx23pC0e10yX
         a8nPQqMNzz4Ftzl9gTIDqvSo8tyjX09k6MqEhCJ71sPOqnY3ZuW59KgBVzv6f2V4Vdwp
         VBbQ6bvT6rn4vslTrJSz8so4skmLZe5YuaKHws5ojTgR5418yqOhNzZUMdzZY3Xp84Ir
         LPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=c8YCaE+5K/dsPc+9iPR/du6PTroxvuxyU+b5yayfxT0=;
        b=U4NxpVn6TAAO3d9w137xtBwdatHANv25YODwoFsruIo+aR4f0N3Ut+dlFrHMsdOmYu
         v5Cu8+6DdlOPMBNbeKln0U6Gl6bEUekG5wUz5kT5c48pRnETZf+yVvHZfhSmBqpSVXhv
         tR/+9TrslmzTRcWlWt0/mRsSRyyXjlsNnnKwt3Ya5C/nxr7f3gEIzb1vZp+UVNUS8LgY
         bKFOZTzkGir5tqyfMV35rZkykR++wZ4tC+Wo8HEvWA6cj8ohc2wtbZLZRDMORsWwLmCm
         M/bDBRr4ynAe48yxbPMjBo3fTflN82PAFz+3ApSNCtVhhrDjL8l3LSwcmE6ern60ZqnY
         DBXw==
X-Gm-Message-State: AOAM5327CnMtpqXlacLCxulxH7Nojf/+5M9rMR4GPs7YBw5TdqFjV2JT
        HpVjbsyeiRCF360Vp/NFpk7Baw==
X-Google-Smtp-Source: ABdhPJz7tsXlNRMPlAktkJhnba7TvMyZHIV5xs8SGanC49KbwY/dkQKKC6fYnLD9+ao8S0FbRuugvg==
X-Received: by 2002:a17:907:1c24:b0:6f4:ff62:a393 with SMTP id nc36-20020a1709071c2400b006f4ff62a393mr643548ejc.154.1651741820790;
        Thu, 05 May 2022 02:10:20 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id el22-20020a170907285600b006f3ef214e1dsm511229ejc.131.2022.05.05.02.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 May 2022 02:10:20 -0700 (PDT)
Message-ID: <e0af5143-7fe1-fa68-25c0-eb81d695844a@linaro.org>
Date:   Thu, 5 May 2022 11:10:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] dt-bindings: remoteproc: Fix phandle-array parameters
 description
Content-Language: en-US
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220504094143.1272200-1-arnaud.pouliquen@foss.st.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220504094143.1272200-1-arnaud.pouliquen@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 04/05/2022 11:41, Arnaud Pouliquen wrote:
> Replace the FIXME by appropriate description.
> 
> Fixes: 39bd2b6a3783 ("dt-bindings: Improve phandle-array schemas")
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  .../bindings/remoteproc/st,stm32-rproc.yaml      | 16 ++++++++--------

Please add "st,stm32-rproc" as last prefix in the subject. With that:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
