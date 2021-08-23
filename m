Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9503C4338F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 23 Aug 2021 20:14:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8FD85613D0
	for <linux-remoteproc@archiver.kernel.org>; Mon, 23 Aug 2021 20:14:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232206AbhHWUO7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 23 Aug 2021 16:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232060AbhHWUO7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 23 Aug 2021 16:14:59 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82B18C06175F
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Aug 2021 13:14:16 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id o16-20020a9d2210000000b0051b1e56c98fso24804278ota.8
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Aug 2021 13:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=TngxpKOqHyiFNvNt+d4zJ7KjMao3ugf0Hy1vQTAHJQA=;
        b=ForlFMkfhRw3yADgfJ9NwDwZ7hfaZlMvpYJHU1pOkK0fdhqBOjKqSpzR6lzRNGaqvR
         E7dSfG3jlD0wy2M8pazICgH/qVcQcs1utgcS8ZgooKoyX+v2Y2Rjj3mn0PCzkDKt9T4j
         v1Kl0BMjLPcMTJhxKqS4yt1m+fJGIFVyK5GXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=TngxpKOqHyiFNvNt+d4zJ7KjMao3ugf0Hy1vQTAHJQA=;
        b=f9lg7Tqm3q8nV3ISOu8VfymMU6MJvbkY6kY15x+u+SKP7Sjyndr2Q44WmS56XhuZja
         CDCWyUpJaSPfdNjUZSaYSZliK2qrVaU56A5U1p8IGucknHG1tP2N4EMXAk7R29LvPoa6
         MeQSygEjooo0PECOuo4bs5fe+77xnBeeKvjbYZpCqdQWRDhNyj/nEc2tyf7A8wr4dN2Z
         t9xyldFlNR6vrempTwQWI3WDM/OBXcAEorvng5U2bxjjs24YgUW0CQ6onakmMaNQ2rOr
         z8gpRxrB9xYollGqcOZ8hWWvKNb2wkKWE97MhE58y0Km+2tCpN3zMn32nUbfMz3SmRdJ
         wITw==
X-Gm-Message-State: AOAM5331Oy5Ufbx4wd/FDU4IWeGIAtTqxPuWs9AKx//T68fzRcgwDkHD
        QUunA2lkzXbcvW5i+voHsbGDNvNciKg63odhGxQfVA==
X-Google-Smtp-Source: ABdhPJzisd6wkOv8VP3EiiFnuLYPOzWwdTHcMUuPi0eL8twDhZeeq5HPrLV4aGCPBkz0C8n7x0246zhO1PfURaXig+c=
X-Received: by 2002:a54:468d:: with SMTP id k13mr236255oic.125.1629749655968;
 Mon, 23 Aug 2021 13:14:15 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Aug 2021 15:14:15 -0500
MIME-Version: 1.0
In-Reply-To: <1629344185-27368-4-git-send-email-sibis@codeaurora.org>
References: <1629344185-27368-1-git-send-email-sibis@codeaurora.org> <1629344185-27368-4-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 23 Aug 2021 15:14:15 -0500
Message-ID: <CAE-0n51ZtuPeK+77YUygOBOj4YAQjq=0CX7bH5udu+8HQw55gA@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] dt-bindings: remoteproc: qcom: Update Q6V5 Modem
 PIL binding
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mka@chromium.org, robh+dt@kernel.org,
        saiprakash.ranjan@codeaurora.org, will@kernel.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Sibi Sankar (2021-08-18 20:36:18)
> Add a new modem compatible string for QTI SC7280 SoCs and introduce the
> "qcom,ext-regs" and "qcom,qaccept-regs" properties needed by the modem
> sub-system running on SC7280 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
