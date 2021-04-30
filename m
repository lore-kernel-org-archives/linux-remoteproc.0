Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FAAAC433B4
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Apr 2021 15:02:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F02A6142A
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Apr 2021 15:02:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbhD3PDG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 30 Apr 2021 11:03:06 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:42993 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbhD3PDD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 30 Apr 2021 11:03:03 -0400
Received: by mail-ot1-f47.google.com with SMTP id y14-20020a056830208eb02902a1c9fa4c64so28165254otq.9;
        Fri, 30 Apr 2021 08:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F9GhsdpfMFw1XQS95oOaFtuQR68+94Cw1botEtYm2JA=;
        b=Kgiv341fWdJPbpZsFTbisVNBmGCms3M+2MATXrhVEkhPP9EUxiyTNgMK03YFw8RHFT
         LG6/koMv4xs+42dvkZPtlza12uYD0ZFRMfO5w7wl/mOYm/AfApU+g60eOPpwqdmsWHYl
         aWv5ytBnsaVtNOpf52nltzcZHoIQQBLXdzqmKAPRIKfrzImuSquADGjTJHjN5Y+/Ce3G
         1RPO+2Ds99fY1INYJ5sGaC/13EYU4dnJWlBNnpdtslkrfmXpY5faHrP35prLGDquq02c
         7A6wEVUy+ARz0dJ6NsfjprrSD0ECnzConXOpqsrZdBYQnR69Y2ejWWkBXV+T61ahm+y/
         kcDQ==
X-Gm-Message-State: AOAM530Rud3zxVS8e8CZQctYMce5Aql7sYJLdSTDsR0zScSz1iI/DDzo
        IVdQTmLALP8LdfStuv8Smg==
X-Google-Smtp-Source: ABdhPJy7trg520HyRmD2pfZEyTOVNIA/o37CSin5+n1zGlQSwyIZveKd27XpU2dwbeDr1aPADSQ+4Q==
X-Received: by 2002:a05:6830:17c7:: with SMTP id p7mr3673935ota.279.1619794933190;
        Fri, 30 Apr 2021 08:02:13 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r9sm803667ool.3.2021.04.30.08.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 08:02:12 -0700 (PDT)
Received: (nullmailer pid 3317530 invoked by uid 1000);
        Fri, 30 Apr 2021 15:02:11 -0000
Date:   Fri, 30 Apr 2021 10:02:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     rjw@rjwysocki.net, rishabhb@codeaurora.org, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dianders@chromium.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, sidgup@codeaurora.org,
        ohad@wizery.com, robh+dt@kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, swboyd@chromium.org, mathieu.poirier@linaro.org
Subject: Re: [PATCH 03/12] dt-bindings: remoteproc: qcom: pas: Add QMP
 bindings
Message-ID: <20210430150211.GA3317476@robh.at.kernel.org>
References: <1618574638-5117-1-git-send-email-sibis@codeaurora.org>
 <1618574638-5117-4-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1618574638-5117-4-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 16 Apr 2021 17:33:49 +0530, Sibi Sankar wrote:
> Add Qualcomm Mailbox Protocol (QMP) binding to replace the power domains
> exposed by the AOSS QMP node.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
