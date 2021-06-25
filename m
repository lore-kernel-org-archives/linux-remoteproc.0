Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B67C3C2B9F4
	for <linux-remoteproc@archiver.kernel.org>; Fri, 25 Jun 2021 21:31:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91FB261879
	for <linux-remoteproc@archiver.kernel.org>; Fri, 25 Jun 2021 21:31:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbhFYVdb (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 25 Jun 2021 17:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhFYVd3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 25 Jun 2021 17:33:29 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A97E6C061766
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jun 2021 14:31:07 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id x16so8427486pfa.13
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jun 2021 14:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CWYLOtSzf07pukGettLZc50AWqNx35k04qNjXA3uUb4=;
        b=i0XNMOQ4uz9CRdX9PQgd4duTYbpQRdBwZWydro5l1CSxhwXKjbM8rAQN7sOKGQ4oEn
         69Ea1kKbbeKN/sLulWYIDJbZPgOcM4CrDJbcAIUqD1AVR2PMQpIk95xy7p4WH9uywCKZ
         fMMINtS3sNFk67sVOjORHGjV6X+v1ecqDcHGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CWYLOtSzf07pukGettLZc50AWqNx35k04qNjXA3uUb4=;
        b=JDdkVC6z67hvritAKeImPEY+titbZmkkx9EoJDU/j0dPbwk/nFvlICiSYLrLW7+1s+
         CVmLfMuylNoWCnLPBtD1XOXn07fI2pRiC4Ubn4e1p/6GtrE/pSWMerR7JK++zS0DHVIw
         cmjAWQOnBIDMPcnPvD8WGrnaeIJxaCO0n5e/4mMKz/bkftZK7QbxaXubhn1fI2i4ljuN
         G14ydem5O6AQ7ppIfsIelO/6R11WC43cxfNcRzwmdSWh2engb9WVEXBno7EvrzlnHSAu
         MEiTxfyeNThOX45e8O6YkT5sUZW1Uo+ZvA+2RItRMPFlh//XXIy/CaViARnjYAUNasvM
         O7Iw==
X-Gm-Message-State: AOAM533W3z4wrZQcTTqSg6WWF0trl3k4kLSlcWUooR1DVpea6oB5VtNa
        ulJlfUC5j/Ua9qJQvQ8PQsRckQ==
X-Google-Smtp-Source: ABdhPJzSvBxJcV+ygLJWWnosjmUXSs4/lr7r94utpED/5DLwIo9VOQtTr5OTKEq2/LLDJ0XHGYZZPQ==
X-Received: by 2002:a05:6a00:26cc:b029:308:a51b:8077 with SMTP id p12-20020a056a0026ccb0290308a51b8077mr8615356pfw.11.1624656667204;
        Fri, 25 Jun 2021 14:31:07 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:cc13:a7dd:f4b5:2160])
        by smtp.gmail.com with UTF8SMTPSA id p4sm6754839pff.148.2021.06.25.14.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 14:31:06 -0700 (PDT)
Date:   Fri, 25 Jun 2021 14:31:05 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        swboyd@chromium.org, ulf.hansson@linaro.org, rjw@rjwysocki.net,
        agross@kernel.org, ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v3 01/13] dt-bindings: soc: qcom: aoss: Drop power-domain
 bindings
Message-ID: <YNZLGf1uqSqQ8zR8@google.com>
References: <1624560727-6870-1-git-send-email-sibis@codeaurora.org>
 <1624560727-6870-2-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1624560727-6870-2-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jun 25, 2021 at 12:21:55AM +0530, Sibi Sankar wrote:
> The power-domains exposed by AOSS QMP node are used to notify the Always
> on Subsystem (AOSS) that a particular co-processor is up/down. These
> co-processors enter low-power modes independent to that of the application
> processor and their states are expected to remain unaltered across system
> suspend/resume cycles. To achieve this behavior let's drop the power-domain
> bindings and replace them with generic qmp_send interface instead.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Acked-by: Rob Herring <robh@kernel.org>

FWIW:

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
