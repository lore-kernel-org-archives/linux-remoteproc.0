Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0206C433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Jan 2021 22:26:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F0F622D03
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Jan 2021 22:26:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390102AbhAKW0J (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 11 Jan 2021 17:26:09 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:43801 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390076AbhAKW0I (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 Jan 2021 17:26:08 -0500
Received: by mail-ot1-f44.google.com with SMTP id q25so405774otn.10;
        Mon, 11 Jan 2021 14:25:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4PfTLxMOVvDlbCq/bvKfXWzNilh/iML3qIR50BxBSjY=;
        b=r38AQsZp7zMwFP4VNmVSYxjO+L1Rf1FOQ1v+kuQXVZHil2+6hu1c65KOGjIQxozLB7
         K+0wrRbBpl/AvPk3nSXeJcrFCX4BYlaF4gx/1PCWZNf4BjjDcQBYx/9g6c3dMHUVXstx
         Jm3fUKkxO2qil+A8QWBN8XyrC0QTgMxpIWWl1mkhhohjcJ+0J2zvY9TAzio/6Xdedu6R
         8e9YPh9s0A/v3LtY1jTodWrnHP0lyOJl8lIb54a+2z+nXq7Lcd7S50wbunEBMRxx8al3
         FFaiQiQedcCuOFIynrOPtPqQOZLlQcURF0Yds4R9HZ6fsPYcRlm3A+WETDf6IEYBLSJJ
         gMnA==
X-Gm-Message-State: AOAM531SDipokK/D4R27Y+oWjgnzn5DajmfTQeFIUgJinadrDu4r2N5c
        nOV5ixckQzSSp7Ov6d9xeQ==
X-Google-Smtp-Source: ABdhPJxHduQTK2m6PjKWQtnXIxp9PMu6VCRKLlpfa4iwt0UhBX6oIT2kiPwO6YaYT+/NsMM2CLOzTw==
X-Received: by 2002:a05:6830:1d8e:: with SMTP id y14mr834615oti.356.1610403927646;
        Mon, 11 Jan 2021 14:25:27 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t26sm238517otm.17.2021.01.11.14.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 14:25:26 -0800 (PST)
Received: (nullmailer pid 3168352 invoked by uid 1000);
        Mon, 11 Jan 2021 22:25:25 -0000
Date:   Mon, 11 Jan 2021 16:25:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org, ohad@wizery.com
Subject: Re: [PATCH v2 3/5] dt-bindings: remoteproc: Add the documentation
 for Meson AO ARC rproc
Message-ID: <20210111222525.GA3168299@robh.at.kernel.org>
References: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
 <20210102205904.2691120-4-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210102205904.2691120-4-martin.blumenstingl@googlemail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, 02 Jan 2021 21:59:02 +0100, Martin Blumenstingl wrote:
> Amlogic Meson6, Meson8, Meson8b and Meson8m2 SoCs embed an ARC EM4
> controller for always-on operations, typically used for managing system
> suspend.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../remoteproc/amlogic,meson-mx-ao-arc.yaml   | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
