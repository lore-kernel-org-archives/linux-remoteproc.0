Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09ABBC43334
	for <linux-remoteproc@archiver.kernel.org>; Mon, 20 Jun 2022 15:52:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234773AbiFTPwM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 20 Jun 2022 11:52:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238602AbiFTPwL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Jun 2022 11:52:11 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C330B1C933
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jun 2022 08:52:09 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id o7so22005878eja.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jun 2022 08:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=Gud0Aqe7bp3ujrsKhMn2XeW7KkyTQbe0Yi5hQHo96U4=;
        b=vB3TUklRse9PRvlAWjBJspEDmuQ673Q3uXk6EmLLr6l47SyQjAHY8+LwF0v0uRM2TR
         xvOPj5FUPxUalZSx9xcr37UyLxWEfEG8anEqlFXTOJO4AJT4WfI/5adeGZTke4mtk7wX
         tKFcORRrtM7sPHcHKPXwFtWzZKMiHOGjAAibe+xzuFYzWVupGtO0eox1ulRUoQVzsbvX
         IucbQo41IWrJK4LAsQqRfCVuSd8uvF4z7FByzewmyOVs602Znw5DHzcFecbR53ydu7G4
         G1wy9QRIf1BvjvOzEhMEdB96eE9aP6M5CUg++Oi8r0ossFdt2fMc2/0UHJEGYJ0IvySZ
         WaJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Gud0Aqe7bp3ujrsKhMn2XeW7KkyTQbe0Yi5hQHo96U4=;
        b=aa1aJZhOD+fZcEXUn5uASLd+NXg/ym7varuZx6wSbg92JKuYZCliBZWTEg5s/O9Opv
         czE54g7AGEPvNl4cBjMxzQ16EDSZy5fwYDSK+V3vp3eEKXki1adsJ8mexjLnOLGlZnEQ
         +sPKhGQbVCx/uU9DsIuTKiLdExu5ve4JvvZ68fmAceyUuxb727P/ZQ0KXPe29PTQXO3d
         es8gkDSryAmnGqX/jptQ7bE8LYATDowFOJaWEXSJP9CkEjsy/zzxSGDmdvyk+0Dapt3d
         +7WmcGrYHaDLOkWZsLyvBfVE5UmcCBCdbWDPoH0KugrHuE68ZXQ5xqIwYN3aYHc5LXLM
         iOrg==
X-Gm-Message-State: AJIora9heapdUfW9ChelNHBOu+WC5Vzy0MLAOlgOo9sQOBztUTdxed1J
        9aCN9g7Ed6O3fwH1s3xNzPaxUG5FkLoZriJvqswJXr6rrLUfDw==
X-Google-Smtp-Source: AGRyM1vE/OS2gkWAHoNfDR0u+EaAQzmHK0aIgyxXU+Kgb1wcBV74aT870fgShW6dhI2T2X4Z0mKmw2YSotWt9CpEhro=
X-Received: by 2002:a17:907:7e91:b0:721:9b87:7095 with SMTP id
 qb17-20020a1709077e9100b007219b877095mr10582653ejc.564.1655740327813; Mon, 20
 Jun 2022 08:52:07 -0700 (PDT)
MIME-Version: 1.0
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 20 Jun 2022 09:51:56 -0600
Message-ID: <CANLsYkyFerRVfQZXBN4PyMaJwmLdJ3JM_=pxpjumXYKanUbv6A@mail.gmail.com>
Subject: [INFO] Remoteproc/RPMSG patchset review order for June 20th 2022
To:     linux-remoteproc <linux-remoteproc@vger.kernel.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Good day to all,

For quite a while now patchsets have been submitted to the
remoteproc/RPMSG mailing list faster than I can realistically review
them, resulting in a backlog that goes back several months.

To keep people informed about the rank of their work in my queue I
have decided to publish a snapshot of my review log on a by-weekly
basis, usually in the odd week of the OpenAMP remoteproc by-weekly
conference call.  Since I maintain other kernel subsystems and open
source projects, the list is an indication of what I will be reviewing
next in the remoteproc/RPMSG subsystems rather than what I am
currently doing.  I normally strive to review patches in the order
they are submitted but based on size and complexity it may not always
be possible to do so.  As always, patchests reviewed by other members
for the community have a much higher chance of being processed
quicker.

Best regards,
Mathieu

Remoteproc/RPMSG patchset review order for June 20th 2022:

[PATCH 0/2] dma-mapping, remoteproc: Fix dma_mem leak after rproc_shutdown
[PATCH] remoteproc: imx_rproc: Fix refcount leak in imx_rproc_addr_init
[PATCH V3 0/6] remoteproc: imx_rproc: support i.MX8QM/QXP
[RFC PATCH 00/10] Introduction of rpmsg flow control service
[PATCH v2 0/3] remoteproc: pru: Enable PRU cores on K3 AM62x SoCs
[PATCH v6 0/4] remoteproc: restructure the remoteproc VirtIO device
[PATCH v5 0/6] Introduce PRU remoteproc consumer API
[PATCH v2 0/9] Add support for MT8195 SCP 2nd core
[PATCH] rpmsg: strcpy is not safe, use strncpy
[PATCH] rpmsg: virtio: Fix broken rpmsg_probe()
[PATCH 0/2] Introduce helpers for carveout management
[PATCH V5 0/2] remoteproc: support self recovery
