Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990625;
	b=E8aJaVmyUZ12BZBiG827KACnAs1CbmUz6R6gdqj+6QNqyTWHbo4U/2zkNl/t77bImd7X
	 50QYeF/gzGZxtZCwag1xD4HuG7Y5M4hiuaLWzMxnrMCPQJM04Vv5SV6kVjDxiuaEj56KM
	 ZzBq99s2rxk3IV5w4ZeJyUpm1ajstgnxyqyVZ+oJsEAYLIpWCWhHJgRyoWDXlp837/akL
	 H9A1n8Qw8drZ37xFnxPKH3S96RdHgkY/t8DADHH2ZUDhf9ZGxVEf4qF9LfoQ1V+wtxfNs
	 P8jPmlDTp372YweTQFxgKKIJ0VfdtLBRveVrJ5rDZJaNR7dTmk+JI7yU/V4oKmvj5YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NbbVNlV0Ddm0y0fksEH13++wT1yMdo/rDKxFHAfvtG4=;
	b=xcWmbe3IVkWy1GjzYFE8nTlm2lu2vaOqzxSSTcAGdn3BgUeGpsRXQEPQhtoAcxDBNBAb
	 z5dnix1Wrs7ECiyZJzeXXE3k0PeR577g5AOgijHaQPb3XnNwX6K+r6oaJSDMwtYHt4Pi9
	 wqPtcq6Ro5pgEYQHz8sDM9KTi19wIS6CTTS5E/Qhy7OAc2vr2vybQJOiwHPgL0Yl80jBS
	 6cq93/0j5IUsOu+cDi9V6xsx4plW/YaT/LkF7fiQXEuFP94dTMTItnAojCv0l8z0owN6Q
	 D/vKX/d1GemkRT5l/6Y5V/MhehpINz0MxkFANg9NnGk6SnPxRdC/NiIlfVJCCzTabqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nHkTQfou;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B62E606A326
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Nov 2026 18:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B62E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nHkTQfou
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36ff9c9da34so1225302eec.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Nov 2026 10:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990624; x=1794595424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbbVNlV0Ddm0y0fksEH13++wT1yMdo/rDKxFHAfvtG4=;
        b=nHkTQfouN0pMR0HzTsq3ECgLIEOgW4xZdy0/pm3K1NbeenoJMembQbTxOIUb9TBjR7
         qip0r3zi2Mwgx9CXiVYKhRPt1lmAroA5RQIx5tN3sXr3uWtH00n51KLxJPKLX/AFJ9nZ
         e8AGnWxWrmFijQf7Ttt+CRvJBUpKb6Q8PSS7G6OHAQrJ1j+5XlPBS43DvBkGpRK5obh+
         RcckWG+JFdcUlQUgVtN0GtLBrhcaJ7XG/7XGKiDCEKBu0xb9VQ3kQzlQ9bK9RyoLCRE5
         NX0//eXIAGMr87MTEz8NgrcCltGZvDOvscKiZdHITOaRBRz7HW+BdFMzBoeO8ZIPaPH2
         mCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990624; x=1794595424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NbbVNlV0Ddm0y0fksEH13++wT1yMdo/rDKxFHAfvtG4=;
        b=j9ZxW5EG59gfbCk6hOrgEi7vlY1Thoz5RmTInFUmk7SHW3OVswGwZue0KSET0mE9XZ
         rAYf5WYvPwi+VtTu6zSS2eCm0/kQTtMfAT4V9LhCDpUbYOKGjVTSngDtMjYfL5Pr3Jm9
         GCIwHEbOMrHKbFF2v2MWfLUwP8v/n9sd4n8jR7j7Be0qF97X5RvTpnp2GcIAJRWXW05O
         YUriBkYP3gnGDC2cq37GzRjUtWlKcDomATRridLx0XkT3xN+vna7y6LO9g31Ot2XshT+
         KV1u/0zIgyXDoBsqzIHi7RNlg9Zoycc9XxZnATRLUJByZRp2Q50kR7RLVfpSOSQMu9SR
         Ze+w==
X-Gm-Message-State: APuU4Z/4xpu8k0jtgFt8DPaqYKKe160QOfZYJMHK2+QfJHLeDhGvBSqP
	7saGAVpeTy7C9ooQ3OPferkuWGlMEYN/+ryy4REDlkMlwnj8wQl4Q2Q8
X-Gm-Gg: AYBFou14M9YYvaw+2TqYTgomi2D+WUny/51s84tv05XRec8M3BKWlZkwmOjFfU2O5w+
	qwtFEhHvgpIogUesTMUEs0qAvcNdHW78cnFwhXovkeAevHJ+98uPc19ITluVXsXCPH1viz/NUMf
	HW34jOGWxxPVX7k5o8w4gJXnWGJTImKGWOuQmuTca9Kix6ufwanNbJGMpuHdQP7O5BeEyrjxiH2
	9K71m13IGDb9A8m4zmea0o9diT8+5odeu2G9BKOVih6WM+Bl7XLZnYam/bqDUEp8Ro6Xznsa6cy
	xaM8bEq9he4Rp/EkYbhvflmPy80+BSsIM9erfhDdMqKXN+7eo7V4fY401o2/6187WIAYFGGWsv9
	PLjL9yzyRiAVLrrzlCpUNjuBY2HptieA8ATcvVwqIDYel81NHxGr4KAEePQVmgMLU66tcMtnRsO
	/Gk1+RI5KEz5pCK8MFYcTROHuYofCJOikpfVCfQs4wUDfT3T5IHJRpM26oBYBxwoLKCQBpxWich
	4bV9JzAObvidD2qtFg51LKA3d7LLmIZNcj+B8Z1pJRdpOxbVuJBVAuMG2bObsH9eBT+eK+XWWsi
	LqKwAL0SBJBoDWMShOPZAkGozUmbrA==
X-Received: by 2002:a05:7301:921:b0:36c:9bc6:3ec with SMTP id 5a478bee46e88-36f72cc1d9fmr4534575eec.3.1793990624382;
        Fri, 06 Nov 2026 10:43:44 -0800 (PST)
Received: from JMD ([2405:201:d028:10ff:eceb:5028:6b10:da7c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea414sm8278073eec.16.2026.11.06.10.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:43:44 -0800 (PST)
From: Atul Akella <atul.akella@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	sibi.sankar@oss.qualcomm.com,
	quic_srichara@quicinc.com
Cc: linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Atul Akella <atul.akella@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/4] remoteproc: qcom: Fix bounds check in q6v5_wcss_da_to_va()
Date: Sat,  7 Nov 2026 00:13:10 +0530
Message-ID: <20261106184312.100-4-atul.akella@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20261106184312.100-1-atul.akella@gmail.com>
References: <20261106184312.100-1-atul.akella@gmail.com>
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

offset is calculated as da - wcss->mem_reloc and stored in a
32 bit signed int, while da and wcss->mem_reloc are both u64.
For a sufficiently small da, the 64bit difference is truncated
into the 32 bit int, bypassing the offset < 0 underflow check
with a small positive value. Additionally, offset + len >
wcss->mem_size can itself overflow when offset and len are both
large, providing a second bypass.

da and len come from firmware's ELF program headers via
rproc_da_to_va(), and the result is used by the ELF loader
to write firmware segments, so a malformed firmware image can
cause writes outside the carveout.

Rewrite the bounds check entirely in u64 arithmetic. Reject
underflow before computing offset (da < wcss->mem_reloc).
Replace the addition based overflow check with a
subtraction based one (len > wcss->mem_size - offset) so no
intermediate sum can wrap.

Fixes: 3a3d4163e0bf ("remoteproc: qcom: Introduce Hexagon V5 based WCSS driver")
Cc: stable@vger.kernel.org
Signed-off-by: Atul Akella <atul.akella@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index b391724cfd08..e67dc3ff8a07 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -740,10 +740,12 @@ static int q6v5_wcss_stop(struct rproc *rproc)
 static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct q6v5_wcss *wcss = rproc->priv;
-	int offset;
+	u64 offset;
 
+	if (da < wcss->mem_reloc)
+		return NULL;
 	offset = da - wcss->mem_reloc;
-	if (offset < 0 || offset + len > wcss->mem_size)
+	if (offset > wcss->mem_size || len > wcss->mem_size - offset)
 		return NULL;
 
 	return wcss->mem_region + offset;
-- 
2.43.0

