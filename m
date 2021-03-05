Return-Path: <SRS0=E3rE=ID=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC576C433E6
	for <linux-remoteproc@archiver.kernel.org>; Fri,  5 Mar 2021 22:37:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88538650AF
	for <linux-remoteproc@archiver.kernel.org>; Fri,  5 Mar 2021 22:37:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbhCEWgf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 5 Mar 2021 17:36:35 -0500
Received: from mail-oi1-f171.google.com ([209.85.167.171]:43473 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbhCEWgV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 5 Mar 2021 17:36:21 -0500
Received: by mail-oi1-f171.google.com with SMTP id d20so4223810oiw.10;
        Fri, 05 Mar 2021 14:36:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=R9pdXniqnUk2aO5fvq556ZK0FaRzhrEvBzD4Xai7OqM=;
        b=EXMLEmA9OONqFACOi0mPEvD9VDaJoTzg7Q4PRMejjPJcNaYHZZ+/6fCwmZPs7+yeB4
         dJl83gQNegSb+RbXbBJCAt7DfHVz8GUJ0DnpXvDUuxnn3+q29H9p6J8ZKFsPBY75Qhss
         mxBcZaOnCJkuEwyCNj3Nm2Kcv2JuYnvwcdNsTCgd68mFFQREPSoleHnRl9xwAML735+t
         D3n/zeiPVlrRgn6jPXNj3FF2jFZbqasrsoSbitbZvDdg1zaEBGa8WLpMsULEPKyonN9O
         XMkCGNg5xTX091ApVcxfV+XeuMSc+Aez7AyT/D0T7b6t5u2/DzDQdVkjFmchtjdC3Kkb
         7mBg==
X-Gm-Message-State: AOAM533PpbdWJYj0y1BNASgQGRZMsRiXWyIlXRzYMpe7HNkaFwfi0pKB
        O9OemcIDPIFD+flIA802Gg==
X-Google-Smtp-Source: ABdhPJyFfh4lRK6sxHVeg+/lNbKzxmopPZ3E9F3+wGV1omfG4+xXyGlOaBlIRe6f9LY4NbZ4W1/BpA==
X-Received: by 2002:aca:b9d5:: with SMTP id j204mr9050655oif.18.1614983780571;
        Fri, 05 Mar 2021 14:36:20 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c25sm925410otk.35.2021.03.05.14.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 14:36:20 -0800 (PST)
Received: (nullmailer pid 768709 invoked by uid 1000);
        Fri, 05 Mar 2021 22:36:18 -0000
Date:   Fri, 5 Mar 2021 16:36:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "paul@crapouillou.net" <paul@crapouillou.net>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "agross@kernel.org" <agross@kernel.org>,
        "patrice.chotard@st.com" <patrice.chotard@st.com>
Subject: Re: [PATCH V12 01/10] dt-bindings: remoteproc: convert imx rproc
 bindings to json-schema
Message-ID: <20210305223618.GA766081@robh.at.kernel.org>
References: <1613611500-12414-1-git-send-email-peng.fan@oss.nxp.com>
 <1613611500-12414-2-git-send-email-peng.fan@oss.nxp.com>
 <DB6PR0402MB2760F2258DD869DC6001BD8F88989@DB6PR0402MB2760.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB6PR0402MB2760F2258DD869DC6001BD8F88989@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Mar 03, 2021 at 06:53:16AM +0000, Peng Fan (OSS) wrote:
> Hi Rob,
> 
> > Subject: [PATCH V12 01/10] dt-bindings: remoteproc: convert imx rproc
> > bindings to json-schema
> 
> Are you fine with patch 1, 2?

No need to ask me, you can see where you are in the queue in PW:

https://patchwork.ozlabs.org/project/devicetree-bindings/list/
