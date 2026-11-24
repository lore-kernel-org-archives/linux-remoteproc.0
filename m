Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504494;
	b=T2mQJL8uDNIqXSJBSXzeLlTB2cNPqfQ3pWBjrjK/hvXJ6VD09zNMYYaGuy+zyOcGwnoo
	 9lt1EKk2fc7513DygFzX2K5/6TpOPrVNVwZG7coWNuRFlmK6+vQaPqxX0K9nrWOhPqC2H
	 +PRxIMFbCma5v1rmo8miMNKB2yKDmxoKndo4Pp6XM798XFH8LccLCIAndmDN36RiSxBja
	 CzA6TB3nuB7EurXVjsDIsKPgZJ7hWw6srBDcrErjGyREIamZb1YGefpzL0Lki8gu/Ixw2
	 R1FpIMhOXdFyK3WQpqYnj3lIuXSLr3b/tQQTaTCUbNEDwBkutZY1hOVlnBLFn+8vXxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r92WySJltCbzAIQSkhCxDUxd/ppTsO+Gy6IJ0fgBl+I=;
	b=byoWBfqAyefU9Pd8VQ4PuxTysVYVQoFF9j9w6xNKKcnDGfdRAdfIqsK4Z/JbrsYfuvzR
	 3MbhzFNPhsuShkg7b6EdJR5WdUs0QQ2XtE63HnY516bGJm4sWwaw4GuBXndJXcEJtwMu7
	 10rAOIb56r5+5DEBmx9ij9Jvogp/mpqEz+lVNdAbl+H4OulrzPZCRUiepoNIKacqkot7N
	 912kMpIsAQuhODktxI3X1e699onNFNAiCAX7AsNTQRBnyOtkuLhhgwX2BKiVA9Fof/8Kk
	 VHlB86aQx7zBE2T4Nk9D5nLKSW1e9PjtYnrgdjTiE1oRQ0w+LoG3IDkKOKjOwCnaiiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RQOe79FH;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2254E606A334
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 07:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2254E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RQOe79FH
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8c700d6cc0bso2612009b3a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Nov 2026 23:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795504493; x=1796109293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r92WySJltCbzAIQSkhCxDUxd/ppTsO+Gy6IJ0fgBl+I=;
        b=RQOe79FHMOX81GjJpMtYnYPXVbf+elJ5fnF6NYa6DYl81ZKmLKrf60ZN/PxnkilUXF
         v0FArxdhFIHyVMa9HnCRjpY3a+XwsUapCYSsw/hqT9vSOP5HYiU70pCIwPJB1Zhhzn6C
         xo/+/Ck7EIL7pq6cQT8iBIVlhoFOJ8IHVDcx7rcotzXfmJOurZZ0oX5xPdn5MsMdnRBg
         PFgp7KeqJqnu1jryuFzI9jCJ2lqelIFbYDK9ouoWszngql2Uknst0II0dDCmddV+mA42
         2YzgwkXM+lfyfVkQuNHtxGaMplw6PxVkkGXvdD5uMW7dHsIOHNvLF9US2Yb3RUHkpG3y
         Fo3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795504493; x=1796109293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r92WySJltCbzAIQSkhCxDUxd/ppTsO+Gy6IJ0fgBl+I=;
        b=h704aPGaydMZ1IY4ofFDKRupzyH9fNIhF6jLSxxXT38qPQeZHNDiucsp+eZ0TujC3F
         s6nqwbcAjnvpsrix9xNru2OO9m4F8l8Q6EfXe3nQ2TGL8f5amEs78BAc6MK9Z/ML8OQ4
         80R4/QzeXH2JrPr0cLiMNQKe64tIbSvP2cP0Elo3NFicLJeEmXiHbWP7e22zyUaGGUa6
         5HTmKcjb9hh2sHnFYWFEUe0KBSjs16J9oWDlUOen/pheyhtW+DEa7Zl4k4n8ZN5jmSQt
         HWkcXtA9KZz1l0rDYCTrkNV2ItohwrKu4Ro/PTlyiXSWJCT8b3ZLHmhaHb275DlpqstE
         kkqg==
X-Gm-Message-State: APuU4Z93BsqUppyfeH01+k0BtzbYdRHZsS6/ksoh4m4YR+xegRy6TYIJ
	2ZOy3pZbE9hXBYjTqpYEOhKmA8zvHGQWv2izqRWtLUbMZs2DWkty2VLI
X-Gm-Gg: AZFdTZcdECtwUIXlXmOkLJi63ijBJUZ8gs6YH3GNw4bfPcSmWXGqYfd4K+9z69R4LqU
	ii/jkeK1C0sl18nfEhgzDRLX6JxCrqXcWWlbbgx6jnZk6LaBq+PSie0855j83r+sS1wExREkQbL
	KfEtqmNHrsgiocxHrVI3pLr7eJfKPusaF5J9/VHc7yyVOSBq0R2kIOUagyld6fT1UqRh0Aen2S8
	4RuELjNtEs3oFKF9di2ALvu+KzaoG8dSh+hK84kgJoDVYQKCi0KzMSO7HUaQLWNY83qjKBPR+9E
	ZzZf5/M4WUsHi4vfnBafL77mxpmsQAXR4kSn8xluL3O+VhI80Gvm+c/HyUkFl/Ps/+LTr1WUb72
	qWDVkA3xezErSng4s2jzg6ERb34k4Ac7WEDz9cyKjip81oBs3IS5jJwVJtODFhZ4nSAHwKIuHJe
	lKt4iA5JJVQESwRypAXUFr2rJE3jryQehz/GnIcaHf4ESPufoErfco93pnChQGp8rXV+SO/fr3j
	1v2LxS2l2a2rSHpm9CrZmtpWzls29BN7RmRrLDljZV4QhgeSwHPJDXlFwrRMpH+zRjRgCNYDpF/
	JY2BSZEL3dPiVl3BOLBTFljVLfEhDcG+oTmYyADsDn5XQWfv
X-Received: by 2002:a05:6a21:3296:b0:3e1:a27e:304f with SMTP id adf61e73a8af0-400ae433054mr11434270637.35.1795504493317;
        Mon, 23 Nov 2026 23:14:53 -0800 (PST)
Received: from embedsky001.tail6d6b2f.ts.net ([183.13.19.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfcadffsm6475836a12.9.2026.11.23.23.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:14:53 -0800 (PST)
From: Yonghao Zhang <hyz3367@gmail.com>
To: mathieu.poirier@linaro.org,
	andersson@kernel.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yonghao Zhang <hyz3367@gmail.com>
Subject: [PATCH v2 3/4] remoteproc: core: Guard against a missing stop() in the attach unwind
Date: Tue, 24 Nov 2026 15:14:08 +0800
Message-Id: <20261124071409.972-4-hyz3367@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124071409.972-1-hyz3367@gmail.com>
References: <20261124071409.972-1-hyz3367@gmail.com>
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

When the subdevice registration fails after a successful ops->attach(),
__rproc_attach() unrolls with an unconditional ops->stop() call: an
implementation without stop() turns that error path into a NULL
dereference.

An attach-only implementation, such as commit 1168af40b1ad ("remoteproc:
k3-r5: Add support for IPC-only mode for all R5Fs"), has no stop() and
can reach that path.  Skip the rollback call when there is no stop():
with nothing to roll the attach back with, the processor stays running
and the failure is reported by the attach attempt itself.

Fixes: d848a4819d85 ("remoteproc: Introducing function rproc_attach()")
Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
---
 drivers/remoteproc/remoteproc_core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index e44b45510b4e..8c3fc85b8f04 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1357,7 +1357,10 @@ static int __rproc_attach(struct rproc *rproc)
 	if (ret) {
 		dev_err(dev, "failed to probe subdevices for %s: %d\n",
 			rproc->name, ret);
-		goto stop_rproc;
+		if (rproc->ops->stop)
+			goto stop_rproc;
+		dev_err(dev, "can't roll %s back: no stop()\n", rproc->name);
+		goto unprepare_subdevices;
 	}
 
 	rproc->state = RPROC_ATTACHED;
-- 
2.34.1

