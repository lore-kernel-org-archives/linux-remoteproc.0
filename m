Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990605;
	b=uWWEn87uWDc2Ohz7HZiTRbgiUURUk5D7GzvQOLt5t/wDDMbLAQgY0+WweDPh4D9RLpVP
	 QGxKr4KxLlzSb8OdLymYHs6q11gRW/dB1oRYe0o2rtcUkp7cWfC1vsYC6JeahdvNVPv4b
	 /XI1+vGaO5QoIdvsptyTAYr9rmIlgT82s8Z4BSSsz1v4bqrlY13jZTlA3CO4G2L2Y2Swx
	 JIqMWsftCm5azUktxlZlcqjYJ5tgQkeDxN0VjmzRb8ncbol0kXkMJJREXQL3OuTLPUPHX
	 dale/S2W9xErKtzU7xTJCCFTWpswidKSZ6VPj6irrEc7282h9/1wJasVGguP4YP4gNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=fj9qCzoz3f+xnhhJ4C/ud2J0v2Gz6A5yTqsQ9J2hXWk=;
	b=PUYIf6tT3Wh93lr6CarRfCFuDVFcGPnrIjtj1YfLSCjJoMcqg9gcxn7HZBq9CmQ0D35z
	 iJlB9B5TSkEvPkmJ7vd5TO+fZPZJwVG+FsO0ZWdX+dxhM4FvDBUkZDWxwx6kxId95L9ZU
	 3DUE0H/no5JKi0o3uZacu5gorcKjnSCr8SVR56CT7vFwBTZzT4k9KGPVrU8ZKa5Lfi8UI
	 Lzdz4dzEvw+CcEifudLrR3vMSBg4C09/bmT0HbKVpvW19dn34aULGtVBvF9kNqDvBZM4+
	 WIWdIog9dLJcbAjoXB6jle1mcMf9Vi7owVJInzmHQAornHYztxRyUt2889PKPy92r9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ALdpfCJN;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6546606A329
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Nov 2026 18:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6546606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ALdpfCJN
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36f8cdd30beso1331694eec.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Nov 2026 10:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990604; x=1794595404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fj9qCzoz3f+xnhhJ4C/ud2J0v2Gz6A5yTqsQ9J2hXWk=;
        b=ALdpfCJNPx/mXbaQBrqXDAxCA4aSS1RIH+Wy1UveDNxBxcB+3TKfupyaGDOHtHYtCB
         guVedBf11daK1VGrd4ZnKQxX27CGa+GzihR4LywB2BB2dMQXNXtXgMj4iVVrnJOSIbgK
         SSEI8TiOfuRC37kjSo9Ru/gvxhNPLVg8jGx+TWKB8wyBABRh0vTfL0SB7K1yV0IUyzd/
         GRBmAO2FfAxZM8Uq2b6A6TfLHn5/h4wC6+e9PktoUr2V6NDzLe+J2rdx1+LiqUMX+QU9
         7LdTHD+T5Zln4TlvFpZ7dRKOqlOjqRVR0bd7y8kDe7UB39yFqRYBGx4VA1RH+QQbPa6A
         HhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990604; x=1794595404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fj9qCzoz3f+xnhhJ4C/ud2J0v2Gz6A5yTqsQ9J2hXWk=;
        b=Oy3vglGccYp3Qqms7TaMokS81xIUfQQMq1P+a6Xzr5IbcePHLIiHkyYDwNm7g6GAKn
         LocImWtyuqxp4BYjlbE4jnY1+Lfto+rjtG5n/PWU7KwGncMzX+Q8Z3RseMcH+NcM9dTw
         sxgnB8I7pZoxQBo624n+YC68eDDt9n1T8T9zhfPjbJLltyCha1tDRJTJb0BktpQdRuDT
         G3fuA/ty7d3xF62qDobJ6q1TGMFO6Qx4Q5ffyQ6KCERcwx6f2gDq7z6CpooHD52Sn8dB
         ttuo/fJiybNHLCLXZ481Vjg4SXfjaCWu7qqXZTKfx8nv62mwH+5usPLzofBQX/Bb4AED
         EIhQ==
X-Gm-Message-State: APuU4Z9dvRf6b2YnMWA7mZ1y+LlBo70cmxC+pGcVyMLaaboa7MoxKLW2
	Re5WrCun+L8CsVJ6U4ek5oDldYWyMhLhv0hmyfkPo8wT/8as4Ht+myPk
X-Gm-Gg: AYBFou0p1I55JuEkrahvRGlq4I6I3yJGVzoRCwh/2thXsJiOM6vWayuWcnT9sQhthDI
	1OTzsSNMAjEVYEYkEuCE6x5in83rdKt0O+VaD6AhYLl5+r6N9mcqN07TQOEng+Zlwwnwuou3KD6
	9L094HtsdD7Cbdt9p3YA7bPkuwgp9LOvYhwf3h3CjmYa11EFvRbF4BPSCeVITzyWoDnEUlpRKxC
	hr2/Wz/xa9UqduoyuYtX3QZ44F/I/hUk9TecV3QV3bRazSlWpWVurmScoDRE4xxmUJKuyFTxb8R
	2WPZzK6AVw2ugCKSuRWzg9h7w8N2up3QAIzdirr4jRZgViBJRhALMUKEdkDZSiZMIb7GEyCYBeA
	H8C7naWHjzM0pX1vecuFWO54BLLYOqfiRtgvaXjIfCnIBE7c4yXGl009713pHVYaZXZq4wK5cEb
	4Add6VLpIuqn82yOu1wi01vwTgy9rjwq3VzF9pcPBjk01OiOVLUfOLYjOSgg1lBQmKY+0IJZCLe
	gC/pS6FhpjJhGialHnPYz/9WEAL0y4Ua4BVwxFyaYWtEAv7RzVeGsAgjVEmayuudaTubjX46GRn
	qteN54LVloVfD1Yc7nGSOmEPbLTFUA==
X-Received: by 2002:a05:7300:10d:b0:36c:c434:b6b5 with SMTP id 5a478bee46e88-36f76621095mr5197718eec.17.1793990603771;
        Fri, 06 Nov 2026 10:43:23 -0800 (PST)
Received: from JMD ([2405:201:d028:10ff:eceb:5028:6b10:da7c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea414sm8278073eec.16.2026.11.06.10.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:43:23 -0800 (PST)
From: Atul Akella <atul.akella@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	sibi.sankar@oss.qualcomm.com,
	quic_srichara@quicinc.com
Cc: linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Atul Akella <atul.akella@gmail.com>
Subject: [PATCH 0/4] remoteproc: qcom: Fix DA-to-VA bounds checks
Date: Sat,  7 Nov 2026 00:13:07 +0530
Message-ID: <20261106184312.100-1-atul.akella@gmail.com>
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

This series fixes the same bounds check bug in da_to_va() across four
Qualcomm remoteproc PIL drivers: qcom_q6v5_adsp, qcom_q6v5_pas,
qcom_q6v5_wcss, and qcom_wcnss.

In each driver, offset is a signed 32bit integer assigned from
the 64 bit difference da - <base>, where both operands are u64.
If da is smaller than <base>, the subtraction underflows before
the result is truncated on assignment. This can produce a small
positive offset and bypass the existing underflow check.
Separately, the offset + len bounds check can overflow.

da and len originate from firmware ELF program headers
(p_paddr and p_memsz) via rproc_da_to_va(). The returned
address is used by the ELF loader to write firmware segments, so a
malformed firmware image can cause writes outside the carveout.

Each patch keeps offset in u64, rejects addresses below the
relocation base before subtraction, and uses a subtraction based
bounds check to avoid overflow.

Atul Akella (4):
  remoteproc: qcom: Fix bounds check in adsp_da_to_va()
  remoteproc: qcom: Fix bounds check in qcom_pas_da_to_va()
  remoteproc: qcom: Fix bounds check in q6v5_wcss_da_to_va()
  remoteproc: qcom: Fix bounds check in wcnss_da_to_va()

 drivers/remoteproc/qcom_q6v5_adsp.c | 6 ++++--
 drivers/remoteproc/qcom_q6v5_pas.c  | 6 ++++--
 drivers/remoteproc/qcom_q6v5_wcss.c | 6 ++++--
 drivers/remoteproc/qcom_wcnss.c     | 6 ++++--
 4 files changed, 16 insertions(+), 8 deletions(-)

-- 
2.43.0

