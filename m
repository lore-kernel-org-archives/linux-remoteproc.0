Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9804CC433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 29 Apr 2022 19:59:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380470AbiD2UDM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 29 Apr 2022 16:03:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378783AbiD2UDL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 29 Apr 2022 16:03:11 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 547B5A8893
        for <linux-remoteproc@vger.kernel.org>; Fri, 29 Apr 2022 12:59:52 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id l7so17402486ejn.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 29 Apr 2022 12:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DC42akUmXSJZIGpq6cvum+SY5AfJqneY0kBWz8FmIG8=;
        b=EVivewMmOEJKk/UPYHu+PQVj2gvbHZVsKVFmVQ0bIzHElYbopxbqW/AbWmbPUthPE9
         dMRNtcNte05BQ0gwR8s4QwVqfCgmb9UZKZxfAqNr+fxkxD421yUQQhKyXOZZl0O4CkEN
         ENGiMO6NZJVJgDgkHTUf915UyQnLaaJHb8hAT7dAry5oG4kkq5DjSRuI9oixrs6K9M9t
         BpvYkhnrLcyzPytugEzm0Hux302iNLZ2iWHOYuF8h98KOoGpHVSJ1Tm3rCFOXekZOztg
         Cg469MXXJCfhuBKi+J6RLYRId84DEHRX8szNWYWd5iQRWW63Kbazc6ZyN1f5myYDA6o2
         ySkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DC42akUmXSJZIGpq6cvum+SY5AfJqneY0kBWz8FmIG8=;
        b=xPwo6r6qDWhHzDjUjhqpn9NfvSKWXWlkcmFdThvKOob0ZcOygtFGd31sGOusGfUWVE
         XwpAbH3mye1jt0kPidVHK7VgIjZ8BAxzfMhuS+2JWY1D+diDkf/40oZXGHlFoU/LQlGg
         +FFd/v94FjHATCWCl2UGgKz3d9fddVAHsLNTxGY4SI+89f8DGUh4Yduf+ICyYd9jSprM
         29Dd1ftZj/IJvEtttz0hC3VjLl2XalMghtICwQlvenxCdhi9mMsU0FY4DTECgrk11JdT
         GnsdCUJWYYbauudHWhbmIdo5+POAMK9BBSYQ+5ENeWWhMk7n40wQExZtSmsvFJhH3oFD
         pagw==
X-Gm-Message-State: AOAM533/yWWHqmkXzkimqnz83CRcREFHvy5v4oEcBdcWEF1lb94oshT8
        SwLIm764WX9oon5w83kiNyAg7Q==
X-Google-Smtp-Source: ABdhPJylbbDDzvgBGDC539LnqDh8umSLmjIuHWum+Gipd4Yb3qRkyXVbD0TpbIL8Aw/QsDUnvWlGyg==
X-Received: by 2002:a17:907:1b02:b0:6ef:ea73:b2ea with SMTP id mp2-20020a1709071b0200b006efea73b2eamr851803ejc.753.1651262390921;
        Fri, 29 Apr 2022 12:59:50 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id en8-20020a17090728c800b006f3ef214de7sm929486ejc.77.2022.04.29.12.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 12:59:50 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] rpmsg: fix after driver_override patchset
Date:   Fri, 29 Apr 2022 21:59:44 +0200
Message-Id: <20220429195946.1061725-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

Marek reported issue introduced by commit in Greg's tree:
2cd402b8fd4 ("rpmsg: Fix kfree() of static memory on setting driver_override")

Therefore this should go via Greg's tree as well.

Marek,
Could you test if it fixes your issue? It worked for my case which used
different RPMSG driver.

Best regards,
Krzysztof

Krzysztof Kozlowski (2):
  rpmsg: Fix calling device_lock() on non-initialized device
  rpmsg: use local 'dev' variable

 drivers/rpmsg/rpmsg_core.c     | 39 ++++++++++++++++++++++++++++------
 drivers/rpmsg/rpmsg_internal.h | 14 +-----------
 drivers/rpmsg/rpmsg_ns.c       | 14 +-----------
 include/linux/rpmsg.h          |  8 +++++++
 4 files changed, 43 insertions(+), 32 deletions(-)

-- 
2.32.0

