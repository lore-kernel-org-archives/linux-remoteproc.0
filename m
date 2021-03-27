Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A27EC433DB
	for <linux-remoteproc@archiver.kernel.org>; Sat, 27 Mar 2021 16:53:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C19A7619CB
	for <linux-remoteproc@archiver.kernel.org>; Sat, 27 Mar 2021 16:53:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbhC0Qwa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 27 Mar 2021 12:52:30 -0400
Received: from mail-oo1-f44.google.com ([209.85.161.44]:43742 "EHLO
        mail-oo1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbhC0QwB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 27 Mar 2021 12:52:01 -0400
Received: by mail-oo1-f44.google.com with SMTP id x187-20020a4a41c40000b02901b664cf3220so2033219ooa.10;
        Sat, 27 Mar 2021 09:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9krKeR+BEQ5MSDjU8HSGRf6pxe/0OMXJUwk0PV8o8Kk=;
        b=mYIJacHfPBeZ5VKSL5mPMKiVh+Q0X4wfwc78miaZumDkEuqh5mJIL5/slj4QYXB5GY
         sx9LhyT8ksKx5ndy/hZqBrsgF+KrLLz3m7Z85+Y0F4end1g1HQ5+Rrr8VdA0Abj8EpIU
         27Orqg9GcyHNHlUimfBGRbu2/2ElXQYrmsJlVrAPd2nRRp/FThXcxsp8jEVGc7ypB6SL
         4LYvMTCK9WPaBrA1nS9jr8rawyOhx/dUDmCiCJ/L6OnbjL5L+bxF+zlCPfmCtIoxsjh5
         sGBwNh9D5WTfYK9JwWm6Ju8XApZplEEreLO8XR1LG3XaO4mT1U9GVL3i7mhKmD4HrUFW
         MCmQ==
X-Gm-Message-State: AOAM530YcOACnpoiGLsBuToDo2aGTeUsPNlEYV6yTfrtgLXxQk8LCuZv
        8sMN/KIaEL/kiLkUZOhHYQ==
X-Google-Smtp-Source: ABdhPJzJ+pcyc6OHcEumz88IP/It9Esrkwx/GDMGo+41DHCnUelDfBvK9qjx6QbGiQ/5F/SAcDMebg==
X-Received: by 2002:a4a:8c4f:: with SMTP id v15mr15869434ooj.25.1616863921227;
        Sat, 27 Mar 2021 09:52:01 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.140])
        by smtp.gmail.com with ESMTPSA id z17sm2902618ote.77.2021.03.27.09.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 09:52:00 -0700 (PDT)
Received: (nullmailer pid 232533 invoked by uid 1000);
        Sat, 27 Mar 2021 16:51:53 -0000
Date:   Sat, 27 Mar 2021 10:51:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     peng.fan@oss.nxp.com
Cc:     s.hauer@pengutronix.de, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, o.rempel@pengutronix.de,
        bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de,
        devicetree@vger.kernel.org, festevam@gmail.com, ohad@wizery.com,
        shawnguo@kernel.org, mathieu.poirier@linaro.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 3/8] dt-bindings: remoteproc: imx_rproc: support i.MX8MN/P
Message-ID: <20210327165153.GA232466@robh.at.kernel.org>
References: <1616400763-16632-1-git-send-email-peng.fan@oss.nxp.com>
 <1616400763-16632-4-git-send-email-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1616400763-16632-4-git-send-email-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 22 Mar 2021 16:12:38 +0800, peng.fan@oss.nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add i.MX8MN/P remote processor(Cortex-M7) compatible string
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
