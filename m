Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BE12C0F6D
	for <linux-remoteproc@vger.kernel.org>; Tue,  2 Dec 2025 17:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764697812; cv=none; b=btQeq55IFj8vVowL0is0KOuzZim2JdnScXQUGX33LhZo9jXcjiG4RBoadufANY0JuQaLgOFQ+uiFh/mAJOjFI9MYIofL6VVQ6J5Un9KR3H41RDBhDkcLi7PosoaU7t6r2RRROxP/JlPYNuuicmchhCpHALjJatb/nMUGzkIB9Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764697812; c=relaxed/simple;
	bh=fGgGupyGdkiAbJJxOHlB00nj3L0BF35EE8H1fBe8JsI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ASJzRJGChw6VvS5LGz9Wo/0iDfB6YhMpqThDx7px2k/0EvwLp/Ci8kCZ1s2VuOOgtfyVqwIU7rjNHjcSdYE0BfkwwjYXwEkx4AFxOoUX13kvPPBojKN3XFp0MdeUUP5EPWFiSWa2b+Wad2cXycSWvenrtB+XUIUsoNb+OLwRQo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8YYLq0C; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8YYLq0C"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7bf0ad0cb87so6795234b3a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 02 Dec 2025 09:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764697810; x=1765302610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WgAz6fNpn7JpYrJAea4NdVMHK+GyJh0YTa0tvhxNdVs=;
        b=Z8YYLq0CLoc+6wduod4C7NbVvGiCzB919WYxQTVmYkqDdPJrA7pLhhk00TDOSDLSFW
         8Woq/EimnsFFhFhaIYw7xDAiTkwij0UhBF1oQd3oSe4jdFf5ceNBUTCxEyinAwhSzI2d
         NqaDUgxWJUPLuKo8BZOrMQx0GH7pi3hE4lgzoRrnfn2jDZd8jtG+r99vtteVusoGQRJV
         5wysOoID2D2Brv2Y9zTjE+AvMFHQWAsPhhot6RR/TX4RMJTGAr5wG9sn4XeYaew2a++o
         BW1ns1aQHsMKzmxafrKGzAa8ogP3ysm5v4lYmJ6D3gHVaKY1rCdo76/TlDQ+VhipfYF2
         nkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764697810; x=1765302610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgAz6fNpn7JpYrJAea4NdVMHK+GyJh0YTa0tvhxNdVs=;
        b=KvCCSeMHeBjEhr4U9/SQbgoeezyibFHlNLToYYTBIKCS7/mNfsybTdtFQ/iRCxdzBZ
         BSjWtDN7VtOJNzRV+qfCegYY/7gOgIaftYhZqdTLcPbny9rEdchJ6OtbxBg3P+8dYSXi
         K8yntPy1YY6hZTShuFoPrKw/u3M5jyZp5pWT3MFXvf0enFKsgdY7Qm3Gup4KfIdIT1Kj
         SdriIlIEU0PAuS+CEhd9Du31ZtoJP267Kg0ABcMCyTc4zNNfMM+63CzaOzQb/dJTpYIN
         wkc1MntIafnxeZfrDRJgHP5wsujaQXQKZO9vdTag7UVmJOh8YqUp70lwDDQtHXMOsD6a
         YGtw==
X-Gm-Message-State: AOJu0YwZrcxJO4riyNUyesOC55+fFAmnhbsYMTuBi8TzgtvL2f9QP1T9
	H+y3DxDEIau895Hdw5icCNm2n3k9LDyegBXhr85k+4htsYUGCnwCw43X
X-Gm-Gg: ASbGnctcK05L72+6VI9vpgf3hJccTc4zEMG54Sw3SHR3aNKjthdQtxFkJLgevlG362F
	tWLH0amBSiXBW+Jc6VEobDfyJ4LJgL8gCiHHAJRPAmaWTmNc5cLi83i0vErNqEjVAEed+puNkiN
	pRFwgx02VdZk3VofuMTEN/XjQdCOkSmxZqlAQ4skelMADAStF/+fK/7m97XyZE+ZV+/c7S/T8V+
	8Ymer8+bYn7zUAhW7wlM6/9kyymVOQ/F8i+OnFZPoDK3+q2vxEfSvd2m39ImSOsfXF35ptqfI/T
	ulHJL/+5SE0+tVDy6HaQvqLKZHSIw5t3ru1W5tEghHCnNCowkXW5I+cVflHG4qIXIYwmcrKjgf7
	UtIqm3k5C+jM79Kxsyf2SAt0ZVhBLYXF2pPGCDaJ5e+DQNf/4B+MaLRGArnV1JEGMoxBaCURsHJ
	F+hWzVmPVZP1fo5ZULaOL3NiikAM9R/i7HOP+Xk10Pub1YZCKwKT49YUTYXQWPmZB/UVLPwsQhd
	T53Zyxrh0+u4rP0nMFV0r7hKWJpntyA9nck0/caR9J+KFYqq4iJyMnZVSNR
X-Google-Smtp-Source: AGHT+IGa8ZrBi4DESVwwOj/HbcYUlgQEUuY0LmUJKkeDLld+M3KAFoKpoFTN+IjT7Ot0d0aynbO53g==
X-Received: by 2002:a05:6a00:2309:b0:7ab:21ca:a3be with SMTP id d2e1a72fcca58-7df918bba97mr91507b3a.12.1764697809906;
        Tue, 02 Dec 2025 09:50:09 -0800 (PST)
Received: from 2045D.localdomain (191.sub-75-229-198.myvzw.com. [75.229.198.191])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f26f11fsm17487023b3a.50.2025.12.02.09.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 09:50:09 -0800 (PST)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gui-Dong Han <hanguidong02@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] rpmsg: core: fix race in driver_override_show() and use core helper
Date: Wed,  3 Dec 2025 01:49:48 +0800
Message-ID: <20251202174948.12693-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver_override_show function reads the driver_override string
without holding the device_lock. However, the store function modifies
and frees the string while holding the device_lock. This creates a race
condition where the string can be freed by the store function while
being read by the show function, leading to a use-after-free.

To fix this, replace the rpmsg_string_attr macro with explicit show and
store functions. The new driver_override_store uses the standard
driver_set_override helper. Since the introduction of
driver_set_override, the comments in include/linux/rpmsg.h have stated
that this helper must be used to set or clear driver_override, but the
implementation was not updated until now.

Because driver_set_override modifies and frees the string while holding
the device_lock, the new driver_override_show now correctly holds the
device_lock during the read operation to prevent the race.

Additionally, since rpmsg_string_attr has only ever been used for
driver_override, removing the macro simplifies the code.

Fixes: 39e47767ec9b ("rpmsg: Add driver_override device attribute for rpmsg_device")
Cc: stable@vger.kernel.org
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
I verified this with a stress test that continuously writes/reads the
attribute. It triggered KASAN and leaked bytes like a0 f4 81 9f a3 ff ff
(likely kernel pointers). Since driver_override is world-readable (0644),
this allows unprivileged users to leak kernel pointers and bypass KASLR.
Similar races were fixed in other buses (e.g., commits 9561475db680 and
91d44c1afc61). Currently, 9 of 11 buses handle this correctly; this patch
fixes one of the remaining two.
---
 drivers/rpmsg/rpmsg_core.c | 66 ++++++++++++++++----------------------
 1 file changed, 27 insertions(+), 39 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 5d661681a9b6..96964745065b 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -352,50 +352,38 @@ field##_show(struct device *dev,					\
 }									\
 static DEVICE_ATTR_RO(field);
 
-#define rpmsg_string_attr(field, member)				\
-static ssize_t								\
-field##_store(struct device *dev, struct device_attribute *attr,	\
-	      const char *buf, size_t sz)				\
-{									\
-	struct rpmsg_device *rpdev = to_rpmsg_device(dev);		\
-	const char *old;						\
-	char *new;							\
-									\
-	new = kstrndup(buf, sz, GFP_KERNEL);				\
-	if (!new)							\
-		return -ENOMEM;						\
-	new[strcspn(new, "\n")] = '\0';					\
-									\
-	device_lock(dev);						\
-	old = rpdev->member;						\
-	if (strlen(new)) {						\
-		rpdev->member = new;					\
-	} else {							\
-		kfree(new);						\
-		rpdev->member = NULL;					\
-	}								\
-	device_unlock(dev);						\
-									\
-	kfree(old);							\
-									\
-	return sz;							\
-}									\
-static ssize_t								\
-field##_show(struct device *dev,					\
-	     struct device_attribute *attr, char *buf)			\
-{									\
-	struct rpmsg_device *rpdev = to_rpmsg_device(dev);		\
-									\
-	return sprintf(buf, "%s\n", rpdev->member);			\
-}									\
-static DEVICE_ATTR_RW(field)
-
 /* for more info, see Documentation/ABI/testing/sysfs-bus-rpmsg */
 rpmsg_show_attr(name, id.name, "%s\n");
 rpmsg_show_attr(src, src, "0x%x\n");
 rpmsg_show_attr(dst, dst, "0x%x\n");
 rpmsg_show_attr(announce, announce ? "true" : "false", "%s\n");
-rpmsg_string_attr(driver_override, driver_override);
+
+static ssize_t driver_override_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
+	int ret;
+
+	ret = driver_set_override(dev, &rpdev->driver_override, buf, count);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t driver_override_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
+	ssize_t len;
+
+	device_lock(dev);
+	len = sysfs_emit(buf, "%s\n", rpdev->driver_override);
+	device_unlock(dev);
+	return len;
+}
+static DEVICE_ATTR_RW(driver_override);
 
 static ssize_t modalias_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
-- 
2.43.0

