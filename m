Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463105;
	b=2B1DKOjbVQ8+TuWFgoz385dJhdIy4V0MmFhlfyJaB+XR3hYG+NkOibCyJRVEQPC8T3uj
	 TpPKWjSdoxvMmpPtfnT+/Nqi3ZwPRolcHZ8F6j0L78ZZJboR1no2BBwyx6pmmE9hiZqVR
	 9jPl2827R0QdZ2//k5esoQAMbuIE4CrVA6tFcfxu/W6Qc2ZHxmDpKxBcLA/YW0LDO3c/2
	 HG/pr157wtHg6FI7J41aofIkKLxjowe0PWe+P1Jp/9QfHxTa1nfXckErMpP7uTXMATtqr
	 FrUd68dE8wPSV7ED1mmAorOobz6ns1Vn1FP3FCuEKQejDWzwIhcvf/EanqDSP+2snWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=1bc3ZAhd4+SVXTTVw8lsSlI098J8fRsmi/uK0OqvNQs=;
	b=hOImISOUvW8Kqvi8++L8MlLm07puUQbbVTqMN/FA7IJXr2odGGmxIhpmhFYMmB3hIVNz
	 8TmPsPydFCFqnqe56nXai84EI3iqM/+XM6GPpk6PjeM7Wat8TiLW8g8VtAUWv5izA16C5
	 uEj7B+skoSIY15H6W18uMBEWhwSYowuiq2wXSThNWV+5y5keCqGC+s4+dseZE/EUiRB5n
	 21wKfmYSzdy60N7KIlsTXwgkh63c6wwuxBw6QdqFS8fdxJq7vrs2ELxT5IhmzfIOq1z9t
	 Gj/XV7Jg6iswkNFCeBYKV6RuIRWsSdXpuC77QhA0b0P95P2+YZwwBstuJn5XhVgZ3yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hmfxdSXQ;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FA9606A31C
	for <linux-remoteproc@vger.kernel.org>; Sat, 31 Oct 2026 16:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82FA9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hmfxdSXQ
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2887433eec.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 31 Oct 2026 09:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793463105; x=1794067905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1bc3ZAhd4+SVXTTVw8lsSlI098J8fRsmi/uK0OqvNQs=;
        b=hmfxdSXQagFrJ/RPtvA0lmlfJqROZlewPSFHXlNCCaHmmNOK806nQsk6AQIsRyf5X/
         jmgFiNDskJpx9XTfsZ1wEFW9yM4HlVSO25EsersxA3hlXbfmPQkawUXi2yJqVTNfIL3U
         6MXc0cxMg0mvVYwWtxJ4Kcf4Ev4eUjns61ERrE97DXjMVFe3yHy5VUGs/N8uBQw8hBxb
         MVrdpcrS4sWZF0Ms5HaJNDM9787iLl4ydC50B4wLXx1iSXjNvNUKjjZOv78l+NdcRNO5
         6u69HTzN3heSc/o70KswsUVsb+sHoj4gmOY3qSQDexHLcHuhHbhLZpGC9i036X1/6jOM
         GxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463105; x=1794067905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1bc3ZAhd4+SVXTTVw8lsSlI098J8fRsmi/uK0OqvNQs=;
        b=sNbzRss3rf3R7F0RDhnoN9plRccpe8IL9Bw7FuLIXRffs7qbl/9nv95byi5f8WScXk
         qtF/1AUe9EteMSuRLOAbC9GUYbqmLFg2IOUqoZVmHteJ5zbezhNTBfWzqfhMOTqsPNRS
         Zm72zb3/sglTxwutdkejyopEbxLxNe0X3AYAa+uVPt4bkHzdjhiMe0pF4FuIOfe9h930
         43wmKH0znxH2+gR/hs8CiL58mUp9Me0Nml+K9JDBQmI0S1/QIoRUVeyGjNbLh1EmjIVk
         9bDAua4xVl/1aOvv5S4lRjIj2aV0oeb/zxg7kz7boNDIjM6KgPg9FEifFRSBJJlJfpQW
         ZA0Q==
X-Gm-Message-State: AFq9FYKRjDK4sLVA+zrhr5iHMBpCioktdqP8iEvWNksxxo5aUXHUvLdL
	cCdKhXraQqAX8R3G4SmBLfyOomzswgCJOUZkgzxlq1fdE3tVOa7NFQo7
X-Gm-Gg: AYBFou29ipqWYkxqvpxqzhJW6MdqrXGZNbkjfqGvLi+Jgqi7fDeufokvKEJcnkfisWE
	XhQsnMMLvoojGVtwvIetqSPh3rdqZj1QuTYAhVOBhQoPr2+/Yhrus8WjCKWXh9z23DIV3H8rkas
	bmClt2ZKA4WFHJLn7oNQME3QymYa1Cvt1mWBXIPd07Z8gKjykhzUeARmR4cfkwA//DyalsmqFeM
	SBQkWJIGNzJdFj7KzoiqN1EUK/Jqg3TKsbh8tZmFyeQMmGVx+SRFAdg4o/czrNakWX0N3lURg8j
	V4s+TQ1S4icRTTlPaZA9TIX7tPsAXkNFM1Ng99Go5sHwWAuSghmvB1JMxdqUIRpBOXOnJCkUydx
	Ry+gd16GUiZBOnQaFid7EF9KnQ+Hc8skKvqTZPz3rp1Nh0uUAfwpLbBMK3TRGSw6Su41N5Pirhm
	zfzHKorJu7eajV2Gt06eecuM4dF4hQv1iUrPEsWlbkcGfc3jIgbZnE9kRSoDt1cXIESrVFTZZsW
	KaHyAGqFl3hxNInlJ8uNEYNQBPbh7RG2wHEt00I5UAymiD9ezeV8LsKYNOBYmtaq5yjvlQVhkDN
	edgcKZiAVkcC6pSFLABm65LpAwzQilWuzRg=
X-Received: by 2002:a05:7301:82a:b0:351:dbc:b663 with SMTP id 5a478bee46e88-36a4244f9f6mr8782238eec.31.1793463104342;
        Sat, 31 Oct 2026 09:11:44 -0700 (PDT)
Received: from JMD ([112.133.220.140])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42952e1csm20270364eec.20.2026.10.31.09.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:11:43 -0700 (PDT)
From: Atul Akella <atul.akella@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Atul Akella <atul.akella@gmail.com>
Subject: [PATCH] remoteproc: core: fix integer overflow in rproc_da_to_va() bounds check
Date: Sat, 31 Oct 2026 21:41:30 +0530
Message-ID: <20261031161131.1647-1-atul.akella@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
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

offset is calculated as da - carveout->da and stored in a 32 bit
signed int, while da and carveout->da are both u64. For a
sufficiently small da, the 64bit difference is truncated into the
32 bit int, bypassing the offset < 0 underflow check with a small
positive value. Additionally, offset + len > carveout->len can
itself overflow when offset and len are both large, providing a
second bypass.

Rewrite the bounds check entirely in u64 arithmetic. Reject
underflow before computing offset (da < carveout->da). Replace the
addition-based overflow check with a subtraction-based one
(len > carveout->len - offset) so no intermediate sum can wrap.

Signed-off-by: Atul Akella <atul.akella@gmail.com>
---
 drivers/remoteproc/remoteproc_core.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 23f8539a99bd..d5fa9d23bd5c 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -198,18 +198,20 @@ void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 	}
 
 	list_for_each_entry(carveout, &rproc->carveouts, node) {
-		int offset = da - carveout->da;
+		u64 offset;
 
 		/*  Verify that carveout is allocated */
 		if (!carveout->va)
 			continue;
 
 		/* try next carveout if da is too small */
-		if (offset < 0)
+		if (da < carveout->da)
 			continue;
 
-		/* try next carveout if da is too large */
-		if (offset + len > carveout->len)
+		offset = da - carveout->da;
+
+		/* try next carveout if da or len is too large */
+		if (offset > carveout->len || len > carveout->len - offset)
 			continue;
 
 		ptr = carveout->va + offset;
-- 
2.43.0

