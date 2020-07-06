Return-Path: <SRS0=TWFy=AR=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1367C433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon,  6 Jul 2020 21:15:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 906952064C
	for <linux-remoteproc@archiver.kernel.org>; Mon,  6 Jul 2020 21:15:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sy/iKHCz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgGFVP1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 6 Jul 2020 17:15:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgGFVPZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 6 Jul 2020 17:15:25 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB80BC061755
        for <linux-remoteproc@vger.kernel.org>; Mon,  6 Jul 2020 14:15:24 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id v8so40830883iox.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2020 14:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=OcSA5xzMViprn0aJS6iYMjdlMZ6RXdSdT+c5i1UqlTY=;
        b=sy/iKHCzuNE+X2m0qH5EFFeB1E7VGWHXIdgmvE/LK9Eo0tTXKNe/wZ2ZUnnEvDIzCe
         6ozK6Bxd8dybFLzzkGiXn9x+wKpRFneN3qhoCPVTgbV4ruui85ZiL4pfJEREiLcECwpt
         LME8B+3RMt87+GaiNbvtKZ5585iCP/PWvInByoensz9H2PJs02w6kn8WminWkR1tGzMo
         sTjjkMh854QMC0daOlZLKU85zoBunepLQ8NLlTWOrKWclTL2l59TVtgiAEDNQI0Ct9at
         sIoou8j8gPC2Vm7zlyZkf0rQkGIV1UGtrB9IwK1fkUVh9BFaImm5KwpYe6tmAcsl7YYQ
         /B2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=OcSA5xzMViprn0aJS6iYMjdlMZ6RXdSdT+c5i1UqlTY=;
        b=RxxlWg8Elnu4eFz2ZBRFFGO6EbEHdf8PbaGwyLn9VvqDANzU0YXTXnkDaXB7zcwzpU
         gzCbFg8gnHqxG6sqIiPq+p+duHlA7Hnv+Zx7VDWdARyiL2wxNzAtjfBp7Hd+UeiGfO//
         mAeMLnLaL13029z5truMPJWYNKDURfEh2+kHgFyj/VsV4rGleKzU+sAo6POcICVq1ttz
         4WDnYpGy/Zc0nh0IQk4/+JeIAViDce+Xyj0xAGARBkUd/HEPeWw1nJ57zdmNVjDiVkZs
         ASeX5Hvvr/hOm8iV0VkWCUo5VJPFlwZPg+CIFFVBv7lekCtXb32ZMFvhWyecK3cEdpJx
         gGzg==
X-Gm-Message-State: AOAM531uEUUxY65Ap2O9RP9tQYCoX7GYz+7UjIi+5qtDpxdd7tX5Ewsv
        znMJQC423h9ff7LGFfObe5+IiaoPpxAyojvKQCIzzx53
X-Google-Smtp-Source: ABdhPJxMQIBJpxpgavBy/7zp313jUilaitn2ZowERkH7+PMctb0P6tC4UkCsslEq2fDpwBKkLGVLzj4Jhv30fVK6WHY=
X-Received: by 2002:a02:a78f:: with SMTP id e15mr34091160jaj.36.1594070123945;
 Mon, 06 Jul 2020 14:15:23 -0700 (PDT)
MIME-Version: 1.0
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 6 Jul 2020 15:15:13 -0600
Message-ID: <CANLsYkz2hQEuN6xLZ1OYJND1MHJQEdGe9vnceHbuKSinn6U6pw@mail.gmail.com>
Subject: RPMSG subsystem improvement and extensions
To:     linux-remoteproc <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Good day to all,

There has been a flurry of RPMSG related patchset on the
linux-remoteproc mailing list in the last couple of months.  Some have
enhanced the existing rpmsg_char driver while others have created a
new character interface or simply used RPMSG to convey HW protocols.
Some have been merged while others are still being discussed and even
more, I am sure, are just about to be sent out for review.

The above was brought forward during the last OpenAMP remoteproc
meeting and there is a general consensus that we need to come together
as users of a common subsystem to find solutions that are generic
rather than vendor centric.  That way we can keep the design of the
RPMSG subsystem simple, extensible and easy to maintain.

The next OpenAMP meeting will be devoted to RPMSG and the various
extensions currently being reviewed.  I invite people to get back to
me with specific items to discuss.  Depending on the interest and the
amount of topics we may have to spread the conversation over more than
one meeting.  Needless to say that participation in the meeting will
definitely speed up patch reviews.

Best regards,
Mathieu
