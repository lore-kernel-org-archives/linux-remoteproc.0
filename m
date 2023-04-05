Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C145AC76188
	for <linux-remoteproc@archiver.kernel.org>; Wed,  5 Apr 2023 19:37:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbjDEThy (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 5 Apr 2023 15:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233773AbjDEThc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 5 Apr 2023 15:37:32 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ECF37AB2
        for <linux-remoteproc@vger.kernel.org>; Wed,  5 Apr 2023 12:37:07 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id m8so10608584wmq.5
        for <linux-remoteproc@vger.kernel.org>; Wed, 05 Apr 2023 12:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680723425;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E3o0jj5m1AHpzk4jh+DhEwlhwDa1qBAp08wh9mdIlcw=;
        b=P3PlEGkMAh4UccDW7fCi4V/k/7vQDkySFAMlNgHyKfyA4zkEMAj5KsiGDyo/4ldJCY
         Fom6rPetizge0Uwa2Xkzu0nUNQyFt84NQ5Nybq1zFSE2ac3kcdVqwgdniko49VacLdpS
         +e4n8UBHVPCD97MdDU12dBkHUSIWj1ZBZAKunK+8Me8niVx0+ZSEGzngXA0oFVFYWJOQ
         QQvi3DdpZ+PbRRqsMs+viljJcCQnI06a/RiI7rEPFUIBgQMJ2S7JWGVX7UsS9FIzkP9c
         UBUIUWRid7WA6qrHwqPRDkZcdKrBlGg+xJ152uZihbh53TBmRKUf+Cw9iHGRzLE19Qpj
         hGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680723425;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E3o0jj5m1AHpzk4jh+DhEwlhwDa1qBAp08wh9mdIlcw=;
        b=m5HoXoTMjdxJedS+9gDZ/WCNa8Yp8zgNCYv394JLOCd4zTs7nkSV+bHAfgGP4f1g98
         F/uZ3b7x8zVZN9dnEj0ZUfJrswyDZ4SvX2y8iXyE5SFB8N8KNJpEinKoqhHdAhHSyFRE
         no9QxkQKcSZeXK/U2LvssEQyqJWHa18h8I9oa6Yx3mmXyEnV2P6XFHOg/HKcYaj7B0Dk
         N5BoDds1dRByRToTDDSRlieL/SoPsgPAnQrmirDSOBBf8EMkbWUB2m41zR5b/jImiJQU
         NFFtAu0NeQUt+3f01+jX2pjJKoNG8VuyrDGyqfaaCUiIzHnSCtikUMIJLoeOZpuM1k7v
         h41g==
X-Gm-Message-State: AAQBX9f105uHUALjy0XnHde2vtu4/nw7L5MnNjk33FoeSOrt7E4K7rFN
        L81Q7M16E3QYGYPEUUANHr06xODWGeAYGMlErH0cvNdkTSVfrXlL+to=
X-Google-Smtp-Source: AKy350bG1YdTxn6ZKPQpdq5eQfpmd334P5iQKQDquLrSUkYetZa8PfZi2vZb78QQscE0xfqfsDiTec/ZPTEHHoy2G+s=
X-Received: by 2002:a05:600c:291:b0:3f0:4429:2eb5 with SMTP id
 17-20020a05600c029100b003f044292eb5mr1910099wmk.5.1680723424730; Wed, 05 Apr
 2023 12:37:04 -0700 (PDT)
MIME-Version: 1.0
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 5 Apr 2023 13:36:54 -0600
Message-ID: <CANLsYkxirmz+RKk-SKdgwn8iANT986x=47A3baKNJf57XbVqYA@mail.gmail.com>
Subject: [INFO] Remoteproc/RPMSG patchset review order for March 22nd 2023
To:     linux-remoteproc <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

To review:
[PATCH v7 0/4] Introduce PRU platform consumer API

Monitoring:
[PATCH v3 0/2] remoteproc: get rproc devices for clusters
