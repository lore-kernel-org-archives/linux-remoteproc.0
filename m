Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F29C433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 23:13:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC29361207
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 23:13:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238151AbhI0XPe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Sep 2021 19:15:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238137AbhI0XPd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Sep 2021 19:15:33 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 879FFC061765
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 16:13:55 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id h11-20020a4aa74b000000b002a933d156cbso6576448oom.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 16:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bunfPpWd3kzWvXqRScHWkoQzp2nTKJKGN8BnN6cETlw=;
        b=pxSsANALO+B5f4jNUXRjDrMwUHfvi9MOcssWvZ2poDWBGa89NYPXViHiUSlCTuV0kn
         FIDiCZhvWDEGnaYkAZtXv9CpufxN6tjabtKS4vM3WQic22D0a/2O3isAjVZgV7BCBlJS
         OvrqtxXElY5S9x8ckKSSI4czl4Z7C2V/WHBM2JFRrKVTd24jjDIN9QJYudxbjcCuLUky
         fftmw+2JkWlZJ4uCdZsu5ObWnUkGwwTLiyet66rO4RHUidcWEdFjSxZipu9lR8NhDON4
         FAp1ZlHrx/1IusCcVZ1FXNvaaihZAsYKPpmWGr8tqk19+EwQ+rrLEncnvcGRo723TkNh
         l/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bunfPpWd3kzWvXqRScHWkoQzp2nTKJKGN8BnN6cETlw=;
        b=ecGjUQ2g/SHkIQ+zO+8lFkj5YcxOp3MmtJhw+Mfl1oq5IRDRN1pD24MHo72mOzLXb6
         7fGKM10uHabQcR/KKIefSKCDtamTupP0BL3A5ZFA0Qh+QLP6UzUl3u6Qa4C5TB2QmViO
         LxcG8JC15A+HojxCn7nGkcyvWk7X+9L7Sh84RWejO/gaJQHwr338gmc9KD5R4GrequcN
         jsE3zy9K17ErLF+V292w1BAZjS/A5CyZ5jJ4JsBnap1veqK0SCw7F+ga3rsK3HO23xj0
         yXxseD/GYmbmY2gM/cra50yAey7Nsfx7H/cfuckfJWr+dEOxkNzLQZzKvPE5f7NTVPpU
         SObw==
X-Gm-Message-State: AOAM530Di2Nya/Lm3OMqqlKcIpwL0gUkr8XkHkHOcxUFfpq9oosAQvMm
        +zJFTV7c+8dqVxAl97Q7kOEQ2g==
X-Google-Smtp-Source: ABdhPJw/B+aEJ9bidUMgGjg/KIz7YnCivEhHXww4c5fKzblqaaS7U8oyWyaY3lO0XfNU2vcKsCSSAA==
X-Received: by 2002:a4a:ca12:: with SMTP id w18mr2165740ooq.96.1632784434895;
        Mon, 27 Sep 2021 16:13:54 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p21sm4162268oip.28.2021.09.27.16.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 16:13:54 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     robh+dt@kernel.org, mka@chromium.org, will@kernel.org,
        Sibi Sankar <sibis@codeaurora.org>, swboyd@chromium.org,
        saiprakash.ranjan@codeaurora.org
Cc:     evgreen@chromium.org, linux-remoteproc@vger.kernel.org,
        robin.murphy@arm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        agross@kernel.org, joro@8bytes.org, dianders@chromium.org,
        ohad@wizery.com, mathieu.poirier@linaro.org
Subject: Re: (subset) [PATCH v5 01/10] dt-bindings: remoteproc: qcom: pas: Add SC7280 MPSS support
Date:   Mon, 27 Sep 2021 18:13:49 -0500
Message-Id: <163278440375.1524647.1015553568924080250.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1631886935-14691-2-git-send-email-sibis@codeaurora.org>
References: <1631886935-14691-1-git-send-email-sibis@codeaurora.org> <1631886935-14691-2-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 17 Sep 2021 19:25:26 +0530, Sibi Sankar wrote:
> Add MPSS PAS support for SC7280 SoCs.
> 
> 

Applied, thanks!

[01/10] dt-bindings: remoteproc: qcom: pas: Add SC7280 MPSS support
        commit: 6c62a1eb101c040056cfe03c6bfc3c24c6b3a023

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
