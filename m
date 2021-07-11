Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A167C07E9B
	for <linux-remoteproc@archiver.kernel.org>; Sun, 11 Jul 2021 14:55:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E145611AF
	for <linux-remoteproc@archiver.kernel.org>; Sun, 11 Jul 2021 14:55:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233964AbhGKO6J (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 11 Jul 2021 10:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233952AbhGKO6J (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 11 Jul 2021 10:58:09 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A00D5C0613E9
        for <linux-remoteproc@vger.kernel.org>; Sun, 11 Jul 2021 07:55:21 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id o3-20020a17090a6783b0290173ce472b8aso6946pjj.2
        for <linux-remoteproc@vger.kernel.org>; Sun, 11 Jul 2021 07:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c3ykowIwDTRKsInbKYf/ek7DP95JkPgh9oE6DtLLi+A=;
        b=f8oRiz7tCeeeXv/MqXq5OZOEzZswGECCi/HKTpvgEkbG0cllAp+VR+0I4HSYLIxAB+
         24hZbfG6kZ/VSWsE/If4A/XA+e82SHh49PTD47WSoB6zeJWqaPwHUE7eU4Y9Fwj0mgIh
         YmQF1alZ3ON6hCFsBykpcyyGmu8zyYbilzDJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c3ykowIwDTRKsInbKYf/ek7DP95JkPgh9oE6DtLLi+A=;
        b=c8ofGwpIB/Cx6Esxd51ttOtQc9c6BSfWQbINvmATWgKCDJr6e2l+oF7VWGhYh/XlOs
         Z17SnqKKhlWV35QQZ8fSPVdmWGLMl2uDr0Avvo11WH32S3xgZG796Lq92kfw0my87aCz
         Ge9zD8brCzGb06pZKJzhET+UW5OepK+37V0im3ODXvzXrYkDBm7Jfb64Ufm4gxpn7ISj
         RyBWftIafrcS+u619m2fnvYyYDRIhT47LFcnRuc8OdiKRLNkzG38PEc+RvMDsT2C0e7r
         u1drflBNEnHpZOTJVqlQ4svMREfWT+doV3xkIKkbT/ngSiMwKasib0CTfOz817qyMStD
         tdZQ==
X-Gm-Message-State: AOAM530py1vghCKmRp0BLw8bsD+IpyJLcbSd2foLRpBfBrvQUiN2c0zr
        /kBJZI2gYei2pA//zRlJrTanFw==
X-Google-Smtp-Source: ABdhPJzWwSuvGf7jsorlyDuYO0Lb3IQ103oXQCwHaS7V5m6oxgrlvvImbzsl+aKWkIQc8R8vXy4oVw==
X-Received: by 2002:a17:90b:4b52:: with SMTP id mi18mr31807452pjb.37.1626015320918;
        Sun, 11 Jul 2021 07:55:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b4sm10932548pji.52.2021.07.11.07.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 07:55:20 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: [PATCH] rpmsg: glink: Replace strncpy() with strscpy_pad()
Date:   Sun, 11 Jul 2021 07:55:17 -0700
Message-Id: <20210711145517.1434486-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1814; h=from:subject; bh=CGejJDIBWoCTMrdLfdYOlKTt2khst8/bmsGsqzGrjiA=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBg6wZVj+vEe7YcbCfgSji3keoTaHrI/ZHofnZ1HVRt kwNnps2JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYOsGVQAKCRCJcvTf3G3AJjp7D/ 4xOOjTrRSPqTRBymI1eoBS8GYyPpRa2EVxvB8ZW9jVsORyPMd+qrSptl1PBlgEtLrz91zlFDHigp3M Cl4XecxDPkow1jRbAEfCks39EzVxzHMY9gV7fpYG5qIPKFeKciIn4Ou6vwXPFl6E9iPBqm4F8t6yo+ IkCfBrhLyVYo4u4B1Ri8wj6ztXeIIzQNVxEmzxWzh5UcNp4l7IAkoru3ZgFHoE3yfbABsX4Qitw+cz LELsLx3KrcqETDczzGGSdZKT83iChx4H4B/y1xGvK7azhx/1PnCisiui7W8V0D/LswCl8qeTrj3XFB TZfCKs/qRQe60vO6/Se8gJkLnzovkODC9RxeVAkqGpq78fD6QoDryD8F8QoS2xn3AoJz2SiMBV0pPs CoQfmYM4IKYxecE1UxDmzwdup5vtSvb0xVobHYXQt+i9sbpferpFh2pjYPn6I43Gpju1PfUSyXQ2ZD 1NcASe91/pxA/1TD0+ccRSdz3olzulteWAdzMPKVEyU9X5/PEjJ2VZ+diHDzcN0EEPc64XCwBDyrfe ZKGvs1VDZT9hwo4Gy3N8hdikkUEOyjpvJWA+97P1iu0BOdnlCFIS5TwnOnY1zKvkfAMt5rRnKsWVdP MXSFMMpvhblVW8gDISa8TsXX5a7UVzuihmcw5yXT/PxOqiJn51exkx9Tl2SQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The use of strncpy() is considered deprecated for NUL-terminated
strings[1]. Replace strncpy() with strscpy_pad() (as it seems this case
expects the NUL padding to fill the allocation following the flexible
array). This additionally silences a warning seen when building under
-Warray-bounds:

./include/linux/fortify-string.h:38:30: warning: '__builtin_strncpy' offset 24 from the object at '__mptr' is out of the bounds of referenced subobject 'data' with type 'u8[]' {aka 'unsigned char[]'} at offset 24 [-Warray-bounds]
   38 | #define __underlying_strncpy __builtin_strncpy
      |                              ^
./include/linux/fortify-string.h:50:9: note: in expansion of macro '__underlying_strncpy'
   50 |  return __underlying_strncpy(p, q, size);
      |         ^~~~~~~~~~~~~~~~~~~~
drivers/rpmsg/qcom_glink_native.c: In function 'qcom_glink_work':
drivers/rpmsg/qcom_glink_native.c:36:5: note: subobject 'data' declared here
   36 |  u8 data[];
      |     ^~~~

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/rpmsg/qcom_glink_native.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 05533c71b10e..c7b9de655080 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1440,7 +1440,7 @@ static int qcom_glink_rx_open(struct qcom_glink *glink, unsigned int rcid,
 		}
 
 		rpdev->ept = &channel->ept;
-		strncpy(rpdev->id.name, name, RPMSG_NAME_SIZE);
+		strscpy_pad(rpdev->id.name, name, RPMSG_NAME_SIZE);
 		rpdev->src = RPMSG_ADDR_ANY;
 		rpdev->dst = RPMSG_ADDR_ANY;
 		rpdev->ops = &glink_device_ops;
-- 
2.30.2

