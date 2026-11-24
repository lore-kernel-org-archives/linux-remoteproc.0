Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504501;
	b=04YSq+GjnxxWSaDgeQNyl8IY3DSVZjM/D3XoXPU/mD93pt42rc07VKvU02XUkTh62MPD
	 L7s+JTPFOxx2Kh0GV7kRVyv8kT4/HRJFg4AdKPe7j3IVv27iVy/nnJ7Gjbfrxv41TuIV4
	 8yJ/iR5INonzXAHgL8aZ7jQ6Wfvx6k5sKfm6XpAxyFN2clypL40rdPmHs/zkcUuQtNpxF
	 IEfH2XCwSYRwROZz9G1xu31gGG7j6NwRoTO+CBwQCQt1wGKYXmPHRTS3aBJlkm9bnM3/H
	 +4wo1b40l1AUZ3F8gIwg97Bh/GJh2Hfm8USbo4TDB9lm6RaQbNLTXZArWADjF7u1zAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XBwqhR3m8bOQBJNfF/ebktnsPnOGA6K0nJo6XELezxM=;
	b=Cep6tXPoCNLOnA4RVrEUX5w1U29uVA/PXNXXGiqKYyAtsrXhYBYLilli/D2QGegSLRa3
	 BQ0kt/4lMOFFW+DSMjw2LcSY1r7UhrLXm8XdU8gLRtl/TjQ4j1cKHlxoj4tzSaAyRbnEy
	 pRKjvanEA+sJ2ayNufgCtmH1CM8V+CIkQmMUH+F4I+eimsHN2JjZnZcLWIhbH+in63tTJ
	 Y2CYVauElJ9nb1Ss45QL10toFS7Grc0IXjL+tiSPe6g3/fVnbJz0Tt3JmdEJqoAqwBVnP
	 2QNsrpuE5310DN+5EjhyeDPf8KZJJTeRnNXHD/EuNsACOH6p3e2yddefFkpkJhXIy9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rWSU83+X;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BC7606A326
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 07:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1BC7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rWSU83+X
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a070781f63so1885666b3a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Nov 2026 23:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795504500; x=1796109300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XBwqhR3m8bOQBJNfF/ebktnsPnOGA6K0nJo6XELezxM=;
        b=rWSU83+XdpmiYHL38jImZxk8bZbvq4qxdfof1BKQAKv/drMh9RfLj+hG7//4KHbTsI
         2k9L/f19anOKfkVoYAUTKKpYCi5Rclm4WPIG6QzY3gQ+p33qtF/LPX4SrFW4ZGDATuoT
         IAuopI/okore7UPXFsmGws9fEvaucv+vylrDJPELK0JY41EdYYYTuw+XvuErdvHl/WDV
         MP9DzUxIarlv/MNLOppnefOTZLT+n07SBAOihH0JYWUfHjT7H32JNsvuEOA1ceIvA1wX
         5LiULY414lUvh3otAUp8NlhxuKkxxx2RmaDBdEW+PMgvG8EqweR1QcUO8l8STXwMGljq
         szOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795504500; x=1796109300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XBwqhR3m8bOQBJNfF/ebktnsPnOGA6K0nJo6XELezxM=;
        b=sCScjkHIo6aP9HISC2l2Zb1GG7+qIeXG/PRNs4Ay/awv9s9t4sJH0JeL093WtCj+1i
         Mzh4q/07osE6kaMWvB2RE7woEmOFlEEQ46DsD3C0n4OySbd0VL+SrRiGzOzPVTBcRIoH
         OPuyQd0XotjxMB9Oa9QhWsB5nziHVCfANzYBE4cFzwCUpQzmOpeWVJCmsd0oI87lup18
         VJiQXXcSRLRzz5liTYLj+5TkYJrduuyBSVgLl9uscX6nkGDeR6sRfRWVNYag4/MBdg8U
         LWuIaubXs8AT0VsVCpzhMM360ux1HswN0P0wm14bFlG2rUw8yyELnpVyltcBPQyy0Itw
         7nzw==
X-Gm-Message-State: APuU4Z9k1n9qGeEOdK0HKCkB9cCo1Qsgp9doUuykb/RzJj4WXxgPlm/y
	bNtpCj/WIavpbksL3yVVQSPuW6M1pO5upZw42oTDUim04LxgGE7wrGd3
X-Gm-Gg: AZFdTZcacDypE99DnNxBiP9gssqEAAyoQ+Wba22+HCgdD1ijske0GoUn/a8ZphU6j04
	IeeZk3dU+neeRLErXLSRLriYYz1qMoqVhhFlO2V2nt0DmGsoioig97o+yzessbz3uvm/aj4F7pn
	OZkxk12pLjkV8eGnWFS3OLIbGxVvvwjFEYiCKBV5nI2V6l3OOR0Adc1zW3a6MUDMQNcc5Okd6F8
	KOFZXvJzoSDXNyxn/1qDI/CmRXUska0zg3kB/yCqzMqi7UP7ZxJX40Tb90dTglngGeVrQV6u4PO
	R485oDeuC4+cA+okr7BjT2GhPmhmvoUDwIp/gHGSsdemHb7EPofoe6VHT3K9WnoYvCHQCaQnpgY
	TXA00blVMTMx2hXs1rwrp0R42qS2Hqd2jijOJpKP+enQjBN07FE3XE3gwRVmyqm3TICME2lr3kt
	SiIm+KxKu4fx7cPP/PtL4hWKHAK3LPqJhk4DE8EJqpVeqsA0BJioWYtNfn/PHWjKYgAtJNiEnSh
	F8l5Goe3u09ohQvohuaJIWt/nO467t/7AMTjeMxlXKxH/Q066VkbIdCPGn8O/vpl/kF8bm5oh5o
	vZ+wVKHpmgnnrVEUb3P6l7XOt8bkGGX28UL74pjkwXjAPrHiV+WRMjocTr0Nke1kxVPa1w==
X-Received: by 2002:a05:6a21:798c:b0:3e2:117a:62ff with SMTP id adf61e73a8af0-4014c2573d3mr11960703637.61.1795504499863;
        Mon, 23 Nov 2026 23:14:59 -0800 (PST)
Received: from embedsky001.tail6d6b2f.ts.net ([183.13.19.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfcadffsm6475836a12.9.2026.11.23.23.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:14:59 -0800 (PST)
From: Yonghao Zhang <hyz3367@gmail.com>
To: mathieu.poirier@linaro.org,
	andersson@kernel.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yonghao Zhang <hyz3367@gmail.com>
Subject: [PATCH v2 4/4] remoteproc: core: Clean up after a failed recovery
Date: Tue, 24 Nov 2026 15:14:09 +0800
Message-Id: <20261124071409.972-5-hyz3367@gmail.com>
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

Release the resources on the failure paths of rproc_boot_recovery(),
the same way rproc_shutdown() does, and void the power count in
rproc_trigger_recovery() when a failed recovery leaves the processor
offline or detached.

Fixes: ba194232edc0 ("remoteproc: Support attach recovery after rproc crash")
Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
---
 drivers/remoteproc/remoteproc_core.c | 31 +++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 8c3fc85b8f04..3e700c94110d 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1800,7 +1800,7 @@ static int rproc_boot_recovery(struct rproc *rproc)
 	ret = request_firmware(&firmware_p, rproc->firmware, dev);
 	if (ret < 0) {
 		dev_err(dev, "request_firmware failed: %d\n", ret);
-		return ret;
+		goto clean_up_resources;
 	}
 
 	/* boot the remote processor up again */
@@ -1808,6 +1808,24 @@ static int rproc_boot_recovery(struct rproc *rproc)
 
 	release_firmware(firmware_p);
 
+	if (ret < 0)
+		goto clean_up_resources;
+
+	return 0;
+
+clean_up_resources:
+	/*
+	 * rproc_stop() has already switched the remote processor off;
+	 * release the resources of the boot this recovery was trying to
+	 * restore.
+	 */
+	rproc_resource_cleanup(rproc);
+	/* release HW resources if needed */
+	rproc_unprepare_device(rproc);
+	rproc_disable_iommu(rproc);
+	kfree(rproc->cached_table);
+	rproc->cached_table = NULL;
+	rproc->table_ptr = NULL;
 	return ret;
 }
 
@@ -1848,6 +1866,17 @@ int rproc_trigger_recovery(struct rproc *rproc)
 	else
 		ret = rproc_boot_recovery(rproc);
 
+	/*
+	 * A failed recovery leaves the remote processor offline or
+	 * detached, where rproc_shutdown() cannot release the power
+	 * references: void them.
+	 */
+	if (ret && (rproc->state == RPROC_OFFLINE ||
+		    rproc->state == RPROC_DETACHED)) {
+		dev_err(dev, "failed to recover %s: %d\n", rproc->name, ret);
+		atomic_set(&rproc->power, 0);
+	}
+
 unlock_mutex:
 	mutex_unlock(&rproc->lock);
 	return ret;
-- 
2.34.1

