Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793437706;
	b=GcNKXAYIojywvvoBatiYU/gV35I1KWjGA3r2Jq/5CVL2YU2WF/3lVCbYnyurkMVzcVM3
	 6Fyou1WerH1n9jvGReFqXeq/ZE2ykOL2SzqJv8ZhjIdgM1+ySNM4aIxaPTZaWbolpqBrM
	 j94pB4jkdzRbWaszrVl5bDEKnLdk83hBguSSWmgAt5lzkbdx1sTAqJWg7nw0Tg0aVUGrL
	 kq2ZjO2RS1AR+K2cAhk6HMaYPsg4HvWLT335nl5XS6/LqY/O7JtGgprjL2USKm5Qsa3I8
	 uMzbk7uSFcREVgl7AKg9A1YS4370JrJ31MeRnfqFR70qDftQpXgN6KLWk9+wuVEHi8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793437706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aG7uUgIWZ0oyfHEXG9QJCx6yU4GdFnWFe7KXXLifVuA=;
	b=ue9hkU739mkg9iJOgk2p5TIb59RBuya28pzCkJ6Q9YgcRFPCPNbI2UfKenDI8ZfgwVbT
	 SRSub8TonTKEzs4l9yXT+z70H96iuYtwYsoRvxfY002OlZrRQZRPVUa/UtNAFHfvvMCDz
	 JxHPZBQnH4YLB47EqZGFIXJz4GjzhSXgc0JY+EeE0cM3N5KHbGPrlpIxuNJXU3ZFGpQS6
	 8tgKgZ0xyHJuse9/msbhGs8zOqXvPmzyePH6gL0aBq2xLOCGy3zTOowRXl5nz56NVQ8l1
	 xZes22aqPgNctZYnU3wIH/W/NMSDEKi6LHbKtfttSRvHVkejevsCtyjd5R+knfJejqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vg5vE9eJ;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2DC606A321
	for <linux-remoteproc@vger.kernel.org>; Sat, 31 Oct 2026 09:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E2DC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vg5vE9eJ
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-89f639ba307so560796b3a.3
        for <linux-remoteproc@vger.kernel.org>; Sat, 31 Oct 2026 02:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793437705; x=1794042505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aG7uUgIWZ0oyfHEXG9QJCx6yU4GdFnWFe7KXXLifVuA=;
        b=vg5vE9eJNhVaTMln33GkMcgicuA4inDLsHF5BvImPmEHkyD6jFVW5B3uGrkO1lKCOy
         fkE6Nl86pPiNat/cAwxbPK1mAY0nRI4jH2D+C/ETCc7ZqybzifUFaJf7bM8F7fucQSDT
         /Yrz3uDAK6z7FDHPhaCqOZj+UZG7PK/ptf8XtNQy3EdeOpJxdxJIJ3dQ3IOA9oT1+YrJ
         ErxmzQ1Dcs77K7uuzGdg0ZdLnHS57s600+N9TKEQONeIeW0jSa1cy+6fFFHYwzNsJEMi
         BrU6nsY2nYG9ONNeQyVPhZDcLeNdk+vYJKbagwk0ThAnSaYNVCM3ZFqcKP8ltuqZfB+3
         ++gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793437705; x=1794042505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aG7uUgIWZ0oyfHEXG9QJCx6yU4GdFnWFe7KXXLifVuA=;
        b=o2V028y1KpBh9NkvzhjBmuJgCBxE6rl3RsW14k21TZOewjiHrmQv1wroQEt4VP7fil
         dbmw9vvoxrnpo4Kj/446DVp4+1wWbuDArjGP0ICXWMPM+iOeSco2dwA3RSOVzeA/MMj7
         c1L3fW/l8RkduiNqgLAb6Cw+pd/mA/JWoV7HTCBmmNKT3ZefViO6KMHyafw69VcohyVy
         hohe4S8zCT4A4+x7FIP/kYGqLtv3ypZR8wvl+gve56/oY+Dr0a9rOBay+TAi8lu4EPSe
         trSfVUV5UKclIelwK0puI0ellMxciZxDE+wPUa77TdMoMsDP76fWf88Sevoq6oPy+Bic
         xMzA==
X-Gm-Message-State: AFq9FYIvk73UXQhuAkpzxYhwDPLrGnEsUyrj3uZGkN1EQLiDIFuYBRzI
	GGEAJ81VOh9eKzp/NJLuKQU6Ynjg4T8gy+Y+cLFzhVYE3I9xz5Lkma0J
X-Gm-Gg: AYBFou1nF06eO2+9pRUNxMqZQA5cDeTLChTEqbmivNxh0rWptViJFLYh7rPx8FZ9s7E
	zvM5EamoZ5Y2xu+qH1j7QYzEMgv9em6xHMMUYI515eXDyxjzXWrD3hUxEGIS1mxYfIyCtX0dQtl
	7YpRAVB+bLOphe9YcZ4E2HPLDA9h4G5dQhkFDcjyFkKc1LohMu0ysz4qKqYl4e1A3w82kuD1O0N
	aPqWlC5Mmm8y+0y2Vh/m8W+JNQgSuwjDHTvhKRDOJ2Tp/fhXMlqsxJ+AJzzWdLtN3Z7Wom2C1ns
	lpvwK8YUeOQ5SY/OgeZbVoh0ESVGS9mC97pxtCnxN2C+Grd4rUzNKNIsBwVeecXINs/nVyFViCp
	XRQWvsWnhgbppNnJvu8osBtSK+TAzBdqtRDRyfn4ufo3nCjN2qCUQViBVUz1+pXpzwuSIHjboK7
	S80ztzY/B19ql8Yxiv5nKBSIue5n84OCMYJIqRPIsRa+olyyx5cps/6/ZyMyt3wY/rM7UHFY8zC
	R1IIn/smxOEiaIEfg/kE1jYf9jfYG4wvhVE36mCy4dYz2BcOR3hs9ZGWX2PbMIeAvnmRI/R1/+I
	0V/YktDlTmZCPwg3cWttg0jQlvrEOorflPjej0QoqDM+nC1I2MXCDk9R9czIbWbyVa1eeFYao2J
	cp0ZEa9O4KblUZsX41IzLejfJ8up3EbpAoWbA1LwpwxMKCCCbX49reFIpq6paCac8J+FDg3Bm48
	rYR4QWRj2L7rLrYHR4n16Do/9IxA==
X-Received: by 2002:a17:90b:3d8e:b0:3a8:86b7:ad95 with SMTP id 98e67ed59e1d1-3ae897c5e7emr4019087a91.60.1793437704316;
        Sat, 31 Oct 2026 02:08:24 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.191])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09610f48sm1614184a12.2.2026.10.31.02.08.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 31 Oct 2026 02:08:23 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] rpmsg: char: take ept_lock in the SET_INCOMING_FLOWCONTROL ioctl
Date: Sat, 31 Oct 2026 19:06:50 +1000
Message-ID: <20261031090650.23701-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026100306.68019-1-yuz08559@gmail.com>
References: <20261026100306.68019-1-yuz08559@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rpmsg_eptdev_ioctl() handles RPMSG_SET_INCOMING_FLOWCONTROL by calling
rpmsg_set_flow_control(eptdev->ept, ...) without holding eptdev->ept_lock
and without checking eptdev->ept for NULL. rpmsg_set_flow_control()
dereferences ept->ops, so this is the only eptdev->ept user that does not
honour the ept_lock discipline.

eptdev->ept is torn down under ept_lock: rpmsg_chrdev_eptdev_destroy()
(reached via RPMSG_DESTROY_EPT_IOCTL on a second fd, or when the rpmsg
device is removed) and rpmsg_eptdev_release() both do

	mutex_lock(&eptdev->ept_lock);
	rpmsg_destroy_ept(eptdev->ept);
	eptdev->ept = NULL;
	mutex_unlock(&eptdev->ept_lock);

and rpmsg_destroy_ept() drops the endpoint's last reference and frees it.
A SET_INCOMING_FLOWCONTROL ioctl running concurrently can therefore read
eptdev->ept just as it is freed and dereference ept->ops -> use-after-free
(or a NULL dereference once ept has been cleared).

Fixes: 5550201c0fe2 ("rpmsg: char: Add RPMSG GET/SET FLOWCONTROL IOCTL support")
Cc: stable@vger.kernel.org
Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
v2:
 - Drop the paragraph about the other ept_lock users from the commit
   message (Mathieu).
 - Bail out early when the endpoint is already gone instead of an
   if/else around the call (Mathieu).
v1: https://lore.kernel.org/all/20261026100306.68019-1-yuz08559@gmail.com/
---
 drivers/rpmsg/rpmsg_char.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 550fda2..d8868fa 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -343,7 +343,20 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
 			break;
 		}
 		set = !!arg;
-		ret = rpmsg_set_flow_control(eptdev->ept, set, eptdev->chinfo.dst);
+
+		ret = mutex_lock_interruptible(&eptdev->ept_lock);
+		if (ret)
+			break;
+
+		if (!eptdev->ept) {
+			mutex_unlock(&eptdev->ept_lock);
+			ret = -EPIPE;
+			break;
+		}
+
+		ret = rpmsg_set_flow_control(eptdev->ept, set,
+					     eptdev->chinfo.dst);
+		mutex_unlock(&eptdev->ept_lock);
 		break;
 	case RPMSG_DESTROY_EPT_IOCTL:
 		/* Don't allow to destroy a default endpoint. */
-- 
2.43.0

