Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF4EC433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Jul 2022 16:45:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbiGDQpM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 4 Jul 2022 12:45:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234507AbiGDQnK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Jul 2022 12:43:10 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB787DEE4
        for <linux-remoteproc@vger.kernel.org>; Mon,  4 Jul 2022 09:43:07 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id eq6so12354877edb.6
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 Jul 2022 09:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=RxizZTmsDneU1+YC6QOHPdZNB0La10ix39+qMC4rQfA=;
        b=eVDNQr6Lj2ibyXHtj1U1HyOC2iMLm1i6qHT3II0xJ2i1r8o1rsXlr7HQjxyVoaBYXM
         9j0FigNSISfobb9BDeJyXV0CS9Z2mB6UZIYW3Lqk8GI4oOdqYOB/ixEn5U09G0NHOJNF
         zcyXBaxbK3jMo/o0Iiqlr0LWksJie3kT4+R6ttw1iJdPxY+yTiLX5042B0c8cfh68Dyd
         7jrmzF8tRbP9tACfdGFdw/0TIz7SI/6T4MR/bxYUcl/9wwHhbgZqejwMZVhA8FxEZkw7
         XpiJ7IBl7i3duhaGdLTCIbAHWCp7P5DzaxGiR+qLhVYMZRko/AaSCk72AuR6Zwa4Ic5d
         uuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=RxizZTmsDneU1+YC6QOHPdZNB0La10ix39+qMC4rQfA=;
        b=qsEKT4NVS0jPE2Hs+qNVnzK3kgLN3eh8rOeeAD+iMu8Rv7FtO/y2q6Ovb3VIQuNPWj
         74io4d3kIYEVzIC3QW1oTOAwArcP+qmYtD8Xhxrrrd0pJjqcX5fyGcLF5FyW99GLAa0t
         PqF0KPka5XCjUMZYL6/ZFUnI3PBuRwshRVa0cCNemG/JSuroq98DoVRJaq/eN7SCBq3H
         D0XuqBMc1O+BetPKwFvr4b5Y9r2CjKDE8f1YeLiWnalPI6rytjOJQ8L8JCdl1sSPa/gS
         qkWBeWxU7rSKQnDRNSTT9hbGwyGwXn1mN45GONGCxLDX2PE0IsR4OAPhKPREpa3oVldN
         NkFg==
X-Gm-Message-State: AJIora8sjyl3/Tr2evNEntPXIOVVTYpyPkBQmfqBB0f+P08iSoedRqIi
        ezuLR6lxzoTAxRlD0IAU1Qd6DmpvVJZHljVlh/66zH0Q4KoqVQ==
X-Google-Smtp-Source: AGRyM1uZNCaL02YQx30Wpx/7D3j5bMCHA63Yya3pfI0fYwBZQ1YiYdQlswp70zaUH3Zb7wfe33W+1Iws3zSyITmx3Mg=
X-Received: by 2002:a05:6402:4243:b0:437:618c:695a with SMTP id
 g3-20020a056402424300b00437618c695amr41017641edb.222.1656952985545; Mon, 04
 Jul 2022 09:43:05 -0700 (PDT)
MIME-Version: 1.0
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 4 Jul 2022 10:42:54 -0600
Message-ID: <CANLsYkw=C7vnVXmiuCE3F3JiNrvCfgLZO_7ZHiHMn5V0Y42Crw@mail.gmail.com>
Subject: [INFO] Remoteproc/RPMSG patchset review order for July 4th 2022
To:     linux-remoteproc <linux-remoteproc@vger.kernel.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

[PATCH v2 0/1] enable cache for mt8186 SCP
[PATCH v6 0/4] remoteproc: restructure the remoteproc VirtIO device
[PATCH v2 0/3] remoteproc: pru: Enable PRU cores on K3 AM62x SoCs
[PATCH v5 0/6] Introduce PRU remoteproc consumer API
[PATCH v2 0/9] Add support for MT8195 SCP 2nd core
[PATCH 0/2] Introduce helpers for carveout management
