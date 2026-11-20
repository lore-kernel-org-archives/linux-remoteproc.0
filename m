Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795154566;
	b=PHgAGfA6kGkhff7/chvYfiSL4LV4utt1Go9vnwzkB+L9dQ4tnCND/I4md+IaIHsXEIFA
	 RCN6KPT9aeqX/+z5Q6qn5rPyHu/IGH0JgXoCC8FAvt+LpCdmmgZY0RHZH2l5B+LhRI/eN
	 tiwrAVhBYI4/KTDx/0q4CDSXxygQuHvsdY8+Eix8JAWf83ZoVYqB/+LuqDv50Ffyu7+K3
	 YCrOrnycOn0+co7vg/Ol2A0kfoclUIWPYhsbxlOZFSDwZQBm85zCNPNe2MlhGE7QbUEbP
	 CfEkuBCwgiWD79xv9Uly3FIl+vBQD6YDrgLtHF6di1R3pWdTuLhCOkfkqFzeHlBikrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795154566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=31xlQVhSaZjv1R+Uf4vk/nus+bOahfJDFRfIitG39V0=;
	b=vCyOjexuWL3XsM5C6b22hlFFGRNzXyakPQL6ozkVAolgHoXnUOZTJnWiQAmJ/HOcUiwL
	 RF3lKZjgoyEmqNEQG2Q6XADju/9X9XuSyxRmVaqW26hBDniqh8/Df3uV3vCQHqPiPlyCJ
	 2n8ffWJbkLR/YHNPlqejFxb6LJ95dsKe7cnYbKyMEemzd2Ai1A7wJS2UkFm5DMRhzoFvA
	 9k/OTPIm/aO8ztHYmy98eKpRPRRShZQ4e1HAgFd8pP4UmKEwdtPzn4rICwtZQAmwvtCF8
	 W8rEyc08VgAZba7ePcn0+RxUmXdx6hOZdOFYyjY1ob2qTtIaiqZ2K+nmKbMyAM0VI3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T9Ip23D8;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6358D606A517
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 06:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6358D606A517
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T9Ip23D8
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-385d8a00598so331761eec.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2026 22:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795154561; x=1795759361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=31xlQVhSaZjv1R+Uf4vk/nus+bOahfJDFRfIitG39V0=;
        b=T9Ip23D8SQdG98yOJLVMYyrqUAg2FpRL1Xp7K6AEsGaR+Y9fhKvblM6s49+inOnSfI
         4EOdeH0RWcOhMijDHNyaD9IdqUaYvJjb8MfEzvNHZM500o7QoxlBresG5/9SlYLmb5sr
         pX02q6QGBTKyoyhdoXyJPaHUSBww10N9dMVPiajlUcriC4mbQz8Z+AMGIQJqFnNofdGM
         OVvuVww5wU48hq+9vkDfcGuLanOSY6feQQ9CWhGdH3McaN1hEbikaB8cvnjkNGgswu4u
         llBfi0i7hLFOAuw3A9xmqj6YdMc4bUmAb5RynQCD+VznGJSBktVjkU21mp8sQLL5PoOh
         BDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795154561; x=1795759361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31xlQVhSaZjv1R+Uf4vk/nus+bOahfJDFRfIitG39V0=;
        b=uOeqe+/wmr45PSfWOh1GHZ+lr/5vY96iSE23ZsI8ICs+5o2vIz0SXZIrIzqCKKg2FP
         LIE9x1tu8GK3uV+M8BFuLOpNTexdvTeR1tdoS3gDcZGnRunb3XPfLG/yk/+t5db4cg+P
         f/ZwP+kWlbvQTd2s3sYB4g98TQt6myn0/IciXp614mlA2U0roziPldyid2xnysI2Wj6q
         FB9g7aLALcuAoRampB4/Lco4vvQnldUTcWwfXO8Fia02hACZNPEWDhvRknRE45hvmT+C
         kB66FDFHDDQ/KfO80oqpSTEOYo3TgZHFL1bTTUlHiXg/LP2VikgAL+Re+v45qsIGpD8X
         RhmQ==
X-Forwarded-Encrypted: i=1; AL+hErHCtwnHK7ll/95OeAtvd4kfTI816mZUKFY9j4fSvD2Pn8Onpx/DlHXmuiIcWP9bmFErpGN9ngXWtPpPtIIQqEjU@vger.kernel.org
X-Gm-Message-State: APuU4Z+mUqAGxWHzTsr/y0+Z7fBLqojUR26Z056W+S3iLnC+FwAsnLRr
	5wu2eQPxazKoaIapsMsxy0XCaJizvUpmnNpvgxH/jrPY5ad9BnLrSAbe
X-Gm-Gg: AZFdTZcHdmC/zZH83vxvtPGwr6lwflT2Nq4cpYjy5X9+LCT/ovvBv4JnFl7Oym2jGzl
	QjHh3nos3smCK62dS0NZlsyzoBdVbHWCKK4gZiIf223iAvHxgwPThBDgPXp2rqHZBY1mJYoGmFF
	0kYVK5SIP22XMbRj+if8TSNcARuodbDwemypPK8PnPf9QyBqOkPZl+aUUsSh8t8K4Zmumq6NyqD
	D2Ol1aPsOabCpnClIrJXJ0bsawn6fBwgOOwkVkzRwWu8xqa/mQw5D+j58wgg371mLrzZI1Y7jnO
	eAHJqHdq2ETo+KQkVpQAdP2D1ppJADQB0ed9eKeO6nntbnXRxqfAB5hiWorM8SUT8YZBTShgNmu
	eYEX8s40nM7C0OdKsl3j5JFuExcp7ZpqkiFY6DtyMdk8qIDSC33JUOjJgzcdiYeQJKWLsRtKtwc
	2WNs6BVjSxiiFSTGj4QL9bjAs7LSxAj4SrXkkPb+JbLqgmbF+IQgfEc1LatYg7+gHFCenG/tVtU
	Y6fbdMOB5SLhaBjmAVl3SYU3Zif3GKOlfxpxakhNuFGq2kR8OU5r2Ya1Ys4fxCQ37ltsN7icnHA
	zlCnGU8n/WxcLhvLFW0FlkosMIgH/pCtDw==
X-Received: by 2002:a05:7300:e9c5:20b0:381:f33d:ed9d with SMTP id 5a478bee46e88-3856fb6a214mr1984582eec.21.1795154560877;
        Thu, 19 Nov 2026 22:02:40 -0800 (PST)
Received: from nevers1dd ([2401:4900:9258:be0f:72a7:6656:e53c:a806])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm4810504eec.26.2026.11.19.22.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 22:02:40 -0800 (PST)
From: Siddharth Karanam <sid9.karanam@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Siddharth Karanam <sid9.karanam@gmail.com>
Subject: [PATCH v3 0/1] remoteproc: k3: Merge ti_sci_dev and ti_sci_proc
Date: Fri, 20 Nov 2026 11:32:30 +0530
Message-ID: <20261120060231.11033-1-sid9.karanam@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The previous version of the patch had a new header ti_sci_dev.h,
that mirrors ti_sci_proc.h in terms of the struct decl and
its helper function structure, with the goal of abstracting
all ti_sci_handle's members like ti_sci_dev_ops from being
invoked directly in the driver code.

Lore link to the v1 patch:
https://lore.kernel.org/all/20260922191453.324983-1-sid9.karanam@gmail.com/

Lore link to the v2 patch:
https://lore.kernel.org/all/20261014103241.3847-1-sid9.karanam@gmail.com/

Upon discussing in the original patch thread, it seemed
better to combine ti_sci_proc.h and ti_sci_dev.h's structs
and merge all their helpers into a single header. That is
what ti_sci_ctrl.h aims to do: It has the union of tsd
(ti_sci_dev) and tsp (ti_sci_proc) and both their helper
functions are prefixed with ti_sci_ctrl_dev and
ti_sci_ctrl_proc respectively.

The goal of the patch (v3) is to maintain a single source of origin
for all ti_sci_dev/proc_ops call sites. Any stray calls
to dev_ops/proc_ops function pointer members in driver code should
eventually be abstracted through this header (ti_sci_ctrl.h).

In the future we can switch to pm runtime calls.

Siddharth Karanam (1):
  remoteproc: k3: Merge ti_sci_dev and ti_sci_proc abstraction

 drivers/remoteproc/ti_k3_common.c         |  21 +--
 drivers/remoteproc/ti_k3_common.h         |   6 +-
 drivers/remoteproc/ti_k3_dsp_remoteproc.c |  25 ++-
 drivers/remoteproc/ti_k3_m4_remoteproc.c  |  23 ++-
 drivers/remoteproc/ti_k3_r5_remoteproc.c  |  66 +++-----
 drivers/remoteproc/ti_sci_ctrl.h          | 184 ++++++++++++++++++++++
 drivers/remoteproc/ti_sci_proc.h          | 130 ---------------
 7 files changed, 239 insertions(+), 216 deletions(-)
 create mode 100644 drivers/remoteproc/ti_sci_ctrl.h
 delete mode 100644 drivers/remoteproc/ti_sci_proc.h

-- 
2.55.0

