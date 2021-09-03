Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57DA6C433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri,  3 Sep 2021 16:50:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A6BB610E7
	for <linux-remoteproc@archiver.kernel.org>; Fri,  3 Sep 2021 16:50:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235425AbhICQvQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 3 Sep 2021 12:51:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:54128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230187AbhICQvQ (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 3 Sep 2021 12:51:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 22AC1610CC;
        Fri,  3 Sep 2021 16:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630687816;
        bh=VUwk1/BRkK07J1ioCKDSItUtjzEDllPwvxeXiWvODuM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dwJwKmdCvhF/Q8vmmeGX4DXmAkl8UkrO2VtS41NAjl/78MnERee5kVma1Y8wG9sBI
         VlVHMxalSH5V11BQOIybdlrjo5GdY49reXqPw/H7C+CSnO41Z0czvWWoqRRjWiQT1d
         1eyc+6s/J8wrt5LvKcIDLFMyXckj2ujI7iHqM5OLCqITM5qYzVik9jeHbtEDruZZNS
         r+V5I/bYvbMiRr56ybH5RBGMMVPjHJ+dVlEFOvsERVfImhy0vPvx8pretVS76Ys28V
         E5k2zLI3ww5c7wYIjfckealVyQll+3JTdfPgqzJ2x6OWOYpPdMATjnEk8sV7ZYlbZt
         uym379c0hYkgw==
Received: by mail-ed1-f41.google.com with SMTP id l6so8774269edb.7;
        Fri, 03 Sep 2021 09:50:16 -0700 (PDT)
X-Gm-Message-State: AOAM533E5FiqMEVjTvzY/yWR6tW1mYuxWXWqR+pGJ37L9nZMFnmAqiY6
        G0wXbDF4Q4kFuBPPtfU96tKpJG9/p+kAKYJ8sA==
X-Google-Smtp-Source: ABdhPJywrfSsYbNB1uIR1Vw+ndK0QYexlxbEpDmF9RZVBhpllKYaMxxoicP3x8DZ7zdO1yMAihqIRSheQDViNxczMvc=
X-Received: by 2002:a05:6402:40cf:: with SMTP id z15mr4926602edb.70.1630687814769;
 Fri, 03 Sep 2021 09:50:14 -0700 (PDT)
MIME-Version: 1.0
References: <1630661377-31244-1-git-send-email-shengjiu.wang@nxp.com>
 <1630661377-31244-4-git-send-email-shengjiu.wang@nxp.com> <YTJQcIOU1mMxoIpF@robh.at.kernel.org>
In-Reply-To: <YTJQcIOU1mMxoIpF@robh.at.kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 3 Sep 2021 11:50:03 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL_5U0QB5d5VmgX3PMa9LNkyFa+RHWSAzeeTzq6xR=_nA@mail.gmail.com>
Message-ID: <CAL_JsqL_5U0QB5d5VmgX3PMa9LNkyFa+RHWSAzeeTzq6xR=_nA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: remoteproc: Add fsl,imx-dsp-rproc
 binding document
To:     Shengjiu Wang <shengjiu.wang@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Sep 3, 2021 at 11:42 AM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, 03 Sep 2021 17:29:36 +0800, Shengjiu Wang wrote:
> > Define the compatible string and properties needed by imx_dsp_rproc
> > driver.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../remoteproc/fsl,imx-dsp-rproc.yaml         | 131 ++++++++++++++++++
> >  1 file changed, 131 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-dsp-rproc.yaml
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

I take that back. What's the difference with this binding and
Documentation/devicetree/bindings/dsp/fsl,dsp.yaml?
