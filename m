Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB628C43334
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Jul 2022 14:42:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231858AbiGNOmY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 14 Jul 2022 10:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231666AbiGNOmX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 Jul 2022 10:42:23 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1CA13ED42
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Jul 2022 07:42:22 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id eq6so2695990edb.6
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Jul 2022 07:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=a+QbYzDXONXHR2/ia9UjAFNxxvsoeRX7DRfMlIEMaTo=;
        b=HU/NJh7uymD1T7yAyAn3Efq6axsEypXJREh3Db9L8xLHhRg0sPzVDXPEQ3V0W9AT+H
         j9LErmfOhaR3Cj9H1CNBNeXRPZ3ulCFOC6CCxAfZ8zmLwqAfTcSmTe339Ymjf9DnO7if
         Zl1hB+Kyii4qWJnQXbn32mndld+yJfIXVJvhJkv65dns4iaQOS1snmLgQFIWk7ZeyXaK
         k31a7Ih9VaX4jTzaDP2oHms5ONHaZLuqQrZGAjLwK3AOJmWkWCS4n3qLngQpDnwYL9ju
         dtZGRD6JWHtADMqNCoLUdiOu2v1CQxvoVC33WyLKerIYNpHeVJ1yQGRrjsv0jl4gRU9h
         kF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=a+QbYzDXONXHR2/ia9UjAFNxxvsoeRX7DRfMlIEMaTo=;
        b=LH8WALJydmgJ4ahFHHUF8OzR8K+QcnhU03y+6C6pi4NEvsMkccKyWn1Xti+cwDM8qW
         LjIq8ytIxpK+7EyzQXd0bOtlvbi/24bDOAzuawlAUefxkmTjstZblM8cRwPebafY1jom
         CL2ri7jpDDkpk1ivT6CuEeLWkfhjA8wjRZoX6P5kD3lXBoQLbWZX+HxWR9RlaaXU2ydu
         MACvRnKva9w96R0xE88pVrpZqSp0mFHMnWtTh8CoVJYWGyYMPj8dcMNkmu9DmJkr7xxX
         RS9iqQuzrKwHKytYWznKwyIFwSw236mbobns8o4izy37MdlevNoDDmqbZ0cmEDGi14DF
         4HXA==
X-Gm-Message-State: AJIora8oU52TbspZSO4x1qm01hxTaG9iCPqG7NYOkMlIa65nspt7+IOY
        POEk/KqtT6zK6bmHWvvNNIGRCXqwzGFoAVZO7VcNeuf4r5iPfw==
X-Google-Smtp-Source: AGRyM1v6s2vInK/PGwkCB+079tbhdg5fR0aNCSJwwlOPK9CBRtfEHdNFY+WmLDnR79jR4uQnhdaYwzw+KAMUWyjCav0=
X-Received: by 2002:a05:6402:3214:b0:43a:b36f:a0b4 with SMTP id
 g20-20020a056402321400b0043ab36fa0b4mr12859865eda.122.1657809740401; Thu, 14
 Jul 2022 07:42:20 -0700 (PDT)
MIME-Version: 1.0
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 14 Jul 2022 08:42:09 -0600
Message-ID: <CANLsYkxuRtF-bfhz+UJXRWD_b5buUuncYeD2j_xFxYstFQqevw@mail.gmail.com>
Subject: [INFO] Remoteproc/RPMSG patchset review order for July 14th 2022
To:     linux-remoteproc <linux-remoteproc@vger.kernel.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

[PATCH v5 0/6] Introduce PRU remoteproc consumer API
[PATCH 0/4] Introduction of rpmsg_rx_done
[PATCH v2 0/9] Add support for MT8195 SCP 2nd core
[PATCH v9 0/6] Add Xilinx RPU subsystem support
[PATCH v7 0/4] remoteproc: restructure the remoteproc VirtIO device
[PATCH 0/2] remoteproc: imx: add start up delay
[PATCH V4 0/6] remoteproc: imx_rproc: support i.MX8QM/QXP
