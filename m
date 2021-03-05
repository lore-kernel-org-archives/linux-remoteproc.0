Return-Path: <SRS0=E3rE=ID=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965ACC433DB
	for <linux-remoteproc@archiver.kernel.org>; Fri,  5 Mar 2021 22:37:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54F5065073
	for <linux-remoteproc@archiver.kernel.org>; Fri,  5 Mar 2021 22:37:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbhCEWhI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 5 Mar 2021 17:37:08 -0500
Received: from mail-oi1-f170.google.com ([209.85.167.170]:46933 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbhCEWhH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 5 Mar 2021 17:37:07 -0500
Received: by mail-oi1-f170.google.com with SMTP id f3so4207266oiw.13;
        Fri, 05 Mar 2021 14:37:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=d7De6cARKbzgHITp7pKM1Vma00EtbC1T83WFdMVVjoU=;
        b=EpBlmF6Tr43rcgcHpffpYNRBr7MAxc+4lErxoKspk9fwt/lTwkOF3BsLwLTB27AKBR
         r7LOTFFB2ZMS0DRA9cikDo6UzH+ZEEcdPt3Rr7uyeQcK68bcjDaKKu/BwFeNoh6u5WSb
         Q0QRVk0cVOXmgCymfKOcVhlu/34KEdrRpA+CZE3v1HLKN852hZLKER0WbCRhIsVUKzqK
         ez46g7I+j3oS9YOl4E7lRyYovRE/Ox9NXZMBgPWA5sQrpRxnu/BAQz9bscbOdSvRiKqq
         TQcVXPX9W7lWHPXj5aL2MqI+7wTPC+0VWnYUR+yD0VKjm6FxlDGCOloHVMOiG9C0AdnD
         pxRQ==
X-Gm-Message-State: AOAM531iE1fPR6t8JJ3U9UTtiH/Kadr5x6k2dz/v6EC5LJvCfd2x7Vsm
        2C7EVtnfvrGwpG88WgKBzA==
X-Google-Smtp-Source: ABdhPJzLtZTSheRrPGOH7jyb6B5tnASgaORNe8GQ7JktB0L+h8AmXO2KozQDe7ZAo1EdwiE8ofAZfA==
X-Received: by 2002:aca:eac4:: with SMTP id i187mr8870182oih.147.1614983827273;
        Fri, 05 Mar 2021 14:37:07 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m8sm868673otl.50.2021.03.05.14.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 14:37:06 -0800 (PST)
Received: (nullmailer pid 769782 invoked by uid 1000);
        Fri, 05 Mar 2021 22:37:04 -0000
Date:   Fri, 5 Mar 2021 16:37:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     peng.fan@oss.nxp.com
Cc:     kernel@pengutronix.de, Peng Fan <peng.fan@nxp.com>,
        s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        paul@crapouillou.net, devicetree@vger.kernel.org,
        agross@kernel.org, o.rempel@pengutronix.de, festevam@gmail.com,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        shawnguo@kernel.org, matthias.bgg@gmail.com, ohad@wizery.com,
        bjorn.andersson@linaro.org, patrice.chotard@st.com
Subject: Re: [PATCH V12 01/10] dt-bindings: remoteproc: convert imx rproc
 bindings to json-schema
Message-ID: <20210305223704.GA769731@robh.at.kernel.org>
References: <1613611500-12414-1-git-send-email-peng.fan@oss.nxp.com>
 <1613611500-12414-2-git-send-email-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1613611500-12414-2-git-send-email-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 18 Feb 2021 09:24:51 +0800, peng.fan@oss.nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Convert the imx rproc binding to DT schema format using json-schema.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 61 +++++++++++++++++++
>  .../bindings/remoteproc/imx-rproc.txt         | 33 ----------
>  2 files changed, 61 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
