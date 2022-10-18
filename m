Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1EE5C4332F
	for <linux-remoteproc@archiver.kernel.org>; Tue, 18 Oct 2022 15:18:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbiJRPSd (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 18 Oct 2022 11:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbiJRPSc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 18 Oct 2022 11:18:32 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2753DD18E2
        for <linux-remoteproc@vger.kernel.org>; Tue, 18 Oct 2022 08:18:30 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id d142so11983750iof.7
        for <linux-remoteproc@vger.kernel.org>; Tue, 18 Oct 2022 08:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/EuOApZthRai3b0FADROiybh4EfAASBFudp2TOSEve4=;
        b=TWFoANBzH/sj+Fx9lOxfEZxHXTc1kvvO63+V40elRNGzwYzB3IaGv0Noyd7q+9zaec
         oynm9VEUQ8S8xzn/BHmZ6SUTs4KO+uEVTC8KgDSU7nl8NkBlLWDolsltJjlSKPZGpi9L
         A29M7LrPTmqcb96oMUX/thsOCekivpfnuLm3kmO3vl8PW+dAQN0sLkBkdODf12pSrjvb
         uN+RQZCh8Nm0v4I36C8GnELZalX2AFc8WnP8xlWDfsQmS4nnNfExzhi+PIm3Ut4MvK21
         Q770JWJcM5T61297QogozshI9k19SYZUhKKc2zSHWfAlIFKXvixOH/oDRTZi4npD8XDy
         Hbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/EuOApZthRai3b0FADROiybh4EfAASBFudp2TOSEve4=;
        b=iuYMNREWd0hwqLVNYBdgbVcvQE+NF0GgNjo8yWf7ZgfzQQPrPNrd7zd/B8YAfj49bn
         DNBGgD0qhrhDNoCHI3owjkN32T462nPVzXYAssPNQOYPKdjyoLehOSdRUqkj2f0NQBdn
         5EO5cMcU6n9nbng2aqoK2ZDrfn5A6VZqyAE9QHZ0hE1sHeaPDfHpsZ52ounuq2mq6u/+
         gzE397UlXDsNE5GLLii16ktJo/4JeelBN9w5uVuO2ncR3inn1qNHhVS4v77K+OWIPavj
         EPC51VnstjiyiH7beH0lYAskoxqDEcBwoSUBLtVF57g4PftN66cdWtc3BKT7dzfMzHtn
         /Qyw==
X-Gm-Message-State: ACrzQf0I/UzC4DcReaqTalVwD6M85656WS7U/n8Mf69qSORQBuJI5S6S
        UrrMswGiLnF1+lfFlFXFhBD9zdA8udD5qu6wU0MH9Q==
X-Google-Smtp-Source: AMsMyM4zsb96GxH4WbhsB18GLiUhYvVBNIGYAbRcnA+7anTndxDu3YkcsEpuIdakOj+hiKnYJ32wr4XmfeLLnpBhKBM=
X-Received: by 2002:a02:290e:0:b0:35a:d680:7aad with SMTP id
 p14-20020a02290e000000b0035ad6807aadmr2047464jap.62.1666106309421; Tue, 18
 Oct 2022 08:18:29 -0700 (PDT)
MIME-Version: 1.0
References: <1666100644-27010-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1666100644-27010-1-git-send-email-shengjiu.wang@nxp.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 18 Oct 2022 09:18:18 -0600
Message-ID: <CANLsYkyJmF87fa4VuujgP5g9gOV66p-3xzWwwnm3uA_ZEJ-RFg@mail.gmail.com>
Subject: Re: [PATCH v3] remoteproc: core: Auto select rproc-virtio device id
To:     Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     andersson@kernel.org, arnaud.pouliquen@foss.st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengjiu.wang@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 18 Oct 2022 at 08:04, Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> With multiple remoteproc device, there will below error:
>
> sysfs: cannot create duplicate filename '/bus/platform/devices/rproc-virtio.0'
>
> The rvdev_data.index is duplicate, that cause issue, so
> need to use the PLATFORM_DEVID_AUTO instead. After fixing
> device name it becomes something like:
> /bus/platform/devices/rproc-virtio.2.auto
>
> Fixes: 1d7b61c06dc3 ("remoteproc: virtio: Create platform device for the remoteproc_virtio")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Reviewed-by: Mukesh Ojha <quic_mojha@quicinc.com>
> Tested-by: Peng Fan <peng.fan@nxp.com>

I will queue this on Monday when rc2 comes out.

Thanks,
Mathieu

> ---
> changes in v3:
> - add comment in codec
>
> changes in v2:
> - update commit message
>
>  drivers/remoteproc/remoteproc_core.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 8768cb64f560..f9187e35b090 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -509,7 +509,13 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>         rvdev_data.rsc_offset = offset;
>         rvdev_data.rsc = rsc;
>
> -       pdev = platform_device_register_data(dev, "rproc-virtio", rvdev_data.index, &rvdev_data,
> +       /*
> +        * When there is more than one remote processor, rproc->nb_vdev number is
> +        * same for each separate instances of "rproc". If rvdev_data.index is used
> +        * as device id, then we get dupliation in sysfs, so need to use
> +        * PLATFORM_DEVID_AUTO to auto select device id.
> +        */
> +       pdev = platform_device_register_data(dev, "rproc-virtio", PLATFORM_DEVID_AUTO, &rvdev_data,
>                                              sizeof(rvdev_data));
>         if (IS_ERR(pdev)) {
>                 dev_err(dev, "failed to create rproc-virtio device\n");
> --
> 2.34.1
>
