Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D80246782;
	Thu, 19 Jun 2025 19:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750359994; cv=none; b=DxHji3NI35kVT32ginb2+l396kEPhvFkcu+/q9Wyx4VMTnWsdQAdcdl7GA49xnsHewok6ivoLnrvtVJ1paf2fLbOH65yDZ+W83GZsgEd16evOuUIt4ofSeXNbgL6ZbdROG/9FU59uRLbnxf5ibJh7wAnioFYM8GNiftQByXX+cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750359994; c=relaxed/simple;
	bh=pWrRyIR3c/jGaQ5ztFFvtyFD7V4n3d7DsM0LgMpA6xk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nOq6FXRuegXcSI5YslAGFe8SnwUtcCW/zcllKT+2fllck2NPImaJ8a8/nTe8arJw/GF9bVxgfD1m7fb2OZv7QlY+U7J7kwd+vxnN/DAPFDgyiEtlvZmhM3uHYOdtMQ24R6IanX3hM18+l8tekwpy5Sm4AR2nwDjRsdIogXr5mKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TbX4OAlJ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TbX4OAlJ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-23636167b30so10435595ad.1;
        Thu, 19 Jun 2025 12:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750359992; x=1750964792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Fk3RNoWXeQpPpJ9B1JjoLdl4QpO3+CAMB7d8/a+ynM=;
        b=TbX4OAlJAjxkQiaZVRd5uVWAgvD7WTz5droIiG94/jJRJ0aHEdcYE1u3iCHfk6wJJt
         l8sZ0flJWdFi6pDnh0TqKoINiTTTYliJaPPRtuV3bsw8PoHVG9mNoIKCUU+lpbYonE2s
         eoHkE5psnpu0IS3WdLSqUmKOhWW6xyl4NEFwtKwDNSWtOPr0/CUXnqOTC7WfcMx0MBzg
         ZFPcDsasucITVGFU5Lybz9j0v0Xi39qIhZbTBR2A34+3vSdtP9ra7yyc65Bvh195PL8V
         HDL9P80IOsGCHY2UIdgb1lno/lagtf9NeshJ3hwYk5cwj0YI8rk601Dy6nxUl7SKLY76
         UWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750359992; x=1750964792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Fk3RNoWXeQpPpJ9B1JjoLdl4QpO3+CAMB7d8/a+ynM=;
        b=gXnTq7DpL6wXvPh2um/W/j6Eo/BtV/XHgeWAwVAwLgCQfK1j36hDqs0ZXpc5aGLhet
         siImdvhYUEzcfyU4QqALiQ1XHa/F5puKjz11DYYRN8bj4eYaYw3iyxKpuoc0N0P2sdyN
         7UZcD6TJm+mTbRmsxtUoHgVUU4nfbWg3cGY9Q5c1EzVHWArOwoaadkE+sohUW92xke4Z
         vua2ocS0f5A0rAuf9iE+D8F76S5UEC10MImpC8bTfqtrUorAuP+RlTqdZHrPP+7QrD2y
         DlyytfXQvOomVGemInQOKVHMAE/16oot8MC5kQQpElraciaeSMP3ju9u6tQ/Qvw8ZbPf
         7F/w==
X-Forwarded-Encrypted: i=1; AJvYcCUr7dfUfbhQRp62qA/9Oauv3kR/Z99d7IcBmbishNp/0Tej9HWQrYlO1WvFpRCWmzIQ90b3tpYk7MGk/Vg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+MszEfTO7uE8l5ZI6vugRTGMPzk1oFPkITJCElDIQOi3scfJ5
	wX+J7BfwA2dW7kUQ3UnHmkCk9abLy5cbTRky1GoxyFc5OLlwDPdnu6K2
X-Gm-Gg: ASbGnctTJ1n7dISg98msDE/XUj65iFUUh0iaCd+4nd4E8au10LkkgJFgnmiFx+XqYw4
	ir2EIJiLLzAX2yHgU0CHQ/dpBU7K4oTQ9aZ46LPN+VcraYWr0caIuSXGb5UjabBX7WvIsbyV99c
	CRHesheSbHct8tAfEc/Yu5bHlJI3spOT3BjEdT0LCH3Gns3FdgeiBuGCvfKSGtx0ThkaMWRwWwK
	mwL0tBn4Ip/84jhGDHJ8SWPKIQ/9DItz4h/HVHbOWRcagc6f/oixrxaA46A9AEYpf5G5FvnFAP/
	ZvzvPb12NRFac4q9MoW2UB3XNNMcOcMQx58P5CQfaw7qy5nUh0yV3lO7WtVyMXiM
X-Google-Smtp-Source: AGHT+IHV6h3znDAbofaWvHXG4WACS8YCOD+Z42WHRtdx/K0ADMb3fVDvc3FUadmplAUwo1LfHD+Cdw==
X-Received: by 2002:a17:902:ffce:b0:237:d25b:8f07 with SMTP id d9443c01a7336-237d25b8f74mr48241925ad.44.1750359991809;
        Thu, 19 Jun 2025 12:06:31 -0700 (PDT)
Received: from pop-os.. ([2401:4900:1c94:78d8:6120:a4bf:8bbd:d114])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86103c1sm910145ad.105.2025.06.19.12.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 12:06:31 -0700 (PDT)
From: Abhinav Ananthu <abhinav.ogl@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abhinav Ananthu <abhinav.ogl@gmail.com>
Subject: [PATCH]  remoteproc: debugfs: Replace scnprintf() with sysfs_emit()
Date: Fri, 20 Jun 2025 00:34:12 +0530
Message-Id: <20250619190410.5852-1-abhinav.ogl@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I apologize for the mistake in the signed-off email address in the previous patch.

Convert the debugfs show() functions in remoteproc_debugfs.c to use
sysfs_emit() instead of scnprintf(). The sysfs_emit() helper is the
preferred way to format sysfs output as it ensures the output is
properly bounded to PAGE_SIZE and simplifies the code.

This patch addresses three instances of scnprintf() usage in the file.

Signed-off-by: Abhinav Ananthu <abhinav.ogl@gmail.com>
---
 drivers/remoteproc/remoteproc_debugfs.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index b86c1d09c70c..691fd523e0b5 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -46,8 +46,9 @@ static ssize_t rproc_coredump_read(struct file *filp, char __user *userbuf,
 	char buf[20];
 	int len;
 
-	len = scnprintf(buf, sizeof(buf), "%s\n",
-			rproc_coredump_str[rproc->dump_conf]);
+	len = sysfs_emit(buf, "%s\n",
+		rproc_coredump_str[rproc->dump_conf]);
+
 
 	return simple_read_from_buffer(userbuf, count, ppos, buf, len);
 }
@@ -135,7 +136,7 @@ static ssize_t rproc_trace_read(struct file *filp, char __user *userbuf,
 	va = rproc_da_to_va(data->rproc, trace->da, trace->len, NULL);
 
 	if (!va) {
-		len = scnprintf(buf, sizeof(buf), "Trace %s not available\n",
+		len = sysfs_emit(buf, "Trace %s not available\n",
 				trace->name);
 		va = buf;
 	} else {
@@ -160,7 +161,7 @@ static ssize_t rproc_name_read(struct file *filp, char __user *userbuf,
 	char buf[100];
 	int i;
 
-	i = scnprintf(buf, sizeof(buf), "%.98s\n", rproc->name);
+	i = sysfs_emit(buf, "%.98s\n", rproc->name);
 
 	return simple_read_from_buffer(userbuf, count, ppos, buf, i);
 }
-- 
2.34.1

