Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE0DC4332F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 19 Oct 2022 17:29:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbiJSR3p (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 19 Oct 2022 13:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbiJSR3j (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 19 Oct 2022 13:29:39 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEED42F66F
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Oct 2022 10:29:35 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id d14so9544279ilf.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Oct 2022 10:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CYeBpJG0Ss3XZohlaFtJJ7YUqTCzNc/ixlpcW3YdczU=;
        b=fVSC+EDkMdeXGt58Q8XBv9V2nUj/HUF5/SuwHwB62rl7PRsA2BkHaOdiFFuzVTd/8D
         Pv6iRLP92g/m1GhrCuCvi/RYmwsVExYqq22wrM5PC/yaAD4mKpD3oh9C/4oqduFxG87n
         JQK8zjc7pnLKDbPfVnQegntqBVYCsMcj7SjvAvDWuWanFPQqBb85BoTwG7WYas2Ulwfx
         fwiGtMPxrou/rB75UiTgYYeZiFLdp+0JHPm6p2Rah57m3SD9gAZV+Yihegjrdn/9rYWV
         CKJnMppREbwtKVSAgNsJZnHlhmUkvuLZuivFSnbyWPYBwzch8WsSwcGSf+jzTodKHO11
         FxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CYeBpJG0Ss3XZohlaFtJJ7YUqTCzNc/ixlpcW3YdczU=;
        b=NEo5gru3jtJTiMpt2Qq24AyXmeXKp1g/kNkKu3Cz34sHeDP5ym2Poe+U5vtA7CdHA3
         EVFkUa9mf4CkVWAkDoNThUDuNM0YiRdmrqAjzn78y5d+VHQwdTBFVE4MkL2HwayqZbo9
         IC0zficBLwZcYAwTxPQOS8GiAXMcAELBCoXtLXLfeJuapUbbPk9T0JstloskhZGAELE1
         T4M1snlV6h6cfPXElYHR+Yr63PsqoKbcIsrbNe43pb6ogenIhokwJ7wRHaQYcmZM2TEg
         ID4JaubjYhXezktGqYvIdk7tqrnzBcvTpbdjOuCaC8Cl5VyJJam1apqM9yy0hQFZDzzG
         hcBg==
X-Gm-Message-State: ACrzQf23ka3xm8MfLbflhwVX4czyswSWz5fp02XYmtT2fEGCTwfxMeUd
        sq0DovDa2D5TAq+mN/30JEetJ7pLV0sTD36FmHzdP+DicPFu4A==
X-Google-Smtp-Source: AMsMyM7l3sWsUzV9eZr3NXp7X3GEoLwJrn8tsXmLyc22gTFxmj10gyVxUzmjvvk2Bzd6XzmjSpZ5K4ovdWPnF0E6pVU=
X-Received: by 2002:a05:6e02:2162:b0:2fa:c097:de05 with SMTP id
 s2-20020a056e02216200b002fac097de05mr6538792ilv.277.1666200574746; Wed, 19
 Oct 2022 10:29:34 -0700 (PDT)
MIME-Version: 1.0
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 19 Oct 2022 11:29:22 -0600
Message-ID: <CANLsYkzjTnXxqqFxZp2ya7tRj0JWyifHHJvprTLysQWU-V1ksw@mail.gmail.com>
Subject: [INFO] Remoteproc/RPMSG patchset review order for October 19th 2022
To:     linux-remoteproc <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

[PATCH v5 0/3] Add support for WASP SoC on AVM router boards
[PATCH v3 00/11] Add support for MT8195 SCP 2nd core
[PATCH v10 0/6] Add Xilinx RPU subsystem support
[PATCH v6 0/6] Introduce PRU remoteproc consumer API
[PATCH V3 0/3] rpmsg signaling/flowcontrol patches
