Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE50C4361B
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Dec 2020 17:14:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D94322475
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Dec 2020 17:14:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730510AbgLORNa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 15 Dec 2020 12:13:30 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36924 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730472AbgLORNX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 15 Dec 2020 12:13:23 -0500
Received: by mail-ot1-f67.google.com with SMTP id o11so20084799ote.4;
        Tue, 15 Dec 2020 09:13:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tq/IR9knUY1aNNzaItUIR0LH+tSlkFf5XqzmbSFPck0=;
        b=Ex+0qeyDLb5HViFl/kVTrvpjZHoEgDC0iF+BHdfYeJgrZrGYw8q2g2yCsqFxGoklse
         KO4PiUb9s778XX7mkXPL8a45imI2+7ncxY9hDBAnonoXUlCbLfPtOTGxEwJr1gADxWZF
         oLHp3rWp6UgByNDUslPGkk8HKEO+Fom6evo8wE+khe41WrdukVHfM2FK+cZTQZtGvBpU
         TlsiFMHJXDJYXjVJ2JPuMaHjB1pxdaikSfZWqcAYmfCnsKHPe4qcqzv+O5vPT0q61w7a
         +2z/aHaD/y1r9VDIiOkHpR+Gg+uPLtuCja17bzEXx0q4TD7TrMFGMT6X9m/LaRuoNUbg
         g80Q==
X-Gm-Message-State: AOAM530FMTzZwy8hx29W4q34jdeEeUM5s0x4kQwJN58VwcPiQzLzicgc
        8c+1o47djNRag0fC/6bvQA==
X-Google-Smtp-Source: ABdhPJyzQbJ2HQ/svaqxAA488qWQdmLYLwOfT9qsUlzvoW1OAKhM2rplpYojejBWBK+LfmebEn/TOw==
X-Received: by 2002:a05:6830:400f:: with SMTP id h15mr24027638ots.284.1608052363028;
        Tue, 15 Dec 2020 09:12:43 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g12sm4847248oos.8.2020.12.15.09.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 09:12:42 -0800 (PST)
Received: (nullmailer pid 4043914 invoked by uid 1000);
        Tue, 15 Dec 2020 17:12:41 -0000
Date:   Tue, 15 Dec 2020 11:12:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     matthias.bgg@gmail.com, ohad@wizery.com,
        linux-mediatek@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: mediatek: add L1TCM memory
 region
Message-ID: <20201215171241.GA4043874@robh.at.kernel.org>
References: <20201214050521.845396-1-tzungbi@google.com>
 <20201214050521.845396-2-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201214050521.845396-2-tzungbi@google.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 14 Dec 2020 13:05:20 +0800, Tzung-Bi Shih wrote:
> Adds L1TCM memory region.  The reg-name is "l1tcm".
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.txt | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
