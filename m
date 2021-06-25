Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53292C48BC2
	for <linux-remoteproc@archiver.kernel.org>; Fri, 25 Jun 2021 17:12:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 341E760FD8
	for <linux-remoteproc@archiver.kernel.org>; Fri, 25 Jun 2021 17:12:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbhFYRPP (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 25 Jun 2021 13:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbhFYRPO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 25 Jun 2021 13:15:14 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25327C061767
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jun 2021 10:12:53 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id u2so5053034plf.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jun 2021 10:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5t9z6ncjTfDboZM5CMH67oHu1/rwNvPtcXLXms6Lyjk=;
        b=ZGd6Jo2iJFy0vt8+khjkWytwPXHyJrdTJ/cc4nRGr+ruQ9YLKnGqe/Lu68TfP57DTq
         JFKJl6VEcevctxq7I1MItVsPVWIc23jk82XYZw8bAP9oFGN4Rn0UEdNbh7qYg+KWNeZY
         3f5SnT4C9NVj30SoJ5yCmIRXZ8+V8Jls7rJZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5t9z6ncjTfDboZM5CMH67oHu1/rwNvPtcXLXms6Lyjk=;
        b=XGkMxzuoLZJkSoX/xPOkIwc+UhXcX8Wsd7+LNe+vcd2GFc7PB9YJPk0pyG1G/UwAL7
         GLXyYeH+XkWpouK56krDdcRUDiiOUKMBulrSemxB3ZSHKL/pRtn3KPFJPpphSqPqNEhQ
         861Hh4hB9QKFy3Mx//B3b3de/VDHPwXcs/ysroYpzvoiCvDk51vUKnN1dtqYCW8Z2Xpw
         oe5uomfkedNHPb6fQ8nXii40t7trFLteFc0nTPKGT+Nfnj6lF2LxMGkyPc178tP+7wTo
         CtUZCjTHN+pK72kG7x5iCIzBl7xdjGHJFSfBPDFuActup9SZFgnBJ9D8W8dJc0hMw3to
         f72A==
X-Gm-Message-State: AOAM532XyMsJEUj2aOhIsqMzhgSf/9ZjhQi9WyTqUDbluAupXVvnGoUV
        rF9k+C9qC11GXPsoBoJKbZJ58g==
X-Google-Smtp-Source: ABdhPJzTSyIG1tO8wfl096x6dYZqGyOAeZ/K0sXsK5rsKTqVdlp02LhSN7W7b1dwOVC6174Joh4ZaA==
X-Received: by 2002:a17:90b:46c3:: with SMTP id jx3mr12084967pjb.206.1624641172552;
        Fri, 25 Jun 2021 10:12:52 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:cc13:a7dd:f4b5:2160])
        by smtp.gmail.com with UTF8SMTPSA id b10sm5823890pfi.122.2021.06.25.10.12.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 10:12:52 -0700 (PDT)
Date:   Fri, 25 Jun 2021 10:12:50 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        saiprakash.ranjan@codeaurora.org, ohad@wizery.com,
        agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, swboyd@chromium.org
Subject: Re: [PATCH 1/9] dt-bindings: remoteproc: qcom: pas: Add SC7280 MPSS
 support
Message-ID: <YNYOkmja0kfuzLpF@google.com>
References: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
 <1624564058-24095-2-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1624564058-24095-2-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jun 25, 2021 at 01:17:30AM +0530, Sibi Sankar wrote:
> Add MPSS PAS support for SC7280 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

On which tree is this series based? I guess it must be the remoteproc tree
since the conversion of the binding to YAML isn't in Linus' tree yet,
however the patch doesn't apply cleanly against remoteproc/for-next:

  patching file Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
  Hunk #2 succeeded at 144 (offset -4 lines).
  Hunk #3 succeeded at 285 (offset -4 lines).
  Hunk #4 succeeded at 416 with fuzz 2 (offset 23 lines).
  Hunk #5 succeeded at 492 (offset 25 lines).
  Hunk #6 FAILED at 485.
