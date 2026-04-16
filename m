Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89CB271464
	for <linux-remoteproc@vger.kernel.org>; Thu, 16 Apr 2026 04:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776313425; cv=none; b=QYWoUUVXD7NGiffczqyuu5uHX9+OIcj3kYgpKFOK4//RsJvhZsiDbUOpsAUcZpRNrKoi/bFhkUqPXXkDZI2ohOB28hvTmMA14y6zaKfoj7SpHdnFXfoVd0ULMUPcGmKueX0OrJUlg9d/UWcLyy4/VT3vPe0C6NXbNZxwMOxu1Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776313425; c=relaxed/simple;
	bh=KklDyCzAUojn295n1umdDqC4Zpnz79oLMe6byV+t8WE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a2q65tFYcAqSYQq4bAtNUKVK6rOUSDNeii1t7COfK3d/i5bZ75RqnXUPMfuQFBgAxIGCXW0osxKKuYEFMVd2JEFYkyQ2Nlw0ksePhG+JdRrBaRet2jlX7573P2vux8HeuI7HVn7xkc7BTSCHW+Mz2INT/ZLWNgeEdS6mrEKc9v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWRd+HbR; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWRd+HbR"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-506aa685d62so38944751cf.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Apr 2026 21:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776313422; x=1776918222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LMrjxuZ4kKLfqzieZnU36oY2oOClSqjVbtmlgd6Ky5I=;
        b=JWRd+HbR8h6KwC5zbDONKRDiVdkjGKsDFLgPPHh7AizkRXn4L66tdvwYuOrJNn+OeB
         PwTNxtOhciY8OS0mJXqRjRTzk0AGtqpZXms3ZkrO8w61GHN2e0hLzYClY0wIbnQrjok+
         m+AyiBCxJr5yE87jMtOj8xWBBkochVFAfXs/3MKAwhWEd4A309ccdgDY9tuWEUCOtmtf
         vtICp0jdfR5cNFDLt1yBHm7RUoKH2VOyzUilQKxso1PK4L+fGKD2yFHDEC+WqjPoRJZJ
         Ue0Xik2xrIVirCfKif8KElZD6wv93hIMPwXwMi1VV3bryvOjSoWJ9jkDneWQGzg6PZC2
         mh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776313422; x=1776918222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMrjxuZ4kKLfqzieZnU36oY2oOClSqjVbtmlgd6Ky5I=;
        b=i43NNjuX/zBJppZ4R84rgV4QQvIRVGFEsQx/eSa256eySznRmENOdEU0qBikudlwN4
         7e+1Hq3Sz1NstzjEseZ3mNnoOuKDzSpzJOzPTqi3kTk6MAON9jPw4ixcqXMtsxW+E6lR
         VT3nga2m3REOHockJQMhSnGoy2p5nNWzeTQm8+M02K8pWfsxFHW+dbc/gETf5K59n/h/
         XedVtfNCiCrwzFHsZg4iojug/6DBunxAbHZVJ04ZfskoNQBc7olZAweKxP67J/USekJl
         ANMNwsliqcKAvIj+mMqO8umOggC/nX0qpsM1NkVxFJHZ2t+K1SujY9829sERRPyiN7pk
         7TmQ==
X-Gm-Message-State: AOJu0Yw9DSxFlJdyYf44CjMh6xmy3DswpYBZATW9hb3WG8C2BShewcES
	kPXDcb5QThGZ2snBngCltBkojzxx3GdXaeYx97l5yDtJ/FXn6A51h00y
X-Gm-Gg: AeBDiev2fj0EYkjIF8Prb5g4PQpwsb3eiOUq8gVD4yK0RC6su6pugmoUWw3bwKsYQza
	oc3O6g/kkzm7+L6FbjdGzD60J8x2Q2g+MoiUMs5OWMW2S19Zx1UZVZ+/9Xs2zIMuwMYa1VqPsNr
	1XvpwI6ZItoHl88G6I6EMHct8GkJnqyOWGnmSceHuivc61z9NoXQNBEYGQ9p9sjc3SEM+jktVIc
	o7VJP9fVlPaeIAg+UEqNy3fcHkRTzgEExTTwIdjoWEIs/5d2ShOwm9ox7EbznBFLuS8bCdOKsSh
	JsVifZXYQ+l74vRcYui0XBzc3Lz+XNGFMajxtp2HU9ZrGPszIDqrdh5I4D6+g92axhR90AY4+qL
	ve+++9FwNEE+6q+lh6c/VpVGa1NzDF6sAbEKkxhGnhBB0OQXLiTN5hZLEWuYi+X1oHFhUjHfxf8
	BHxFQinM3N2W4UL4JM2mtBNrXtUHM/1lJZnwnbDoFICuohr0pR7l15GS5NFw==
X-Received: by 2002:a05:622a:145:b0:50d:83a4:2995 with SMTP id d75a77b69052e-50dd5ada0e5mr385385541cf.21.1776313422423;
        Wed, 15 Apr 2026 21:23:42 -0700 (PDT)
Received: from localhost.localdomain ([165.85.38.17])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e1af9c106sm33161751cf.14.2026.04.15.21.23.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 15 Apr 2026 21:23:41 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] rpmsg: char: fix use-after-free on probe error path
Date: Thu, 16 Apr 2026 00:23:38 -0400
Message-ID: <20260416042338.10146-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rpmsg_chrdev_probe() stores the newly allocated eptdev in the default
endpoint's priv pointer before calling rpmsg_chrdev_eptdev_add(). If
rpmsg_chrdev_eptdev_add() then fails, its error path frees eptdev while
the default endpoint may still dispatch inbound messages through
rpmsg_ept_cb(), leaving the callback with a dangling priv pointer.

Avoid publishing eptdev through the default endpoint until
rpmsg_chrdev_eptdev_add() succeeds. Any message that arrives before the
priv is published should be ignored, so make rpmsg_ept_cb() return
success when priv is NULL.

Fixes: bc69d10665690 ("rpmsg: char: Introduce the "rpmsg-raw" channel")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/rpmsg/rpmsg_char.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index ca9cf8858a5ef..549a24b70884d 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -11,6 +11,7 @@
  * was based on TI & Google OMX rpmsg driver.
  */
 
+#include "asm-generic/rwonce.h"
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
 
 #include <linux/cdev.h>
@@ -104,6 +105,9 @@ static int rpmsg_ept_cb(struct rpmsg_device *rpdev, void *buf, int len,
 	struct rpmsg_eptdev *eptdev = priv;
 	struct sk_buff *skb;
 
+	if (!eptdev)
+		return 0;
+
 	skb = alloc_skb(len, GFP_ATOMIC);
 	if (!skb)
 		return -ENOMEM;
@@ -490,6 +494,7 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
 	struct rpmsg_channel_info chinfo;
 	struct rpmsg_eptdev *eptdev;
 	struct device *dev = &rpdev->dev;
+	int ret;
 
 	memcpy(chinfo.name, rpdev->id.name, RPMSG_NAME_SIZE);
 	chinfo.src = rpdev->src;
@@ -502,13 +507,17 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
 	/* Set the default_ept to the rpmsg device endpoint */
 	eptdev->default_ept = rpdev->ept;
 
+	ret = rpmsg_chrdev_eptdev_add(eptdev, chinfo);
+
+	if (ret)
+		return ret;
 	/*
 	 * The rpmsg_ept_cb uses *priv parameter to get its rpmsg_eptdev context.
-	 * Storedit in default_ept *priv field.
+	 * Stored it in default_ept *priv field.
 	 */
 	eptdev->default_ept->priv = eptdev;
 
-	return rpmsg_chrdev_eptdev_add(eptdev, chinfo);
+	return 0;
 }
 
 static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
-- 
2.50.1 (Apple Git-155)

