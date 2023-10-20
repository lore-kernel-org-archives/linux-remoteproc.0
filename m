Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B84EAC001DF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Oct 2023 19:57:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbjJTT5H (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 20 Oct 2023 15:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbjJTT5G (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 20 Oct 2023 15:57:06 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E8ECD65
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Oct 2023 12:57:02 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d9a538026d1so1517452276.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Oct 2023 12:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697831821; x=1698436621; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wsBMquxJoi1c1zfpSSx0JVGoWkpT5IvUUb/lk/u2m3c=;
        b=G/vrYWot0Ap1j5C/qKfbDn+3NuWsLdvK0/N6bpS82BQ0MH7QCleJi12x4BysFkJ35J
         /J+fy1tzOapgz+UMdHG07x5HcuJgXBsEG55b4kffnv6YWeGIUkByngLuBTNy3v6L1lyO
         csVY4hCt2HuhBPtSHUag0s1dp0ADtzTqaEXY4nBERC4rv8Xc5oslw8dJWvaF8Zh07NOC
         oYykc7cqztFqc5RP4WmKy3679z+U50UGaDLsl1kItPgBdcMJ23yWm0JQaoP6P3cTQZXB
         LQ0e1wubXqsdiwcmg3rwy8RopO4jEJ9LmAkglIFRuYP0BysH3M3nlVC+T0rbQkgW2QtM
         f8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697831821; x=1698436621;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wsBMquxJoi1c1zfpSSx0JVGoWkpT5IvUUb/lk/u2m3c=;
        b=F9flyjHMR45r24piWmsHL9/vFSkXKzJ/kSzRszew9KjFgyZaVnUrG26rEbTWQKDa4l
         HTjy+q7ZL5fj29zDIsXtc0N9SLKmnPk659pMgI2ze2FEUCl/NOk0a/DjtTUZnVKDi3ML
         GZp/dUE4BXPfTc2z0ap/DM+fwRTaLFLK7To/EQ5pNgTAioF9ILA49qvCSiYrkln08FYL
         mpHhc1nOmfuyaEgsZzfN2U/D8mL+XHU3N7aVTLbnunxG6WRxtjwzOMRfBLpFQhu+vsz4
         FLJZ0KgxGaz7J1OeMG6JP5Asn/4pQ/Va64RjGaoCcYMzm9vy5UZZAPmHAie+RkEiddan
         kflw==
X-Gm-Message-State: AOJu0YxLXk75UavvdACl4s+nWSYLqagjNwmwsM8DpOAYKpUvDI29bnhj
        +OcsDbl5Y/F7X4bhGJOvNKAg3EDwhDWWOPzJmw==
X-Google-Smtp-Source: AGHT+IFrR5weHYnJhXHl8/JRt5e8qQi0VlpIGDVGdSatvyjTGJkvEfVcFkmPQdAfE/uzJYFihYcWQwz7QbI5gJEhtw==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:c5cf:0:b0:d9c:a498:c1ef with SMTP
 id v198-20020a25c5cf000000b00d9ca498c1efmr57226ybe.9.1697831821508; Fri, 20
 Oct 2023 12:57:01 -0700 (PDT)
Date:   Fri, 20 Oct 2023 19:56:59 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIrbMmUC/yWNwQqDMBAFf0X23IWYIGJ/pUgJ8dXuwRh2RVrEf
 2+ol4G5zBxkUIHRvTlIsYvJmqu0t4bSO+YZLFN18s6H1nnHtmlO5cuTyg411rLYfPGZVgUnRvC IfRhi6DuqoaJ4yec/eYzn+QNaVw6GdAAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1697831820; l=2022;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=xbKvdfML9Lhch2EvPasPnGLhNiINuxHk8T8T1a03niU=; b=VN3iQrEIlCAFm02G2atoU3NZxN/Tsd8NY36yuCIPB9X7iXIHpap9Hd0s9G3zCWE+K8LLjH517
 6D7jh0mioyKCAZFt28Q+rD8EfJYtBJnDYNJPlagbe1/1tVg7JodQ6MT
X-Mailer: b4 0.12.3
Message-ID: <20231020-strncpy-drivers-rpmsg-rpmsg_core-c-v1-1-a86b7930c1cf@google.com>
Subject: [PATCH] rpmsg: core: replace deprecated strncpy with strscpy
From:   Justin Stitt <justinstitt@google.com>
To:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

strncpy() is deprecated for use on NUL-terminated destination strings
[1] and as such we should prefer more robust and less ambiguous string
interfaces.

We expect chinfo.name to be NUL-terminated based on its usage with
strncmp():

rpmsg_core.c:
389: if (strncmp(chinfo->name, rpdev->id.name, RPMSG_NAME_SIZE))

Moreover, NUL-padding is not required as chinfo has stack default
initialized all fields to zero:

rpmsg_core.c:
539: struct rpmsg_channel_info chinfo = {};

Considering the above, a suitable replacement is `strscpy` [2] due to
the fact that it guarantees NUL-termination on the destination buffer
without unnecessarily NUL-padding.

Also, favor the more idiomatic strscpy() usage of:
(dest, src, sizeof(dest)).

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
Similar-to: https://lore.kernel.org/all/20231018-strncpy-drivers-net-wwan-rpmsg_wwan_ctrl-c-v1-1-4e343270373a@google.com/
---
Note: build-tested only.

Found with: $ rg "strncpy\("
---
 drivers/rpmsg/rpmsg_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 32b550c91d9f..8abc7d022ff7 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -545,7 +545,7 @@ static int rpmsg_dev_probe(struct device *dev)
 		goto out;
 
 	if (rpdrv->callback) {
-		strncpy(chinfo.name, rpdev->id.name, RPMSG_NAME_SIZE);
+		strscpy(chinfo.name, rpdev->id.name, sizeof(chinfo.name));
 		chinfo.src = rpdev->src;
 		chinfo.dst = RPMSG_ADDR_ANY;
 

---
base-commit: bb55d7f7f7445abcc8db50e6a65d4315e79f75c7
change-id: 20231020-strncpy-drivers-rpmsg-rpmsg_core-c-e32ea739a375

Best regards,
--
Justin Stitt <justinstitt@google.com>

