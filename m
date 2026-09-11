Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B988229B76C
	for <linux-remoteproc@vger.kernel.org>; Fri, 11 Sep 2026 03:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789096225; cv=none; b=T+NrratvY8G3OmhokjL+JXMGyPgnwt3Gf9goVP5rwphyX+kbVjvs8x6k4ieX4UX3Zz9DxiZBq3umnAuItySiP5y+kvhN6GmJ9vrecKlTa2tcUFjsXRfJ2z9ZZ26j8lYQoXNAm4sW+hxVGU9sJlJXpd2xc4whZljPnnAqDiQ722Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789096225; c=relaxed/simple;
	bh=Lhtai34JnNJX35WDokE40hIm/9HligBsTA8PHOKgR2c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=odDiiugfy3gI0drrkgwUC31uo4Ts8XamffcZbaPYm4MdKv02G8wTpMYJRs/OphXtyXZt60CA8201WRlycZjPsd2kgG2waSy+LWhUk/1lv5O3pIeB3P31fzMpJi4G29InAtP5BNibIT8vtkBmmtw21VcFTz5MIkugn8b+CLvSIig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6HOTPjk; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6HOTPjk"
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-398e10200a6so226077a91.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Sep 2026 20:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789096223; x=1789701023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dtc34+Z5/QntunTf9WdL8o2+F8D64gPTWfEUx32hdlc=;
        b=j6HOTPjkjnZ89MDIxUspp95jKxuIqR5GLuBVozFa+1SwbnXwDS/UsxUzmqse/jDMbY
         rrk6mmH4POov4eQSRDxTKhDM4dkK1KfDb7POIocq50lizmWvmyIl5EKtJvsrKhE7ct/D
         xjboEZOeOMSpPSM7N20dxqV1pUamkUF7JFUBHckJ2dYVHGwTnDOSA+LPvQ49s1tpWmQt
         2IZtE1XMEowp4XM+wyDOp8MgOY9+W1+Hj5eT8uxekb6bUUqWAVvmFuBpsKI2JrBbRlvK
         9SzVLn1FIU2OwqpgTMHLXYUQIdUgcaPmqpRbTaITLie7mZnuXxB8dNuRuuEMjzKrJ6YD
         ZGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789096223; x=1789701023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dtc34+Z5/QntunTf9WdL8o2+F8D64gPTWfEUx32hdlc=;
        b=fzk5tVrsa3gZ2PRrjNbsHHiVpkCcZ5ABvw7ej6R9DZjvfOm7vIPgywZwFz+qLIR9mi
         +dS4n/NSc+Ht6Pam4QzeYaNyf2WnU0XRQurqwoGLE5bjNwPS3SWjhuXd3JAVYwvw0tLk
         /cFb6RmZNBBgQ2bGS9YN1scOgCKxRN+HRs0QjyBvfxMOw9OoRPUvokIlwI+coHMl7f49
         OM68ZHoGQ45cAWU1ogD3cUBZBHt5zyxWaQEIuqHCrgy0nl+7wC8+VtFB9QHFQiirYN86
         mbcM9DoBAzGlQjMG3bBLzKhojuMyqkc0WB5LSndPQtCfkqfm7wrTlg3OSE73yi87aVbG
         7opA==
X-Forwarded-Encrypted: i=1; AKwUvBwR9giSOqUV9Kj+yDvHQKYcDH1XJEFTtVpZLjO1EDaVckg/JdUErkZ84ONra4fLImoYD3hgstdrmpa62m+6AJ24@vger.kernel.org
X-Gm-Message-State: AFuF++lJ1DtFoZqKN7nDWiu4O332bB/gSqMqqZe7PMQYfDaioSrucUXL
	e3BNcRmqBzgh/U9SV0XCohje3ulARLqRlnGYRBBHe/rS5lRou7VkWKEd
X-Gm-Gg: AYBFou1FbKcBnT3TLV/Lze+UkWUks1WC30h1ycVLWSg/TJCXeTzN79YLlvkmTv1ql7L
	JuAEHz2fwOjyOLvram8Fgsm78OL7GjKbgJJTO/DVuWz5DbmoaPuK6soRCudFM5mOmY67ubbfP/h
	iVsZQy+nAmwFf79aSpjY9UrgXYAwcfMBz8ZuWnxe8Q3zEEv1xZbJYUGCl63/5JCR4juLUfqBlW4
	6bKNuPAJV4RKVP1rzbNE90rNdcKAuwbbEfjzBBpYmWyGLiS5EpV0Q0kSBpg3XyuMbxBzza1zX82
	D2xAnJ1UcMmqp5gFUALMElG5rAm99ApBZ55R8az9ccbxlnvahaiFWCg1nBkIM2tcEgrwVBlt/89
	MLOj/eqlC5mg5dHkMTlm1pWSq9unjyrrEVj8w/hyWaJrnkHcemff0CPHXjspSIyiFmGXpPeeVNI
	U2bvQpkppHFSt0pE7VAzcbrCLwIJRKxpKL6Vu1GVQo02hT1Gvv18PrjDXWS0zzyfqMluFZkCRvs
	8+Px9jkCIr1FBNCbdOa
X-Received: by 2002:a17:90b:5287:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39d9c22e224mr3463607a91.20.1789096222067;
        Thu, 10 Sep 2026 20:10:22 -0700 (PDT)
Received: from embedsky001.tail6d6b2f.ts.net ([183.34.211.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9959ac65sm1981207a91.16.2026.09.10.20.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 20:10:21 -0700 (PDT)
From: Yonghao Zhang <hyz3367@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: rishabhb@codeaurora.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yonghao Zhang <hyz3367@gmail.com>
Subject: [PATCH] remoteproc: sysfs: Fix stale coredump attribute documentation
Date: Fri, 11 Sep 2026 11:09:44 +0800
Message-Id: <20260911030944.1645477-1-hyz3367@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The documentation of the 'coredump' sysfs entry still advertises a
"default" configuration option and describes it as the default value
of the entry.  Both date back to before the option was renamed to
"enabled" and the default configuration was changed to "disabled".

Update the comment to describe the three options the store callback
actually accepts, "disabled", "enabled" and "inline", along with the
real default value, and fix the coredump_show() comment which wrongly
claims the configuration is exposed via debugfs.

Fixes: bf41a0910cb2 ("remoteproc: Change default dump configuration to "disabled"")
Assisted-by: Claude-Code:glm-5.3
Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
---
 drivers/remoteproc/remoteproc_sysfs.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 925b0cdbe577..c37736ff4acc 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -76,7 +76,7 @@ static const char * const rproc_coredump_str[] = {
 	[RPROC_COREDUMP_INLINE]		= "inline",
 };
 
-/* Expose the current coredump configuration via debugfs */
+/* Expose the current coredump configuration via sysfs */
 static ssize_t coredump_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
@@ -87,14 +87,15 @@ static ssize_t coredump_show(struct device *dev,
 
 /*
  * By writing to the 'coredump' sysfs entry, we control the behavior of the
- * coredump mechanism dynamically. The default value of this entry is "default".
+ * coredump mechanism dynamically. The default value of this entry is
+ * "disabled".
  *
  * The 'coredump' sysfs entry supports these commands:
  *
  * disabled:	This is the default coredump mechanism. Recovery will proceed
  *		without collecting any dump.
  *
- * default:	When the remoteproc crashes the entire coredump will be
+ * enabled:	When the remoteproc crashes the entire coredump will be
  *		copied to a separate buffer and exposed to userspace.
  *
  * inline:	The coredump will not be copied to a separate buffer and the
-- 
2.34.1

