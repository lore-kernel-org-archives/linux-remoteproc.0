Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A34C43334
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jul 2022 22:59:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236132AbiGRW7a (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 Jul 2022 18:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236295AbiGRW7Y (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Jul 2022 18:59:24 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B51782AE13
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Jul 2022 15:59:23 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id r22-20020a056830419600b0061c6edc5dcfso10437149otu.12
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Jul 2022 15:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4kHud9mlsoAsSPgQFpekRiycMvMxnpzh8md2ULHRH8M=;
        b=UoduGzpJcG+vgnNJXPprCMScMu3l2jZnTBwG0iq8IbcBEIea2YU6fpLPi/8MLwxf9P
         ESjapwV36k/9ZVu0E9DFYUIIrywdE4t4IE6SP9nZZ3xbCKApAIOe9hgitBR7OkJg3Wik
         BBUgZ6Q00ew6MdG4y+L3iERKx+YnNABaDvfXfDV2S1jtn2ZLaoF9ROsEp8wQ7IqDrQNn
         c/Y1jwrj9QSdkhCyL2c8m2eiemm7ptCDvDxg6GMwfXzeyMYhZkDZbaBmq5D1GgO41iY8
         OSeuAZVzSvZwFp6rcLHtYNfD1qtyCY75gyVKnXuA+pxrzaZ5HlXRrXqQB0yVTi3poTiO
         au+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4kHud9mlsoAsSPgQFpekRiycMvMxnpzh8md2ULHRH8M=;
        b=TNI31RotRnbZ+R3JBZdZAWdFXqLbFooYxfCKFwzvOH9QXxxxxBIc8uKtrwmETzfmF3
         TbcBzVV+N9Y29dy32Re7OAoYkee5O++cjtVwJeI7mu6TxVPfETyCJapnRabzhQn/dVp0
         6ZwKZ+F8w9BEsTLduhkqnMeppU34pnS7Ni6dPmSWMsrmpGya5UXbPjpU+9kw5FlzFFYK
         omFRYSUrycvtqgqFEPTGo+wsCAcxk7tZniLb2d8dDaxRJT1AXEPkutHzQ6TKgNx0XUVB
         vy5gNFb6zJ9ea3tQM8NysfaRc3eoRaftW1aVBZu9nixm8U0VfEFbMoWjp9yeeyfqI13w
         mFaQ==
X-Gm-Message-State: AJIora/42rIVBmKj1BM3d5mDNVX039ttnZ6ZrAvlD95dwodZlLmXyJON
        4pPXG8xoyJjDwPU6Cn0LiKIyGw==
X-Google-Smtp-Source: AGRyM1uFakFvCDT6jvma3XJcksWxbV5RTSCBSXFya7UHglFCPT1qwouMYZ7iXGz927NSgeZhMkx70g==
X-Received: by 2002:a05:6830:33c3:b0:61c:6576:667a with SMTP id q3-20020a05683033c300b0061c6576667amr12131221ott.375.1658185163443;
        Mon, 18 Jul 2022 15:59:23 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j10-20020a4a908a000000b0041ba304546csm5330931oog.1.2022.07.18.15.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 15:59:22 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        agross@kernel.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     sboyd@kernel.org
Subject: Re: (subset) [PATCH v2] remoteproc: qcom: correct kerneldoc
Date:   Mon, 18 Jul 2022 17:59:08 -0500
Message-Id: <165817634386.1905814.13877230220169061028.b4-ty@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220519073349.7270-1-krzysztof.kozlowski@linaro.org>
References: <20220519073349.7270-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 19 May 2022 09:33:49 +0200, Krzysztof Kozlowski wrote:
> Correct kerneldoc warnings like:
> 
>   drivers/remoteproc/qcom_common.c:68:
>     warning: expecting prototype for struct minidump_subsystem_toc. Prototype was for struct minidump_subsystem instead
> 
> 

Applied, thanks!

[1/1] remoteproc: qcom: correct kerneldoc
      commit: d5f8c4c66a368e21a105c42042803526cd3ccc15

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
