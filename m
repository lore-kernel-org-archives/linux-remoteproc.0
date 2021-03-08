Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6974BC433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Mar 2021 22:38:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 257596528D
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Mar 2021 22:38:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbhCHWhf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Mar 2021 17:37:35 -0500
Received: from mail-il1-f180.google.com ([209.85.166.180]:38360 "EHLO
        mail-il1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhCHWhF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Mar 2021 17:37:05 -0500
Received: by mail-il1-f180.google.com with SMTP id f10so10372726ilq.5;
        Mon, 08 Mar 2021 14:37:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3dLMMP8YVFanvhztQxNx4iDhoqpBSkRxNSdLZrUSaMU=;
        b=PnWvSqLAx1RZMZLIaAueg2LclCnPGscxDtVeFBCjPdZNJmAW0ZtiRp1kC7Gw/XE83V
         PYCmK2KLQ0DdJLHDl11SJt6GkcPP5qlm8p73tBpocIMVDkdvQixSyw1Q2VvfFerA5X97
         zAFWSiXqyQuNEpRpPWZKmekeWv0XUztzK4kHsmF4EQok8N28j4ITOb+encv4kT2lS0uG
         iIXN7h0TzVvRvMRiDvPtN7HAXp9GxiJCaTIE0ZvjxvvwAxi4TzKkO/Fb1wxt7tp8M9ue
         ffu7PNfB/RWjZoJKTd2TXZZgVwXqicpYmtbB9mjyfE4RDBPc+gO25J/sfL1TNad32R9U
         pwag==
X-Gm-Message-State: AOAM533OUxQMfHFHFLjBfR9Gxeu2Iaj0BgAKTqhu0KvLczR6h/vpDtxs
        Qf0D8am3n1cD/MmcbUM0EA==
X-Google-Smtp-Source: ABdhPJzwROtVDIemWk+ORF19QQGMFuJsdHV81+jeRApSNDoD1IBDJSI0eN3G68U0lJPCbPwj/Bv7Kg==
X-Received: by 2002:a05:6e02:802:: with SMTP id u2mr20982193ilm.298.1615243024712;
        Mon, 08 Mar 2021 14:37:04 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id o19sm6721995ioh.47.2021.03.08.14.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 14:37:03 -0800 (PST)
Received: (nullmailer pid 3077404 invoked by uid 1000);
        Mon, 08 Mar 2021 22:37:02 -0000
Date:   Mon, 8 Mar 2021 15:37:02 -0700
From:   Rob Herring <robh@kernel.org>
To:     peng.fan@oss.nxp.com
Cc:     kernel@pengutronix.de, matthias.bgg@gmail.com,
        Peng Fan <peng.fan@nxp.com>, agross@kernel.org,
        linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
        o.rempel@pengutronix.de, mathieu.poirier@linaro.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        festevam@gmail.com, linux-kernel@vger.kernel.org,
        s.hauer@pengutronix.de, paul@crapouillou.net, shawnguo@kernel.org,
        ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        patrice.chotard@st.com
Subject: Re: [PATCH V13 02/10] dt-bindings: remoteproc: imx_rproc: add
 i.MX8MQ/M support
Message-ID: <20210308223702.GA3077368@robh.at.kernel.org>
References: <1615029865-23312-1-git-send-email-peng.fan@oss.nxp.com>
 <1615029865-23312-3-git-send-email-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615029865-23312-3-git-send-email-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, 06 Mar 2021 19:24:17 +0800, peng.fan@oss.nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add i.MX8MQ/M support, also include mailbox for rpmsg/virtio usage.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 31 ++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
