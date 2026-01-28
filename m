Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A801341056;
	Wed, 28 Jan 2026 22:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769637781; cv=none; b=mfHxC7qZHSmjQAynoqmmq7nl/6OnuFH8NGhso3jo1/lWfJDfmInBdoHToOaBtLP1g4OIyx3E87h7FybR2CS+IpqIBBYveT5Ojdn5OQMRWFboEW4pKl6lVh/DDm1e1PlxEGAlJQ5SbL1C/lMFR+306vEeHEgmFaR7wtN3lht2o3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769637781; c=relaxed/simple;
	bh=bSbls0O/SiFfLjS559f2iNTR5LptlW8BYT73wraAzyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MxqOQr7ZDkvC5JumSztlBgPamME+HD/g2jixHApxyf7AN+MIw0+nSvp2l1W+ykHKVeroY32yU9QUR6ImjYYcMBOeQEc0l/EQXeMbrjvqjP3jAsYtH/ZCTfEgnRL/JR13pzNymRgqkQ62/Gunym/OIiBrMwAmrrs4mCK8MrrRwiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MzcIpVss; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MzcIpVss"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FDFC4CEF1;
	Wed, 28 Jan 2026 22:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769637780;
	bh=bSbls0O/SiFfLjS559f2iNTR5LptlW8BYT73wraAzyY=;
	h=From:To:Cc:Subject:Date:From;
	b=MzcIpVssy4drGtPKDvj13x0fQv4y/IzAkUMb7TxXKFhBLSF8XFGng4VhpeBOU5IxI
	 zwe8OonQUBzK4I4CzNQC3Ec3j7NbPwOshjtHAY/M1HnDww0iAxbCiHV0JiU9ib67x0
	 qV/8yY1dIBikC3AW+0Lohp6TinbMc5TEmPOmCcNnqfQZwcrcGQBLd1DQ49wzN+kNZ1
	 rAKkla+FfBr9BfSEGW0Zf3pbvp1u4k10KM6oa9dN9rCSKvttjbtvjloMzkneTEmaas
	 4x7mVvWQmT2XAZCZYUp8nVuvCJdTHRmAMYNCZd4QuPHz5AH1tajPxDir5ICn/rjCbD
	 vNBC8RGPiNebA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: qcom_wcnss: Fix reserved region mapping failure
Date: Wed, 28 Jan 2026 16:02:42 -0600
Message-ID: <20260128220243.3018526-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit c70b9d5fdcd7 ("remoteproc: qcom: Use of_reserved_mem_region_*
functions for "memory-region"") switched from devm_ioremap_wc() to
devm_ioremap_resource_wc(). The difference is devm_ioremap_resource_wc()
also requests the resource which fails. Testing of both fixed and
dynamic reserved regions indicates that requesting the resource should
work, so I'm not sure why it doesn't work in this case. Fix the issue by
reverting back to devm_ioremap_wc().

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reported-by: André Apitzsch <git@apitzsch.eu>
Fixes: c70b9d5fdcd7 ("remoteproc: qcom: Use of_reserved_mem_region_* functions for "memory-region"")
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
I created some dummy regions matching the flags used here and did
request_mem_region() on them successfully, so I'm not sure why it
doesn't work for this driver. Something else is requesting the region?

Perhaps there's a deferred probe and somehow request_mem_region() is not
getting undone correctly?
---
 drivers/remoteproc/qcom_wcnss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index ee18bf2e8054..4add9037dbd5 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -537,7 +537,7 @@ static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
 
 	wcnss->mem_phys = wcnss->mem_reloc = res.start;
 	wcnss->mem_size = resource_size(&res);
-	wcnss->mem_region = devm_ioremap_resource_wc(wcnss->dev, &res);
+	wcnss->mem_region = devm_ioremap_wc(wcnss->dev, wcnss->mem_phys, wcnss->mem_size);
 	if (IS_ERR(wcnss->mem_region)) {
 		dev_err(wcnss->dev, "unable to map memory region: %pR\n", &res);
 		return PTR_ERR(wcnss->mem_region);
-- 
2.51.0

