Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C91FC43334
	for <linux-remoteproc@archiver.kernel.org>; Thu,  7 Jul 2022 07:00:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235145AbiGGHAg (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 7 Jul 2022 03:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbiGGG7n (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 7 Jul 2022 02:59:43 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE74D5FB0
        for <linux-remoteproc@vger.kernel.org>; Wed,  6 Jul 2022 23:59:23 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id z25so11987544lfr.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 06 Jul 2022 23:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=iD4mGg+qM8HG6/1MdfbFXBy3mtObyupuyZ17+Do+v7o=;
        b=ONpy15sjpZhrdm7lyMQyfqEirPUf4QXweXCqJDoF3TmiXGQBcXclsdsNCXlcl8/U+7
         DHpIipWoFQ2JGNOTVXBFjUvRiXX+brHFVQw8VAqi+cqWUBrcnRSHcuuubuR7WylgjEUT
         W06VefkS0KRN8y7Xd5+RYq7YlxaY6rVJFYxsccYJVMzwiREVouKmUB0Vz3SiNdExmagD
         7LpZ1RJHWjIPqKx0E1eONMR9prhM8FrLTy9c7lR9slmEaI6LhQNJIo67MldHHf87cekH
         4rOck3CrGYOAexdyBOYaJspX7yERoJnZxnOurumSYlJtITEDcY6heba9W0bFQOI0Vt3F
         7wcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iD4mGg+qM8HG6/1MdfbFXBy3mtObyupuyZ17+Do+v7o=;
        b=tqk/cYqLDXZFBHK612gawIxG4AvcPENYPxFT+C9NmxsOm8j7Wx6Wchjr/ws65sbL96
         YiSaj1wBHzFXUkzO2G3qr2KBahE/fipcK4kjdh3KgFOdzcM5wv4eGt2H1/jxr6OGu5JQ
         rYVAqEcmjsDb5gu9lnQx+01AfiUkYTl4eV6weu/JIi333neCy9f/9BtSBm4UOzii6lnA
         YcFj/FtWJ07otCCGUzR+a7tPqN7Wa7B8cZphPjd6x9BEB9o05cxIq9DPzwDWrdptB3gQ
         t2afXhiUybbYMEo7dEwRxJB9KJaiOemGYMpr11pLp8wBO0yvvGxSKM+ek1jzdQPhkHPV
         1raA==
X-Gm-Message-State: AJIora8n7LOorh4D0w1ssEdDqt80zj8/yeVRERXdq/LAahwVEEsX61gX
        79zP4MbsfxtdGY4u13jChoU3QA==
X-Google-Smtp-Source: AGRyM1tMrmU5392DvadV6XBmRrqfiY+I0d31ph62y1mTwXDIkZJ91YrBcx12opHaqwcWL7mnx0+fZQ==
X-Received: by 2002:a05:6512:3146:b0:482:e8c8:1a7f with SMTP id s6-20020a056512314600b00482e8c81a7fmr9900182lfi.62.1657177163289;
        Wed, 06 Jul 2022 23:59:23 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id bp23-20020a056512159700b0047f65b60323sm6681329lfb.3.2022.07.06.23.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 23:59:22 -0700 (PDT)
Message-ID: <379291a5-c48d-7d78-fdec-9b67d6b71fd9@linaro.org>
Date:   Thu, 7 Jul 2022 08:59:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] ARM: dts: qcom: add missing smem compatible for
 ipq8064 dtsi
Content-Language: en-US
To:     Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20220707013017.26654-1-ansuelsmth@gmail.com>
 <20220707013017.26654-3-ansuelsmth@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220707013017.26654-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 07/07/2022 03:30, Christian Marangi wrote:
> Add missing smem compatible and hwlocks binding for ipq8064 dtsi
> smem node.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
