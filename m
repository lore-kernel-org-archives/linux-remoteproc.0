Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC45C4338F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 26 Jul 2021 22:37:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3311560F6C
	for <linux-remoteproc@archiver.kernel.org>; Mon, 26 Jul 2021 22:37:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233824AbhGZV5W (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 26 Jul 2021 17:57:22 -0400
Received: from mail-il1-f174.google.com ([209.85.166.174]:36686 "EHLO
        mail-il1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233775AbhGZV5U (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 26 Jul 2021 17:57:20 -0400
Received: by mail-il1-f174.google.com with SMTP id c3so10473061ilh.3;
        Mon, 26 Jul 2021 15:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jhQiogE/zeQBOwAh8kG8uDNGFLp4MbNyTgySdYg4ow4=;
        b=TocQWa9ip9/xoSreBpRxxoKomP3QfbnPknY5MelMcBwGvOPTH7zDa6WeDf0xelKt26
         5cZEAk0LlewQEit8X97JIA8j0cdAFHV1JgrdbagKluGhSsBdCxtss1fIzbK3bHBaDLme
         uRuL58fEowFWnbpKD0QAoRwdv1v4o3wP62ylREjQbQhHlonFP0VKhvY+kVlQ8XBdeirM
         x7HbRCF6xaTQ3BIfmGZtzd6MeR9bMeCJhwjeu+h4dVgu1rU8jbKTCWOLiRwUicqsr42A
         pJ5SvAURqiCs0rlvnFw2geeAWidDFJrH/Q9DCVI0iIlZGdE8KbZ/zbF6uSAfqXDrvOxd
         GAbw==
X-Gm-Message-State: AOAM531s8TCeFYOlAdfIlXMv8hTeGSZvauQDM5GAVIZZ8iXUNKLqnRoF
        ANlqmpAYi/hYCZLfJXPlAXjV2Rkk3Q==
X-Google-Smtp-Source: ABdhPJyVtrHqYPjIilDfqErTtViORlAkmWMthFR2B1uXTchtbhmi29nCNdMxW6IA+JC7hKaJdxzPUg==
X-Received: by 2002:a92:c60c:: with SMTP id p12mr14394951ilm.7.1627339067336;
        Mon, 26 Jul 2021 15:37:47 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id v18sm607434iln.49.2021.07.26.15.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 15:37:46 -0700 (PDT)
Received: (nullmailer pid 1002097 invoked by uid 1000);
        Mon, 26 Jul 2021 22:37:42 -0000
Date:   Mon, 26 Jul 2021 16:37:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     rishabhb@codeaurora.org, devicetree@vger.kernel.org,
        dianders@chromium.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        sidgup@codeaurora.org, ohad@wizery.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, ulf.hansson@linaro.org,
        robh+dt@kernel.org, rjw@rjwysocki.net, mka@chromium.org
Subject: Re: [PATCH v4 01/13] dt-bindings: soc: qcom: aoss: Drop the load
 state power-domain
Message-ID: <20210726223742.GA1002063@robh.at.kernel.org>
References: <1626755807-11865-1-git-send-email-sibis@codeaurora.org>
 <1626755807-11865-2-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1626755807-11865-2-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 20 Jul 2021 10:06:35 +0530, Sibi Sankar wrote:
> The power-domains exposed by AOSS QMP node are used to notify the Always
> on Subsystem (AOSS) that a particular co-processor is up/down. These
> co-processors enter low-power modes independent to that of the application
> processor and their states are expected to remain unaltered across system
> suspend/resume cycles. To achieve this behavior let's drop the load
> power-domain and replace them with generic qmp_send interface instead.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
> 
> v4:
>  * Rebase patch due to the recent aoss-qmp yaml conversion (Dropping Rb).
> 
>  Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
