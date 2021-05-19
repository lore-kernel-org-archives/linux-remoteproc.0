Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD38C433ED
	for <linux-remoteproc@archiver.kernel.org>; Wed, 19 May 2021 23:44:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A04826109F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 19 May 2021 23:44:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhESXpq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 19 May 2021 19:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbhESXpm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 19 May 2021 19:45:42 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6553AC06175F
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 May 2021 16:44:22 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id e14so13653479ils.12
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 May 2021 16:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jv6Sw1V79WB30glKJR0nl+lR8QaC1yMGOJy0bSM1IOk=;
        b=xso1mlTcQ9Dv14e3OE+DJYqggXBIjPgXN6xmP/LaoKgJVJgbLwxNg8InxI4yyoMMxS
         yO+H72FjhZb8xhR38gAW9MS+/5Euj50lZbKowVrDLGmJwxVlHgWWCS7rdtzgZ5TUE/mC
         80J6Fq7KvYybfI4CH+JkXJT8taWwgb/ZBWnwvg6RyFGttpmz+bvaCO1zxDLOd+osVnRK
         sSRZqM7fi24pGf9p+CEi7x1mOt+2sFtU+OHr3sUuEIUROuq4dhh9xLzhj9X7u0omjqu3
         kj6I789m/lwcY4yMuThGHTlWybkvxydRXrLLCgv+tPYJOZ+ldPC6+na/xsEYpoW7JqT6
         LinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jv6Sw1V79WB30glKJR0nl+lR8QaC1yMGOJy0bSM1IOk=;
        b=pNK5IRo3viahyNmJrOFye3eF4IIcQnvql4C23mbTo2LgHHEnSsoWFkwkfQ1TfPqDmA
         NuRqJAjQRBH/YyfewdsvgPZ6J3NQk8/AZTYFtEliPB4hJJWY2OQRoVENUgHmQEaxWWEn
         dLWih6UZvUB96CM94DeS9lpLkHhXWjp/x/+Pn/dU8r8tL1hb0HKncvAbo4EaoluIbDzj
         GFJX5qCo00xJ3kxwow4/aQDgQ43T6t96DfveC0KOQbr4C+39Nc10trGSyvfwObZ1tho/
         E9fii7rZEnv4z72uuOIFbEtBeVkEyabw7Dg7Q1URGOLTvaWskGqeUDh2Fh0yyesW8avl
         3qow==
X-Gm-Message-State: AOAM532iFsaefYtN8iVRPLq4O97uWcGw/4BleZKi37QybvPHEU51EDrH
        70Gec0yRKVizxWh8l6Xkc7UM0w==
X-Google-Smtp-Source: ABdhPJyeXrPCY/hm4zZQqBWVIYv7zfFq0YrOehJN0kGa+hS4iPOLH9Ddqzn7NqV1gKmuJ/FkYYAY2A==
X-Received: by 2002:a05:6e02:1348:: with SMTP id k8mr1826393ilr.104.1621467861753;
        Wed, 19 May 2021 16:44:21 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id x13sm945415ilo.11.2021.05.19.16.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 16:44:21 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] remoteproc: avoid notification when suspended
Date:   Wed, 19 May 2021 18:44:17 -0500
Message-Id: <20210519234418.1196387-1-elder@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

I added a cover page for this single patch to provide a little more
explanation about testing.

I have verified that, when this patch is applied, the IPA driver
receives the desired crash notification after the modem has crashed.
It recovers properly, and functions correctly following the crash.

However I have not tested the specific scenario it is intended to
fix; that is, I have not verified that the crash notification is
delayed if the crash occurs while the IPA driver is suspended.  If I
had a reliable way to do this I would have done so, but I do not.
I can only argue that it *should* work, based on the way the
freezable system workqueue is designed.

My biggest concern about this change is that I don't understand
other remoteproc users well enough to know what impact this change
would have on them.  So I am relying on review (and testing if
possible!) to evaluate that.

And finally, while this is a very simple (one line) change, if there
are other suggestions I'd like to hear them.

					-Alex

Alex Elder (1):
  remoteproc: use freezable workqueue for crash notifications

 drivers/remoteproc/remoteproc_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.27.0


