Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308089;
	b=CmxwyXxW4V8a2252B0O6TwEe+prf4ktUUa7O//oUYD0VxqSva2a6Avnp6Pr5VKCWlKB1
	 ZftlW+OJswkVddZXOKUe+aqZM3efliPsCqnecCEsKQMKDGn4sfaI+9StRBm/FMvoPkHuD
	 ncs45ywxkRmM0T0gYCOmPIoUEpgWhd31pRfp8mUejDig92LEyQ4W2m3EFaprxWu/jOrMX
	 QLRK84q1KB6YXFksbZ/eI7JPQvEDCGvMQGdrzlPcCHz0JUVzJA15WlXmhR6FoPGtq3Pam
	 p7cbtNkdRYzPjoxOnxkUyEqMljzlAybkl+i65ZI8Mo1jBqS6Wrc7X/3inaal9wdGdSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tepxdS3pjiqx/ESdTVnng/n4oyG1h1s3ol01nQq3JzE=;
	b=ikMjU31J/G+F9H0t00SG8Vvm+3JIeMP0w8Iga1cEcU00fUGKkR15lqh1I2FxJZFf/eFq
	 1jb/kEDpaa15HvCUCcHA5nhS0u6EeN1BcvPg1xUtWcXfk3OneknusKC8qTBYvKzVh9u6R
	 cUZ9eLL7pzqW0U5UVrmR2pboUN0ZyBDLYSGWWcOTc8NuMR80xZKf/7JXjD5xWYKAj+Pf7
	 lOgpaPlvfnFc0lgg94tAQpe2XhcY0qurAHs1xnXw+PXBVnuc1FeYj0K8Ahi+c3mjIt4Na
	 b1rG9Hasj9LQiu15t2FUuz3JOPH3f/2z1V3ZKtAhnAKqjfIvIj8LfxBdCV/yULV+v4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uZityvrN;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA518606A332
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Nov 2026 10:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA518606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uZityvrN
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1931ff67a29so1273562c88.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Nov 2026 02:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308088; x=1794912888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tepxdS3pjiqx/ESdTVnng/n4oyG1h1s3ol01nQq3JzE=;
        b=uZityvrN90qVe8O21VXCg0ewFNCIQ1qJWSu4qHqZ4YY5NPvud9xLlK+OKn3kryPYkx
         jQKuNgfP8qoaOksJYR0kS7grG3VMjx0jEXNL783V1G83Gr8vAlTA7UB/MWixiAByKHJW
         YH6zKfuApBxqw/A4Ze2TBZcCu6tqBJkdv1+UDsQDjhoKkuF7J6+MQL+pbpo24+gqFEKC
         e2E7YR9QxQf+BRaXcoSW5EIjhePbk/AH4kOcWd+DqB3MO92bTdZoPfI+ywfDsWpGYMUT
         KRMDeA+pG0K+vWZrs/zteuA4xCEzduYvOkkvn6ZBl+fXmhUcb5ERLtWS83HzGhDMrQFk
         VxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308088; x=1794912888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tepxdS3pjiqx/ESdTVnng/n4oyG1h1s3ol01nQq3JzE=;
        b=XhRjtLCmP3hycKRN1t0eMi9FtK314ttaDkj2/NSG7lOoDVkaUx+URz/j0DLYcmvQys
         TPE5vzvp9fpO8V9i4vB38h/KWky25yjrEXBaGTdOyzx0FNL4mp1/QLXkLg4dHBPPrseA
         VPonVdCc9qK3NfGhgcTAeQLgO7NXsEMLzllbJq6rbh07FnkUIbh3SahfLieVn9EwkbI1
         GCnh/k+64UwmEM2Ddc//6/M1cf9tbM/Ft6ge4peJB0zQTOBvwKRUzuK0rFvZJxFEjM2m
         mzuUrePdE7rN7hvI0VdZIQADjLJEB9eaJyqUQtu/lf27MNeZvnkRRGeQYQkO2D0xMcEC
         2/DA==
X-Forwarded-Encrypted: i=1; AL+hErHaKJDATPaeECMJxi6dXJnYmTmJe8cNxhetDhjzQ9Qhp3KOH9o9+No/5WfgV5xO+r3dZWNiKSBS2Y5vWbEfgBCz@vger.kernel.org
X-Gm-Message-State: APuU4Z/0/iEBrWYnJS6O/rKniBVvxbVJIKq/xLej1uiy8n2o59h3GZ3M
	o4v8CLI/69f3VW6MpGyuKxCROUStpNb2KywmjX8ZYVKRe0GudyOvChdT
X-Gm-Gg: AYBFou0NiVc9SjwkHEHHQBRLQQVpKWbBuaYaObQP4opraS4TMFJwJX8h32EBb54JHnG
	uRAXgkKa2ARnxTwhzRmMKDGavEJRUeVx7vLQJVDhOA1smekS1GT0EvuLgjScu++6WyBIwokVXkf
	em95jiiLhu+Hq0ER9dSV6l/sngdzSr4yTI3XWsmEwGLFxz3p8ljwUgz+wwVr+AWBUQ8q+btzIg4
	ihMX8dZOQL62FbHVDMGr2mWeNdN/Bt6JNGRvv2nyOz9WuB3eYWw2DJoeK4oPCN6zCfZwxJjC3Md
	MfywRXBK91y+CcO5lPgfwyrPL8qe/DG2Qp/gNC2YapqOgNYT4D791AtMl8t5ShelsooZKQgJgKQ
	eLnypSfzmzdqwws/YE8C5wcLHS6Tctc5CsImf6O1Efggnk5aSDRO8N35vqLQ0V3vQWZvUy6qanv
	efITPgZbb4ZvA8sSj0rJQx4ZG324lrWDVeIuAcDHqT8/kSn4H5GTDfIcAppn922kC6OC7qVkjBL
	KDtL4/JawRHiUEiYxG7KKYDyewysNoBZaSHpCY1CAY2XBe4oKkcN1ZwFQzgaI+kFxpB3JVxMOfl
	PfGL0VSSlvCphG9uX2pRmJA2UQt3DMAPFzcU2y9WXj2LjvW9
X-Received: by 2002:a05:7022:f50a:b0:1b3:a9c6:b293 with SMTP id a92af1059eb24-1b3b6077440mr2856751c88.25.1794308087698;
        Tue, 10 Nov 2026 02:54:47 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm6996923c88.4.2026.11.10.02.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:54:47 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] remoteproc: imx_dsp_rproc: drain the vq work before freeing the mailbox
Date: Tue, 10 Nov 2026 19:54:36 +0900
Message-ID: <20261110105436.2487822-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The mailbox rx callback schedules priv->rproc_work (imx_dsp_rproc_vq_work),
whose handler takes rproc->lock and calls rproc_vq_interrupt(). The work is
never cancelled: imx_dsp_rproc_free_mbox() frees the mailbox channels (which
stops new rx callbacks) but does not drain a work the callback has already
queued.

free_irq()-like teardown of the mailbox does not wait for an already-queued
work item, so a rproc_work still pending when the rproc is torn down runs
after the rproc has been freed and dereferences freed memory (rproc->lock) --
a use-after-free.

Cancel the work in imx_dsp_rproc_free_mbox(), after the channels are freed so
it cannot be re-queued, before the rproc it dereferences is released.

Found by static analysis; not runtime-reproduced (needs an i.MX DSP with a
mailbox message racing teardown).

Fixes: ec0e5549f358 ("remoteproc: imx_dsp_rproc: Add remoteproc driver for DSP on i.MX")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 96d619d..89c72d9 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -642,6 +642,13 @@ static void imx_dsp_rproc_free_mbox(struct imx_dsp_rproc *priv)
 	mbox_free_channel(priv->tx_ch);
 	mbox_free_channel(priv->rx_ch);
 	mbox_free_channel(priv->rxdb_ch);
+
+	/*
+	 * The mailbox rx callback schedules rproc_work; the channels are now
+	 * freed, so no new work can be queued. Drain any pending work before
+	 * the rproc (which the work dereferences) can be freed.
+	 */
+	cancel_work_sync(&priv->rproc_work);
 }

 /**
--
2.43.0
