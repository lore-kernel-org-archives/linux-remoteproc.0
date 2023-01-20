Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32945C25B4E
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Jan 2023 10:18:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbjATKSe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 20 Jan 2023 05:18:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjATKSd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 20 Jan 2023 05:18:33 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C31D054B16;
        Fri, 20 Jan 2023 02:18:31 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id g11so661765eda.12;
        Fri, 20 Jan 2023 02:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rR32aF5dMNy5OTYW2VxFtFAU0sP/66FsLov7Vfqs2hY=;
        b=Hgew4VzGej9rtF/iZTq5D3HHQK7gxPEUGElkj4yOTxr1krKZTM4MSOdyqYdzoc9ZmM
         RX5Bn9viHd3HEJYuh6MpqVTitSxfQKZzqnRnqqRYndc2G63eObImsAEtH3ludWk9BySS
         jgzLr741gnEK3ac30Drht+zdCOqdZtsbQjCrPDLoZhBKFQYUS8sV91cDFpnjNgqDFpDq
         xkx1LiE16FOOt8RExS+G+tAisq+C1IxA7x3Q1XT5e5Ji34QLYlY19ckRWKO+30eeXpaT
         qXEM442v9AUn2CKpJrKwDpR10FcwHuuM8Hpc+By9OOwRzFe8r6QEJsfQQ+48lxNdqnU7
         +JKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rR32aF5dMNy5OTYW2VxFtFAU0sP/66FsLov7Vfqs2hY=;
        b=QLzBAfyXZex4le+WhHqfGOKGU9ztxLItdlhgx5Z7iIHtWM/Rw88kLvzK6+bq0zDCxw
         ibZhcnB9AVnHr9DPcxlJvvMPANuwJDzPd1jA1cR+lWl7HZ8r0A9nrzhj/QuMN9fLvCDX
         w5WUF+ONL9wJWG6bxqOEa6vD9r6K8vhf1dSd2xOVoM9jfJSbFUu17eJxTfAn9pVYSLJG
         jdEUQ4dnrdwdwOdYjL6EGEKbVipuscrftoiuDE+f6tL8YrhLR6UYqnBbt1qE9lsmA5DS
         FyeK9zZTiCaNJJIWqiqA8P781sh3iWCHu60MM1YO4vs8Npwj7Os8gUZJDYTX51tBJByo
         ri/A==
X-Gm-Message-State: AFqh2krsiKgyCICmFQUAgLmJv+Eq1U3GW94dY+3GJ2pujWKBe6FY5m1k
        Zw98/fOL9F4CZIf/T/tY088tn9vphYPy4jLQrxs=
X-Google-Smtp-Source: AMrXdXvYe+pjGu0wyX9DlmjVT6oQIgSjdCVKh7rgzNN+vR5ZksCyFZhUyWxq21N+q83Pa8FY4/ZZx3loxQLq8MEpUbQ=
X-Received: by 2002:aa7:dd5a:0:b0:49c:eba3:5bf8 with SMTP id
 o26-20020aa7dd5a000000b0049ceba35bf8mr1567696edw.117.1674209910237; Fri, 20
 Jan 2023 02:18:30 -0800 (PST)
MIME-Version: 1.0
References: <20230119173940.21143-1-iuliana.prodan@oss.nxp.com>
In-Reply-To: <20230119173940.21143-1-iuliana.prodan@oss.nxp.com>
From:   Daniel Baluta <daniel.baluta@gmail.com>
Date:   Fri, 20 Jan 2023 12:18:18 +0200
Message-ID: <CAEnQRZBs9JB616qUK4R00vhgDUqXx_czXi=Q3N59S1OLaBw=DA@mail.gmail.com>
Subject: Re: [PATCH v4] remoteproc: imx_dsp_rproc: add module parameter to
 ignore ready flag from remote processor
To:     "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "S.J. Wang" <shengjiu.wang@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Iuliana Prodan <iuliana.prodan@nxp.com>,
        linux-imx <linux-imx@nxp.com>, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Jan 19, 2023 at 7:42 PM Iuliana Prodan (OSS)
<iuliana.prodan@oss.nxp.com> wrote:
>
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
>
> There are cases when we want to test a simple "hello world"
> application on the DSP and we don't have IPC between the cores.
> Therefore, do not wait for a confirmation from the remote processor
> at start.
>
> Added "ignore_dsp_ready" flag while inserting the module to ignore
> remote processor reply after start.
> By default, this is off - do not ignore reply from rproc.
>
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
