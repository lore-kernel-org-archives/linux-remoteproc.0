Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 115B0EB64DA
	for <linux-remoteproc@archiver.kernel.org>; Wed, 12 Jul 2023 20:52:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbjGLUwA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 12 Jul 2023 16:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjGLUwA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 12 Jul 2023 16:52:00 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B5D9B
        for <linux-remoteproc@vger.kernel.org>; Wed, 12 Jul 2023 13:51:58 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-314313f127fso101159f8f.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 12 Jul 2023 13:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689195117; x=1691787117;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I5w53SR8lzB7xkLKRXH7ZL4UJx//8ThUT5lMrfSucaA=;
        b=wp3P68Ogob7ZZgYPXCr1kD56YIySOV+q7CjabyodqoNoCQcttnh+4DIT46Y3L3+niG
         IbgF22bFnCMd0suwF98fG4cmGXJ9PqVBhaieX0RcrG+ZdsbIQyS08UqeAGnZgbz6LnRM
         /vwfi/tyykXWICApX58x2Pky2S3oUTgE2c5PDU3BYXcpDbyiEesP0e+SM4MJwOE9fL5l
         B5ueP3uPKdtlVdYLddhsftARtohL6DzpmVx8QRXsfKqvovxU4LRMQQpaIGe4oKS/kNJz
         tERfi5WxmCBWoks/jWEodpe3gg12X5JuQhVuTsAyZLYzLp93bXt06TCMoJMmFScwuq6e
         oCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689195117; x=1691787117;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I5w53SR8lzB7xkLKRXH7ZL4UJx//8ThUT5lMrfSucaA=;
        b=iLfBN/TULdoeAj7YP4PpvsmgJlUzQpTpkn8ETjmT67tF0Wvce4NjncG6v04tFiXKem
         F4w5k4ud+T6kfuaEVpwm33M3n34tveUhj21E/eZGjG5DCpX4RpVnAjGH6IfJdNT3WQxV
         GNzQHFAM0oNC3mILzsla5kI0OcPCxeYE0dGZfyjoPDOms0oKJPFkAnPil2htIztxAT63
         +3xI3AL/5ZNRkaoAz18clHWy7wgx54voS+rfsLCc6YZxQhz9cPIDSRo7Nev98XN3Mlm/
         W0u+TBAoaBGzQlIbNfgr4cuqluaw6xwreQmc6JDHdoA9nhuX7nzULtBu5zqoNJqfXCjf
         YwuA==
X-Gm-Message-State: ABy/qLajWpN+1uJZKb31zv6HxUOz4wUW8UfV2WdZj8lxW2KxNgn8Dkt+
        R1LRd7n20qjDBiOiEFjDkdMAadmyVhK7xfNa2bW5ksIEv4z4oqdgdTiIVg==
X-Google-Smtp-Source: APBJJlFdbaMZYWc4JdzB8SdIU2s13P/VrNLau3GzVfhaUX9w67wqXu+gWvRlv1uEZbl/oYDHZ+oyNs9LUW42Mki+rnY=
X-Received: by 2002:adf:ed4c:0:b0:314:212f:360b with SMTP id
 u12-20020adfed4c000000b00314212f360bmr18092073wro.17.1689195117030; Wed, 12
 Jul 2023 13:51:57 -0700 (PDT)
MIME-Version: 1.0
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 12 Jul 2023 14:51:46 -0600
Message-ID: <CANLsYkyPhQM6F0rxy8=VvoZda1U=xf51pk5fA=Ta-e4dSaA_9A@mail.gmail.com>
Subject: [INFO] Remoteproc/RPMSG patchset review order for July 12th 2023
To:     linux-remoteproc <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

To review:

[PATCH V9 0/3] rpmsg signaling/flowcontrol patches
[PATCH 1/2] dt-bindings: remoteproc: imx_rproc: Support i.MX8MN/P MMIO
[PATCH 2/2] remoteproc: imx_rproc: Switch iMX8MN/MP from SMCCC to MMIO
